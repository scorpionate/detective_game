import 'package:detective_game/game/scene/scene.dart';
import 'package:detective_game/game/scene/user_interface.dart';
import 'package:flutter/material.dart';

class Displayer extends StatelessWidget {
  final Scene scene;
  Displayer({@required this.scene});

  @override
  Widget build(BuildContext context) {
    final ui = UserInterface(this.scene);  // Displays dialogs and buttons over scene, INHERITED WIDGET

    return Scaffold(    
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Game Layer
          Positioned.fill(
            child: GestureDetector(
              onTap: scene.continueAction,
              child: scene.widget
            )),
          
          // UI Layer
          Positioned.fill(child: ui),
      ],),
    
    );
   }

}