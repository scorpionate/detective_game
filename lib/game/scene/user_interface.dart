import 'dart:async';
import 'package:flutter/material.dart';
import 'package:detective_game/game/scene/scene.dart';
import 'package:detective_game/game/scene/ui_widgets/dialog_box.dart';
import 'package:detective_game/game/scene/ui_widgets/tap_to_go.dart';


class UserInterface extends StatelessWidget{
  final Scene scene;
  UserInterface(this.scene);
  
  @override
  Widget build(BuildContext context) {
    StreamSubscription subscription;
    Stream incomingDialogues = this.scene.uiManager.controller.stream;
    subscription = incomingDialogues.listen(null);
    
    // if (scene is MT05) => render different

    return Container(
      child: StreamBuilder(
          stream: incomingDialogues,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return DialogBox(this.scene, snapshot.data);
            }
            else if(snapshot.hasError) {
              print(snapshot.error.toString());
            }
            // Nothing happens - blank UI
            else {
              return TapToGo(this.scene);
            }
          },
      ),
    );
  }
}