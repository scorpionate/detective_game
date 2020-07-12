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

  // State
  bool _finished = false;

  // Components
  Gameplay _gameplay;
  DialogueManager _dialogues;
  BackgroundManager _background;
  UIManager _uiManager = UIManager();

  Gameplay get gameplay {
    return _gameplay;
  }

  bool get isFinished {
    return _finished;
  }

  bool get assetsLoaded {
    if (this._background.isReady && this._dialogues.isReady) {
      return true;
    } else {
      return false;
    }
  }

  int get currentDialogueIndex {
    return this._dialogues.currentDialogueIndex;
  }

  String get currentBackgroundPath {
    return this._background.currentBackground;
  }

  Stream get uiStream {
    return this._uiManager.controller.stream;
  }

  set isFinished(bool val) {
    this._finished = val;
  }

  // Initializers
  Scene(List<String> backgroundImages, List<String> dialogues, this._gameplay) {
    _initialize(backgroundImages, dialogues);
  }

  void _initialize(List<String> backgroundImages, List<String> dlgFiles) async {
    await _resize();
    this._background = BackgroundManager(this, backgroundImages);
    this._dialogues = DialogueManager(this, dlgFiles);
  }

  // Lifecycle func
  void nextScene() {
    // By default
    this._gameplay.playMainThreadScene();
  }

  void playDialogue() {
    _dialogues.playDialogue();
  }

  void optionalDialogueClicked(String dlg) {
    _dialogues.optionalClicked(dlg);
  }

  void onTap() {
    // Casual =>
    if (!this._dialogues.isConditional) {
      playDialogue();
    }
  }

  void bottomButtonClicked({@required int id}) {}

  // Background management
  void nextBackground() {
    _background.next();
  }

  void previousBackgound() {
    _background.previous();
  }

  void changeBackgroundWhen({@required int dialogueIndexIs}) {
    if (this._dialogues.currentDialogueIndex == dialogueIndexIs) {
      this.nextBackground();
    }
  }

  // UI Management
  void showDialogueWithOptionalAnswers(List<String> data) {
    this._uiManager.showDialogueWithOptionalAnswers(data);
  }

  void showSimpleDialogue(String val) {
    this._uiManager.showSimpleDialogue(val);
  }

  void hideUI() {
    this._uiManager.hideUI();
  }

  // Engine funcs
  Future<void> _resize() async {
    screenSize = await Flame.util.initialDimensions();
    tileSize = screenSize.height /
        9; // Landscape mode inverts width with height, scale to 16:9 ratio
  }

  @override
  void render(Canvas canvas) {
    if (this.assetsLoaded) {
      _background.render(canvas);
    }
    // else:  Maybe show some loading??
  }

  @override
  void update(double t) {
    if (this._dialogues.isDialogueFinished() && this.isFinished) {
      this.nextScene();
      this.hideUI();
    }
  }
}
