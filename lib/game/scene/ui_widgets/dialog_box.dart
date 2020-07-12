import 'package:detective_game/game/scene/scene.dart';
import 'package:detective_game/game/scenes/main_thread/MT11.dart';
import 'package:detective_game/game/scenes/main_thread/MT12.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

// Shows sentence
class DialogBox extends StatelessWidget {
  final List<String> data;
  final Scene scene;

  DialogBox(this.scene, this.data);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.25;
    // TODO:
    final width =
        MediaQuery.of(context).size.width - 80; // Better for debugging
    //final width = this.scene.tileSize * 16;

    // Always supplied by stream
    final dlg = data[0]; // Main dialogue
    final avatarPath = data[1]; // Who is talking
    var conditionals = List<String>();

    // Supplied by stream if it is conditional dialogue
    if (data.length > 2) {
      for (int i = 2; i < data.length; i++) {
        conditionals.add(data[i]);
      }
    }

    // Generate buttons for MT011 scene
    var cellButtons = this.scene is MT11 || this.scene is MT12
        ? Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  onPressed: () => this.scene.bottomButtonClicked(id: 1),
                  child: Text('1'),
                ),
                RaisedButton(
                  onPressed: () => this.scene.bottomButtonClicked(id: 2),
                  child: Text('2'),
                ),
                RaisedButton(
                  onPressed: () => this.scene.bottomButtonClicked(id: 3),
                  child: Text('3'),
                ),
                RaisedButton(
                  onPressed: () => this.scene.bottomButtonClicked(id: 4),
                  child: Text('4'),
                ),
                RaisedButton(
                  onPressed: () => this.scene.bottomButtonClicked(id: 5),
                  child: Text('5'),
                ),
              ],
            ),
          )
        : Container();

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        // Dialogue itself
        Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.95),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(height),
                bottomLeft: Radius.circular(height)),
          ),
          height: height,
          width: width,
          child: Row(
            children: <Widget>[
              Container(
                  width: height,
                  height: height,
                  child: CircleAvatar(
                    backgroundColor: Color(0xffc7c7c7),
                    backgroundImage: AssetImage(avatarPath),
                  )),
              Expanded(
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    height: height,
                    child: AutoSizeText(
                      _removeBraces(dlg),
                      minFontSize: 10,
                      overflow: TextOverflow.fade,
                      style: TextStyle(fontSize: 20),
                    )),
              ),
            ],
          ),
        ),

        // Temporary onTap invoker
        OutlineButton(
          child: Text('NEXT'),
          onPressed: this.scene.onTap,
        ),

        // Buttons with optional dialogues to be choosen
        Container(
          width: width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              for (var item in conditionals)
                Container(
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.black)),
                    elevation: 5,
                    color: Colors.white.withOpacity(0.85),
                    onPressed: () {
                      // Send info which button was clicked
                      this.scene.optionalDialogueClicked(item);
                    },
                    child: Text(
                      _removeBraces(_removeAuthor(item)),
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                )
            ],
          ),
        ),

        // Buttons with scene choose
        cellButtons,
      ],
    );
  }

  // Use only for display in Widget
  String _removeBraces(String input) {
    if (input.contains('(conditional)')) {
      return input.replaceAll('(conditional)', '');
    } else if (input.contains('(optional)')) {
      return input.replaceAll('(optional)', '');
    } else if (input.contains('(answer)')) {
      return input.replaceAll('(answer)', '');
    } else {
      return input;
    }
  }

  // Use only for display in Widget
  String _removeAuthor(String input) {
    return input.substring(input.indexOf(':') + 2, input.length);
  }
}
