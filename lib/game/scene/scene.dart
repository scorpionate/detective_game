import 'dart:ui';
import 'package:flame/flame.dart';
import 'package:flame/game/game.dart';
import 'package:flutter/material.dart';
import 'package:detective_game/game/gameplay.dart';
import 'package:detective_game/game/scene/managers/ui_manager.dart';
import 'package:detective_game/game/scene/managers/background_manager.dart';
import 'package:detective_game/game/scene/managers/dialogue_manager.dart';
import 'package:detective_game/game/scene/managers/background_ambient_manager.dart';

// Construct for specific scenes. Manages flow in single scene and handles
// showing background, playing dialogues, etc. Implemets Flame engine methods
abstract class Scene extends Game {
  // Engine properties - Screen properties
  // Screen is dived on tiles to display content in calculated ratio: here x:9(prefferably x = 16 or more)
  Size screenSize;
  double tileSize;

  // State
  // Allows scene to be finished once update detects it - shows fade in
  bool _finished = false;
  // Allows scene to begin with fading out and first dialogue, triggers
  bool _fadeOut = false;

  // Background music's path to be played during the scene
  final String ambientPath;

  // Components
  final Gameplay _gameplay;
  DialogueManager _dlgManager;
  BackgroundManager _bgdManager;
  final _uiManager = UIManager(); // Needs to be here, throws null
  final _bgdAmbManager = BackgroundAmbientManager();

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

  void nextScene() {
    // By default, sometimes needs override
    this._gameplay.data.playMainThreadScene();
  }

  void onTap() {
    // By default, sometimes needs override
    // Disables 'Next' button when optionals dialogues are presented
    if (!this._dlgManager.isConditional) {
      _dlgManager.playDialogue();
    }
  }

  void bottomButtonClicked({@required int id}) {
    // To be passed to UI bottom's buttons
  }

  void onStart() {
    // Code executed before fading out from black screen to transparent, to be overriden
  }

  void onEnd() {
    // Code executed at the scene's end - after view fades into black screen
    // Method is passed to FADEINBOX where placed at the end of animation
    this.nextScene();
    this._uiManager.hideUI();
    Flame.assets.clearCache();
  }

  // Engine funcs
  Future<void> _resize() async {
    // Default ratio is set to 16:9
    screenSize = await Flame.util.initialDimensions();
    // Landscape mode inverts width with height, scale to 16:9 ratio
    tileSize = screenSize.height / 9;
  }

  @override
  void render(Canvas canvas) {
    if (this.assetsLoaded) {
      _bgdManager.render(canvas);
    }
  }

  @override
  void update(double t) {
    // Only once at the beggining
    // All scenes loaded and fade out not done
    if (this.gameplay.data.areAllScenesLoaded && !this._fadeOut) {
      this.onStart(); // Leaves place for additional code
      this._bgdAmbManager.playAmbientBackground(this.ambientPath);
      this._fadeOut = true;
      this._uiManager.fadeOut();
    }

    // Only once at the end
    if (this._dlgManager.isDialogueFinished() && this.isFinished) {
      this._bgdAmbManager.stopAmbientBackground();
      this._uiManager.fadeIn();
    }
  }
}
