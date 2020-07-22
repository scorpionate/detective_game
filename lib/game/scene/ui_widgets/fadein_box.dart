import 'package:detective_game/game/scene/scene.dart';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';

class FadeInBox extends StatefulWidget {
// Shows over UI, when triggered, animates from black screen into transparent screen
// Plays when scene ends

  final Scene scene;
  FadeInBox(this.scene);
  @override
  _FadeInBoxState createState() => _FadeInBoxState();
}

class _FadeInBoxState extends State<FadeInBox>
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
    widget.scene.onEnd();
  }

  void _animationConfig() {
    _animController =
        AnimationController(duration: this._animationDuration, vsync: this);
    _opacity = Tween<double>(begin: 0.0, end: 1.0).animate(_animController)
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
