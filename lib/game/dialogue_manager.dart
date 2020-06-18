import 'dart:convert';
import 'package:detective_game/game/scene.dart';
import 'package:flame/flame.dart';
import 'package:flutter/services.dart' show rootBundle;

class DialogueManager {
  // Properties
  final Scene _scene;
  final List<String> _dlgFiles;   // Dialogues audio paths
  List<String> _dlgText;          // Dialogues texts (1 line - 1 dialogue)
  int _index = 1;                 // Current dialogue to play

  DialogueManager(this._scene, this._dlgFiles) {
    _loadAssets();
  }

  void _loadAssets() async { 
    // Load audio files without transcript.txt located at [0]
    await Flame.audio.loadAll(_dlgFiles.sublist(1, _dlgFiles.length));      
    
    // Load transcript.txt into _dlgFiles(1 dialogue - 1 line in txt) 
    String transcript = await rootBundle.loadString('assets/audio/${_dlgFiles.first}'); // Some dialogs are endless :O
    
    // Extract lines from txt into the list.
    _dlgText = LineSplitter().convert(transcript);                          
    
    // Dialogues start from index 1.
    _dlgText.insert(0, '');                                                  
  }

  void play(Duration delay) async {

    // Wait before start
    await Future.delayed(delay);
    
    // Show Dialogue UI
    this._scene.uiManager.showDialogue(_dlgText[_index]);

    // Play audio
    await Flame.audio.playLongAudio(_dlgFiles[_index]);
    
    // Change dialogue
    _next();
  }

  bool _next() {
    if (_index < _dlgFiles.length - 1) {
      _index++;
      return true;
    }
    else {
      return false;
    }
  }
    
}