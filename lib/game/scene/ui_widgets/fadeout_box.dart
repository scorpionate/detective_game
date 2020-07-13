import 'package:detective_game/game/scene/scene.dart';
import 'package:flutter/material.dart';

class FadeOutBox extends StatefulWidget {
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

    // Animation configuration
    _animController =
        AnimationController(duration: this._animationDuration, vsync: this);
    _opacity = Tween<double>(begin: 1.0, end: 0.0).animate(_animController)
      ..addListener(() => setState(() {}))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          widget.scene.onTap();
        }
      });

    _animController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _animController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(_opacity.value),
    );
  }
}
