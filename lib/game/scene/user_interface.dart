import 'dart:async';
import 'package:flutter/material.dart';
import 'package:detective_game/game/scene/scene.dart';
import 'package:detective_game/game/scene/ui_widgets/dialog_box.dart';
import 'package:detective_game/game/scene/ui_widgets/tap_to_go.dart';

// Displays dialogbox reffering to incoming messages
class UserInterface extends StatelessWidget {
  final Scene scene;
  UserInterface(this.scene);

  @override
  Widget build(BuildContext context) {
    Stream incomingDialogues = this.scene.uiStream;
    //subscription = incomingDialogues.listen(null);

    return StreamBuilder(
      stream: incomingDialogues,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data[0] == '#HIDE') {
            return TapToGo(this.scene);
          } else {
            return DialogBox(this.scene, snapshot.data);
          }
        } else if (snapshot.hasError) {
          print(snapshot.error.toString());
          return Container();
        }
        // Nothing happens - blank UI
        else {
          return TapToGo(this.scene);
        }
      },
    );
  }
}
