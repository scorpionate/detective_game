import 'dart:convert';
import 'package:detective_game/services/local_save_manager.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:detective_game/game/scene/scene.dart';

class DialogueManager {
  final Scene _scene;
  var _dlgCache = AudioCache();
  var _dlgPlayer = AudioPlayer(mode: PlayerMode.LOW_LATENCY);
  final List<String> _dlgFiles; // Dialogues audio paths
  final List<int> _changeBackgorund;
  List<String> _dlgText; // Dialogues texts
  bool _isReady = false; // Loading assets indicator => true = assets loaded

  // Dlg management
  int _dlgTextIndex = 1; // Current dialogue to play
  bool _isConditional = false; //
  int _optionalsCount = 0;
  bool _hasAnswers = false;

  bool get isConditional {
    return _isConditional;
  }

  bool get isReady {
    return _isReady;
  }

  int get currentDialogueIndex {
    return this._dlgTextIndex;
  }

  DialogueManager(this._scene, this._dlgFiles, this._changeBackgorund) {
    _initialize();
  }

  void _initialize() async {
    await _loadAssets();
    _isReady = true;
  }

  Future<void> _loadAssets() async {
    // Load audio files into cache without transcript.txt located at [0]
    if (_dlgFiles.isNotEmpty) {
      await _dlgCache.loadAll(_dlgFiles.sublist(1, _dlgFiles.length));

      // Transform transcript.txt into string
      String transcript = await rootBundle.loadString(_dlgFiles.first);

      // Extract lines from string into the list(1 dialogue - 1 line).
      _dlgText = LineSplitter().convert(transcript);

      // Dialogues should start from index 1(transcript.txt located at [0] in audiofiles list).
      _dlgText.insert(0, '');
    }
  }

  void optionalDialogueClicked(String dlg) {
    _dlgTextIndex = _dlgText.indexOf(dlg);

    LocalSaveManager().addToOptionalChoices(
        this._scene.runtimeType.toString(), _dlgTextIndex);

    _isConditional = false;
    playDialogue();
  }

  Future<void> stopDialogue() async {
    // Stop any dialogue audio
    if (_dlgPlayer.state == AudioPlayerState.PLAYING) await _dlgPlayer.stop();
  }

  void _changeBackgroundIf() {
    this._changeBackgorund.forEach((element) {
      if (element == _dlgTextIndex) {
        this._scene.backgroundManager.nextBackground();
      }
    });
  }

  Future<void> playDialogue() async {
    _changeBackgroundIf();

    _showDialogBox();

    stopDialogue();

    // Play current audio
    _dlgPlayer = await _dlgCache.play(_dlgFiles[_dlgTextIndex]); // Throws!

    // Shuffle audio; Index operation
    _nextDialogue();
  }

  void _showDialogBox() {
    // Dialog has multpile optional answers, show complex dialogue
    if (_dlgText[_dlgTextIndex].contains('(conditional)')) {
      _isConditional = true;

      // Zero
      this._optionalsCount = 0;
      this._hasAnswers = false;

      var list = List<String>();
      list.add(_dlgText[_dlgTextIndex]);

      // Find following optionals
      int i = _dlgTextIndex + 1;
      while (true) {
        if (_dlgText[i].isNotEmpty && _dlgText[i].contains('(optional)')) {
          list.add(_dlgText[i]);
          i++;
          this._optionalsCount++;
          if (i == _dlgText.length) {
            break;
          }
        } else if (_dlgText[i].isNotEmpty && _dlgText[i].contains('(answer)')) {
          this._hasAnswers = true;
          break;
        } else {
          break;
        }
      }

      this._scene.uiManager.showDialogueWithOptionalAnswers(list);
    }

    // Simple, casual dialog without any options
    else {
      this._scene.uiManager.showSimpleDialogue(_dlgText[_dlgTextIndex]);
    }
  }

  void _nextDialogue() {
    if (_dlgText[_dlgTextIndex].contains('(optional)')) {
      if (this._hasAnswers) {
        _dlgTextIndex += this._optionalsCount;
      } else {
        while (true) {
          if (_dlgText.length >= _dlgTextIndex &&
              _dlgText[_dlgTextIndex].contains('(optional)')) {
            _dlgTextIndex++;
          } else {
            break;
          }
        }
      }
    } else if (_dlgText[_dlgTextIndex].contains('(answer)')) {
      // Procced to first dialogue after answer
      while (true) {
        if (_dlgText[_dlgTextIndex].isNotEmpty &&
            _dlgText[_dlgTextIndex].contains('(answer)')) {
          _dlgTextIndex++;
        } else {
          break;
        }
      }
    } else {
      bool res = _incrementIndex();
      if (!res) this._scene.isFinished = true;
    }
  }

  bool _incrementIndex() {
    if (_dlgTextIndex < _dlgFiles.length - 1) {
      _dlgTextIndex++;
      return true;
    } else {
      return false;
    }
  }

  bool isDialogueFinished() {
    return _dlgPlayer.state == AudioPlayerState.COMPLETED ? true : false;
  }
}
