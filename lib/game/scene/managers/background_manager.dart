import 'package:detective_game/game/scenes/config_resolution.dart';
import 'package:detective_game/services/local_save_manager.dart';
import 'package:flutter/material.dart';
import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';
import 'package:detective_game/game/scene/scene.dart';

// Displays and shifts background
class BackgroundManager {
  final Scene _scene;
  final List<String>
      _images; // Background image paths without resolution and .png
  List<String> _bgdImages =
      List<String>(); // Background image paths with resolution and .png

  Sprite _sprite;
  Rect _rect;

  int _bgdImagesindex = 0; // Image to display
  bool _isReady = false; // Loading assets indicator => true = assets loaded

  bool get isReady {
    return _isReady;
  }

  BackgroundManager(this._scene, this._images) {
    _initialize();
  }

  String get currentBackgroundPath {
    return _bgdImages[_bgdImagesindex];
  }

  void _initialize() async {
    await _loadAssets();
    _updateSprite();
    _isReady = true;
  }

  Future<void> _loadAssets() async {
    final resolution = await LocalSaveManager().loadResolution();

    _images.forEach((element) {
      // ConfigResolution has different file paths from other scenes
      var line = (this._scene is ConfigResolution)
          ? element
          : element + resolution + '.png';
      _bgdImages.add(line);
    });

    await Flame.images.loadAll(_bgdImages); // Throws
  }

  void _updateSprite() {
    // Background images are in 16:9 resolution (9 tiles height / 16 tiles width)
    double width = _scene.tileSize * 16;
    double height = _scene.tileSize * 9;

    // Origin point
    double top = 0.0;
    double left =
        (_scene.screenSize.width - width) / 2; // Center the background

    _sprite = Sprite(_bgdImages[_bgdImagesindex]);
    _rect = Rect.fromLTWH(left, top, width, height);
  }

  bool nextBackground() {
    if (_bgdImagesindex < _bgdImages.length - 1) {
      _bgdImagesindex++;
      _updateSprite();
      return true;
    } else {
      return false;
    }
  }

  bool previousBackground() {
    if (_bgdImagesindex > 0) {
      _bgdImagesindex--;
      _updateSprite();
      return true;
    } else {
      return false;
    }
  }

  void render(Canvas canvas) {
    _sprite.renderRect(canvas, _rect);
  }
}
