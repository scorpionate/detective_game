import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flame/flame.dart';
import 'package:flame/game/game.dart';
import 'package:detective_game/game/ui_manager.dart';
import 'package:detective_game/game/background_manager.dart';
import 'package:detective_game/game/dialogue_manager.dart';

abstract class Scene extends Game {
  // Screen properties
  Size screenSize;
  double tileSize;
  
  // Components
  BackgroundManager _background;
  DialogueManager _dialogues;
  UIManager uiManager = UIManager();

  Scene(List<String> backgroundImages, List<String> dialogues) {
    _initialize(backgroundImages, dialogues);
  }

  void _initialize(List<String> backgroundImages, List<String> dlgFiles) async {
    await _resize();
    this._background = BackgroundManager(this, backgroundImages);
    this._dialogues = DialogueManager(this, dlgFiles);
  }
  
  Future<void> _resize() async {
    screenSize = await Flame.util.initialDimensions();
    tileSize = screenSize.height / 9;  // Landscape mode inverts width with height, scale to 16:9 ratio
  }

  void changeBackgroundWhen({int dialogueIndexIs}) {
    if (this._dialogues.currentDialogueIndex == dialogueIndexIs) {
      this.nextBackground();
    }
  }

  void playDialogue() {
    _dialogues.playDialogue();
  }

  void nextBackground() {
    _background.next();
  }

  void previousBackgound() {
    _background.previous();
  }

  String get currentBackgroundPath {
    return this._background.currentBackground;
  }

  void optionalClicked(String dlg) {
    _dialogues.optionalClicked(dlg);
  }
  
  void continueAction() {
    // If UI shows buttons disable gesture recognizer
    if (!this._dialogues.isConditional) {
      playDialogue();
    }
  }

  bool get assetsLoaded {
    if (this._background.isReady && this._dialogues.isReady) {
      return true;
    }
    else {
      return false;
    }
  }

  @override
  void render(Canvas canvas) {
    if(this.assetsLoaded) {
      _background.render(canvas); // Throws errors at some initial frames(s: delay loading?)
    }
    // Maybe show some loading??
  }
  
  @override
  void update(double t);
}