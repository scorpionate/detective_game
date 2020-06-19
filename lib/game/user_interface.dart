import 'dart:async';
import 'package:detective_game/game/scene.dart';
import 'package:detective_game/game/user_interface/dialog_box.dart';
import 'package:flutter/material.dart';

class UserInterface extends StatelessWidget{
  final Scene scene;
  UserInterface(this.scene);
  
  @override
  Widget build(BuildContext context) {
    StreamSubscription subscription;
    Stream incomingDialogues = this.scene.uiManager.controller.stream;
    subscription = incomingDialogues.listen(null);

    return Container(
      child: StreamBuilder(
          stream: incomingDialogues,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return DialogBox(this.scene, snapshot.data);
            }
            else if(snapshot.hasError) {
              
            }
            // Nothing happens - blank UI
            else {
              return Container();
            }
          },
      ),
    );
  }
}