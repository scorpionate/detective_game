import 'dart:ui';
import 'package:detective_game/game/gameplay.dart';
import 'package:flutter/material.dart';
import 'package:flame/flame.dart';
import 'package:flame/game/game.dart';
import 'package:detective_game/game/scene/managers/ui_manager.dart';
import 'package:detective_game/game/scene/managers/background_manager.dart';
import 'package:detective_game/game/scene/managers/dialogue_manager.dart';

abstract class Scene extends Game {
  // Screen properties
  Size screenSize;
  double tileSize;
  
  // Components
  Gameplay _gameplay;
  DialogueManager _dialogues;
  BackgroundManager _background;
  UIManager uiManager = UIManager();

  // State
  bool _finished = false;
  
  bool get isFinished {
    return _finished;
  }

  set isFinished(bool val) {
    this._finished = val;
  }

  Scene(List<String> backgroundImages, List<String> dialogues, this._gameplay) {
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

  void sceneEnded() {
    this._gameplay.nextScene();
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

  void hideUI() {
    uiManager.hideUI();
  }

  String get currentBackgroundPath {
    return this._background.currentBackground;
  }

  void optionalDialogueClicked(String dlg) {
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
      _background.render(canvas); 
    }
    // Maybe show some loading??
  }
  
  @override
  void update(double t) {
    if (this._dialogues.isAudioFinished() && this.isFinished) {
      this.sceneEnded();
      this.hideUI();
    }
  }
}