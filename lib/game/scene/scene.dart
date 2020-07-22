import 'dart:ui';
import 'package:detective_game/game/gameplay.dart';
import 'package:flutter/material.dart';
import 'package:flame/flame.dart';
import 'package:flame/game/game.dart';
import 'package:detective_game/game/scene/managers/ui_manager.dart';
import 'package:detective_game/game/scene/managers/background_manager.dart';
import 'package:detective_game/game/scene/managers/dialogue_manager.dart';
import 'package:detective_game/game/scene/managers/background_ambient_manager.dart';

abstract class Scene extends Game {
  // Screen properties
  Size screenSize;
  double tileSize;

  // State
  bool _finished = false;
  bool _fadeOut = false;

  final String ambientPath;

  // Components
  final Gameplay _gameplay;
  final UIManager _uiManager = UIManager(); // Needs to be here
  final _bgdAmbManager = BackgroundAmbientManager();
  DialogueManager _dlgManager;
  BackgroundManager _bgdManager;

  Gameplay get gameplay {
    return this._gameplay;
  }

  DialogueManager get dialogueManager {
    return this._dlgManager;
  }

  BackgroundManager get backgroundManager {
    return this._bgdManager;
  }

  UIManager get uiManager {
    return this._uiManager;
  }

  BackgroundAmbientManager get backgroundAmbientManager {
    return this._bgdAmbManager;
  }

  bool get isFinished {
    return _finished;
  }

  bool get assetsLoaded {
    if (this._bgdManager.isReady && this._dlgManager.isReady) {
      return true;
    } else {
      return false;
    }
  }

  set isFinished(bool val) {
    this._finished = val;
  }

  set fadeOut(bool val) {
    this._fadeOut = val;
  }

  // Initializers
  Scene(List<String> backgroundImages, List<String> dialogues,
      List<int> changeBackground, this._gameplay, this.ambientPath) {
    _initialize(backgroundImages, dialogues, changeBackground);
  }

  void _initialize(List<String> backgroundImages, List<String> dlgFiles,
      List<int> changeBackground) async {
    await _resize();
    this._bgdManager = BackgroundManager(this, backgroundImages);
    this._dlgManager = DialogueManager(this, dlgFiles, changeBackground);
  }

  // Lifecycle func
  void nextScene() {
    // By default
    this._gameplay.playMainThreadScene();
  }

  void onTap() {
    // Casual =>
    if (!this._dlgManager.isConditional) {
      _dlgManager.playDialogue();
    }
  }

  void bottomButtonClicked({@required int id}) {}

  // Background management
  void nextBackground() {
    _bgdManager.nextBackground();
  }

  void previousBackgound() {
    _bgdManager.previousBackground();
  }

  void showDialogueWithOptionalAnswers(List<String> data) {
    this._uiManager.showDialogueWithOptionalAnswers(data);
  }

  void showSimpleDialogue(String val) {
    this._uiManager.showSimpleDialogue(val);
  }

  void hideUI() {
    this._uiManager.hideUI();
  }

  void onStart() {}

  // Engine funcs
  Future<void> _resize() async {
    screenSize = await Flame.util.initialDimensions();
    tileSize = screenSize.height /
        9; // Landscape mode inverts width with height, scale to 16:9 ratio
  }

  void onEnd() {
    this.nextScene();
    this.hideUI();
    Flame.assets.clearCache();
  }

  @override
  void render(Canvas canvas) {
    if (this.assetsLoaded) {
      _bgdManager.render(canvas);
    }
    // else:  Maybe show some loading??
  }

  @override
  void update(double t) {
    // only once
    if (this.gameplay.areAllScenesLoaded && !this._fadeOut) {
      this.onStart();
      if (this.ambientPath != null) {
        this._bgdAmbManager.playAmbientBackground(this.ambientPath);
      }
      this._fadeOut = true;
      this._uiManager.fadeOut();
    }

    if (this._dlgManager.isDialogueFinished() && this.isFinished) {
      this._bgdAmbManager.stopAmbientBackground();
      this._uiManager.fadeIn();
    }
  }
}
