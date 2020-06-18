import 'package:flutter/material.dart';
import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';
import 'package:detective_game/game/scene.dart';

// Displays and shifts background
class BackgroundManager {
  final Scene _scene;
  final List<String> _images;  // Background image paths
  
  Sprite _sprite;
  Rect _rect;
  int _index = 0;  // Image to display  

  BackgroundManager(this._scene, this._images) {
    _loadAssets();
    _updateSprite();
  }

  void _loadAssets() async {
    await Flame.images.loadAll(_images);
  }

  void _updateSprite() {
    // Background images are in 16:9 resolution (9 tiles height / 16 tiles width)
    double width = _scene.tileSize * 16;
    double height = _scene.tileSize * 9;
    
    // Origin point
    double top = 0.0;
    double left = (_scene.screenSize.width - width) / 2; // Center the background

    _sprite = Sprite(_images[_index]);
    _rect = Rect.fromLTWH(left, top, width, height);
  }

  
  bool next() {
    if (_index < _images.length - 1) {
      _index++;
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