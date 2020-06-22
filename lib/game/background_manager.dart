import 'package:detective_game/game/scenes/main_thread/MT00/MT00.dart';
import 'package:flutter/material.dart';
import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';
import 'package:detective_game/game/scene.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Displays and shifts background
class BackgroundManager {
  final Scene _scene;
  final List<String> _images;  // Background image paths
  List<String> _bgdImages = List<String>();

  Sprite _sprite;
  Rect _rect;
  int _index = 0;  // Image to display  
  bool _isReady = false;

  bool get isReady {
    return _isReady;
  }
  
  BackgroundManager(this._scene, this._images) {_initialize();}

  void _initialize() async {
    await _loadAssets();
    _updateSprite();
    _isReady = true;

  }

  Future<void> _loadAssets() async {
    final prefs = await SharedPreferences.getInstance();
    final resolution = prefs.getString('RESOLUTION') ?? '@2x';

    _images.forEach((element) {
      var line = (this._scene is MT00) ? element : element + resolution + '.png';
      _bgdImages.add(line);
    });

    // TODO: ADD TRY
    await Flame.images.loadAll(_bgdImages);
  }

  String get currentBackground {
    return _bgdImages[_index];
  }

  void _updateSprite() {
    // Background images are in 16:9 resolution (9 tiles height / 16 tiles width)
    double width = _scene.tileSize * 16;
    double height = _scene.tileSize * 9;
    
    // Origin point
    double top = 0.0;
    double left = (_scene.screenSize.width - width) / 2; // Center the background

    _sprite = Sprite(_bgdImages[_index]);
    _rect = Rect.fromLTWH(left, top, width, height);
  }

  
  bool next() {
    if (_index < _bgdImages.length - 1) {
      _index++;
      _updateSprite();
      return true;
    }
    else {
      return false;
    }
  }

  bool previous() {
    if (_index > 0) {
      _index--;
      _updateSprite();
      return true;
    }
    else {
      return false;
    }
  }

  void render(Canvas canvas) {
    _sprite.renderRect(canvas, _rect);
  }  

}