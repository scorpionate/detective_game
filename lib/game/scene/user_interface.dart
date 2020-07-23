import 'package:flutter/material.dart';
import 'package:wyatts_story/game/scene/scene.dart';
import 'package:wyatts_story/game/scene/ui_widgets/fadeout_box.dart';
import 'package:wyatts_story/game/scene/ui_widgets/fadein_box.dart';
import 'package:wyatts_story/game/scene/ui_widgets/dialog_box.dart';
import 'package:wyatts_story/game/scene/ui_widgets/message_box.dart';

class UIKeys {
  static String hideUI = "#HIDEUI";
  static String fadeOut = "#FADEOUT";
  static String fadeIn = "#FADEIN";
  static String messageBox = "#MESSAGEBOX";
}

class UserInterface extends StatelessWidget {
// Layer with dialogues, buttons, and speaker, placed above background layer
// with engine
// Handles differents classes of messages
  final Scene scene;
  UserInterface(this.scene);

  @override
  Widget build(BuildContext context) {
    final incoming = this.scene.uiManager.controller.stream;

    return StreamBuilder(
        stream: incoming,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data[0] == UIKeys.hideUI) {
              // Incoming structure:
              // [0]: Key
              // Show empty screen
              return Container(color: Colors.black);
            } else if (snapshot.data[0] == UIKeys.fadeOut) {
              // Incoming structure:
              // [0]: Key
              // Show fade out from black screen to transparent(scene's beggining)
              return FadeOutBox(this.scene);
            } else if (snapshot.data[0] == UIKeys.fadeIn) {
              // Incoming structure:
              // [0]: Key
              // Show fade in from transparent screen to black(scene's ending)
              return FadeInBox(this.scene);
            } else if (snapshot.data[0] == UIKeys.messageBox) {
              // Incoming structure:
              // [0]: Key
              // [1]: Message
              // Show Messagebox with buttons or only buttons if message is null
              return MessageBox(this.scene, snapshot.data[1]);
            } else {
              // Incoming structure:
              // [0]: Sentence(with author name as prefix)
              // [1]: Path to the author's avatar picture
              // Show Dialog box with author, sentence and next button
              //
              // OR
              //
              // Incoming structure:
              // [0]: Sentence(with author name as prefix)
              // [1]: Path to the author's avatar picture
              // [2]: Optional sentence to be shown as button
              // [3]: Optional sentence to be shown as button
              // ...
              // Show Dialog box with author and length-2 buttons
              return DialogBox(this.scene, snapshot.data);
            }
          } else if (snapshot.hasError) {
            print(snapshot.error.toString());
            return Container();
          }
          // Nothing happens - blank UI(dark color prevents radnom white shots)
          else {
            return Container(color: Colors.black);
          }
        });
  }
}
