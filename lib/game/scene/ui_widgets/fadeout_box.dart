import 'package:flutter/material.dart';
import 'package:flame/flame.dart';
import 'package:wyatts_story/game/scene/scene.dart';

class FadeOutBox extends StatefulWidget {
// Shows over UI, when triggered, animates from black screen into transparent screen
// Plays when scene starts
  final Scene scene;
  FadeOutBox(this.scene);
  @override
  _FadeOutBox createState() => _FadeOutBox();
}

class _FadeOutBox extends State<FadeOutBox>
    with SingleTickerProviderStateMixin {
  AnimationController _animController;
  Animation<double> _opacity;
  final _animationDuration = Duration(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    _animationConfig();
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.black.withOpacity(_opacity.value));
  }

  void _onAnimationEnd() {
    widget.scene.onTap();
  }

  void _animationConfig() {
    _animController =
        AnimationController(duration: this._animationDuration, vsync: this);
    _opacity = Tween<double>(begin: 1.0, end: 0.0).animate(_animController)
      ..addListener(() => setState(() {}))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _onAnimationEnd();
        }
      });

    _animController.forward();

    Flame.audio.play('effects/fade.mp3');
  }
}
