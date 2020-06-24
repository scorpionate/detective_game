import 'package:flutter/material.dart';
import 'package:detective_game/game/scene/scene.dart';

class TapToGo extends StatefulWidget {
  final Scene scene;
  TapToGo(this.scene);

  @override
  _TapToGoState createState() => _TapToGoState();
}

class _TapToGoState extends State<TapToGo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.4),
      child: GestureDetector (
        onTap: (){
          widget.scene.continueAction();
        },
        
        child: Center(
          child: Text(
            'Tap to GO!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 40
            ),
          ),
        ),
      ),
    );
  }
}