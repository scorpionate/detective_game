import 'package:flutter/material.dart';
import 'package:detective_game/game/scene/scene.dart';
import 'package:detective_game/game/scene/user_interface.dart';

// Displayer combines single scene's game layer with UI layer and 
// establishes bridge between them.

class Displayer extends StatelessWidget {
  final Scene scene;
  Displayer({@required this.scene});

  @override
  Widget build(BuildContext context) {
    final ui = UserInterface(this.scene); 

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(child: scene.widget), // Engine
          Positioned.fill(child: ui),           // UI, buttons, etc.
        ],
      ),
    );
  }
}
