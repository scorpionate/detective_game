import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:detective_game/game/scene.dart';


class DialogueManager {
  final Scene _scene;
  var _dlgCache = AudioCache();
  var _dlgPlayer = AudioPlayer(mode: PlayerMode.LOW_LATENCY);
  final List<String> _dlgFiles;   // Dialogues audio paths
  List<String> _dlgText;          // Dialogues texts
  int _index = 1;                 // Current dialogue to play
  int _optionalsCount = 0;

  DialogueManager(this._scene, this._dlgFiles) {
    _loadAssets();
  }

  void _loadAssets() async { 
    // Load audio files into cache without transcript.txt located at [0]
    await _dlgCache.loadAll(_dlgFiles.sublist(1, _dlgFiles.length));

    // Transform transcript.txt into string 
    String transcript = await rootBundle.loadString(_dlgFiles.first);
    
    // Extract lines from string into the list(1 dialogue - 1 line).
    _dlgText = LineSplitter().convert(transcript);                          
    
    // Dialogues should start from index 1(transcript.txt located at [0] in audiofiles list).
    _dlgText.insert(0, '');                                                  
  }

  void optionalClicked(String dlg) async {
    _index = _dlgText.indexOf(dlg);
    playDialogue();
  }

  Future<void> playDialogue() async {
    // Dialog has multpile optional answers, show complex dialogue
    if (_dlgText[_index].contains('(conditional)')) {
      
      // Zero cnts
      this._optionalsCount = 0;

      var list = List<String>();
      list.add(_dlgText[_index]);

      // Find following optional answers
      int i = _index + 1;
      while(true) {
        if(_dlgText[i].isNotEmpty && _dlgText[i].contains('(optional)')) {
          list.add(_dlgText[i]);
          i++;
          this._optionalsCount++;
        }
        else {
          break;
        }
      }
      
      this._scene.uiManager.showDialogueWithAnswers(list);
    }
    // Simple dialog
    else {
      this._scene.uiManager.showSimpleDialogue(_dlgText[_index]);
    }

    // Stop previous audio
    if (_dlgPlayer.state == AudioPlayerState.PLAYING)
      await _dlgPlayer.stop();

    // Play current audio
    _dlgPlayer = await _dlgCache.play(_dlgFiles[_index]); // Throws!
    
    // Shuffle audio; Index operation
    if (_dlgText[_index].contains('(optional)')) {
      _index += this._optionalsCount;
    }
    else if (_dlgText[_index].contains('(answer)')) {
      // Procced to first dialogue after answer
      while(true) {
        if(_dlgText[_index].isNotEmpty && _dlgText[_index].contains('(answer)')) {
          _index++;
        }
        else {
          break;
        }
      }

    }
    else {
      _next();
    }

  }

  bool _next() {
    if (_index < _dlgFiles.length - 1) {
      _index++;
      return true;
    }
    else {
      _index = 1; //TODO: Only for DEBUG
      return false;
    }
  }
    
}