import 'package:detective_game/game/scene/scene.dart';
import 'package:detective_game/game/scenes/main_thread/MT11.dart';
import 'package:detective_game/game/scenes/main_thread/MT12.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

// Shows sentence
class DialogBox extends StatefulWidget {
  final List<String> data;
  final Scene scene;

  DialogBox(this.scene, this.data);

  @override
  _DialogBoxState createState() => _DialogBoxState();
}

class _DialogBoxState extends State<DialogBox> {
  bool _isButton1 = true;
  bool _isButton2 = false;
  bool _isButton3 = false;
  bool _isButton4 = false;
  bool _isButton5 = false;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.25;
    // TODO:
    final width =
        MediaQuery.of(context).size.width - 80; // Better for debugging
    //final width = this.scene.tileSize * 16;

    // Always supplied by stream
    final dlg = widget.data[0]; // Main dialogue
    final avatarPath = widget.data[1]; // Who is talking
    var conditionals = List<String>();

    // Supplied by stream if it is conditional dialogue
    if (widget.data.length > 2) {
      for (int i = 2; i < widget.data.length; i++) {
        conditionals.add(widget.data[i]);
      }
    }

    // Generate buttons for MT011 scene
    var cellButtons = this.widget.scene is MT11 || this.widget.scene is MT12
        ? Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  onPressed: _isButton1
                      ? () => {
                            if (widget.scene.dialogueManager
                                    .currentDialogueIndex ==
                                4)
                              {
                                setState(() {
                                  _isButton1 = false;
                                  _isButton2 = true;
                                  this.widget.scene.bottomButtonClicked(id: 1);
                                })
                              }
                          }
                      : null,
                  child: Text('Room1'),
                ),
                RaisedButton(
                  onPressed: _isButton2
                      ? () => {
                            if (widget.scene.dialogueManager
                                    .currentDialogueIndex ==
                                7)
                              {
                                setState(() {
                                  _isButton2 = false;
                                  _isButton3 = true;
                                  this.widget.scene.bottomButtonClicked(id: 2);
                                })
                              }
                          }
                      : null,
                  child: Text('Room2'),
                ),
                RaisedButton(
                  onPressed: _isButton3
                      ? () => {
                            if (widget.scene.dialogueManager
                                    .currentDialogueIndex ==
                                10)
                              {
                                setState(() {
                                  _isButton3 = false;
                                  _isButton4 = true;
                                  this.widget.scene.bottomButtonClicked(id: 3);
                                })
                              }
                          }
                      : null,
                  child: Text('Room3'),
                ),
                RaisedButton(
                  onPressed: _isButton4
                      ? () => {
                            if (widget.scene.dialogueManager
                                    .currentDialogueIndex ==
                                12)
                              {
                                setState(() {
                                  _isButton4 = false;
                                  _isButton5 = true;
                                  this.widget.scene.bottomButtonClicked(id: 4);
                                })
                              }
                          }
                      : null,
                  child: Text('Room4'),
                ),
                RaisedButton(
                  onPressed: _isButton5
                      ? () => {
                            if (widget.scene.dialogueManager
                                    .currentDialogueIndex ==
                                14)
                              {
                                setState(() {
                                  _isButton5 = false;
                                  this.widget.scene.bottomButtonClicked(id: 5);
                                })
                              }
                          }
                      : null,
                  child: Text('Room5'),
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
          onPressed: this.widget.scene.onTap,
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
                  height: 30,
                  child: RaisedButton(
                    // shape: RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(18.0),
                    //     side: BorderSide(color: Colors.black)),
                    elevation: 5,
                    color: Colors.white.withOpacity(0.85),
                    onPressed: () {
                      // Send info which button was clicked
                      this
                          .widget
                          .scene
                          .dialogueManager
                          .optionalDialogueClicked(item);
                    },
                    child: Text(
                      _removeBraces(_removeAuthor(item)),
                      style: TextStyle(fontSize: 10),
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

  String _removeAuthor(String input) {
    return input.substring(input.indexOf(':') + 2, input.length);
  }
}
