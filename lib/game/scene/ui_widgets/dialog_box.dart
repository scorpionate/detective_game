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
    final conditionalsHeight = MediaQuery.of(context).size.height * 0.5;
    final width = widget.scene.tileSize * 16;
    //final width = MediaQuery.of(context).size.width - 80; // Better for debugging

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

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _topDialogue(height, width, avatarPath, dlg),
        Column(
          children: <Widget>[
            if (conditionals.length < 1) _floatingButton(width),

            // Buttons with optional dialogues to be choosen
            if (conditionals.length > 0)
              _conditionalButtons(conditionalsHeight, width, conditionals),

            // Buttons with scene choose
            if (this.widget.scene is MT11)
              _cellButtons(width),
          ],
        )
      ],
    );
  }

  Container _cellButtons(double width) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.only(bottom: 2.5, left: 5, right: 5),
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 5,
            color: Colors.white.withOpacity(0.95),
            onPressed: _isButton1
                ? () => {
                      if (widget.scene.dialogueManager.currentDialogueIndex ==
                          MT11.chgBackground[0])
                        {
                          setState(() {
                            _isButton1 = false;
                            _isButton2 = true;
                            this.widget.scene.bottomButtonClicked(id: 1);
                          })
                        }
                    }
                : null,
            child: Text('Room 1'),
          ),
          RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 5,
            color: Colors.white.withOpacity(0.95),
            onPressed: _isButton2
                ? () => {
                      if (widget.scene.dialogueManager.currentDialogueIndex ==
                          MT11.chgBackground[1])
                        {
                          setState(() {
                            _isButton2 = false;
                            _isButton3 = true;
                            this.widget.scene.bottomButtonClicked(id: 2);
                          })
                        }
                    }
                : null,
            child: Text('Room 2'),
          ),
          RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 5,
            color: Colors.white.withOpacity(0.95),
            onPressed: _isButton3
                ? () => {
                      if (widget.scene.dialogueManager.currentDialogueIndex ==
                          MT11.chgBackground[2])
                        {
                          setState(() {
                            _isButton3 = false;
                            _isButton4 = true;
                            this.widget.scene.bottomButtonClicked(id: 3);
                          })
                        }
                    }
                : null,
            child: Text('Room 3'),
          ),
          RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 5,
            color: Colors.white.withOpacity(0.95),
            onPressed: _isButton4
                ? () => {
                      if (widget.scene.dialogueManager.currentDialogueIndex ==
                          MT11.chgBackground[3])
                        {
                          setState(() {
                            _isButton4 = false;
                            _isButton5 = true;
                            this.widget.scene.bottomButtonClicked(id: 4);
                          })
                        }
                    }
                : null,
            child: Text('Room 4'),
          ),
          RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 5,
            color: Colors.white.withOpacity(0.95),
            onPressed: _isButton5
                ? () => {
                      if (widget.scene.dialogueManager.currentDialogueIndex ==
                          MT11.chgBackground[4])
                        {
                          setState(() {
                            _isButton5 = false;
                            this.widget.scene.bottomButtonClicked(id: 5);
                          })
                        }
                    }
                : null,
            child: Text('Room 5'),
          ),
        ],
      ),
    );
  }

  Container _conditionalButtons(
      double height, double width, List<String> conditionals) {
    final buttonsCount = conditionals.length;
    final space = 2.5;
    final spacesBetween = buttonsCount * space * 2;
    final singleButtonHeight = (height - spacesBetween) / buttonsCount;

    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.only(bottom: space, left: 5, right: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          for (var item in conditionals)
            Container(
              padding: EdgeInsets.symmetric(vertical: space),
              height: singleButtonHeight,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 5,
                color: Colors.white.withOpacity(0.95),
                onPressed: () {
                  this
                      .widget
                      .scene
                      .dialogueManager
                      .optionalDialogueClicked(item);
                },
                child: AutoSizeText(
                  _removeBraces(_removeAuthor(item)),
                  minFontSize: 7,
                  overflow: TextOverflow.fade,
                  style: TextStyle(fontSize: 15),
                ),
              ),
            )
        ],
      ),
    );
  }

  Container _floatingButton(double width) {
    return Container(
      padding: EdgeInsets.only(bottom: 5, right: 5),
      alignment: Alignment.centerRight,
      width: width,
      child: FloatingActionButton(
        backgroundColor: Colors.white.withOpacity(0.95),
        child: Icon(
          Icons.navigate_next,
          color: Colors.black,
        ),
        onPressed: this.widget.scene.onTap,
      ),
    );
  }

  Container _topDialogue(
      double height, double width, String avatarPath, String dlg) {
    return Container(
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
                  minFontSize: 7,
                  overflow: TextOverflow.fade,
                  style: TextStyle(fontSize: 20),
                )),
          ),
        ],
      ),
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
