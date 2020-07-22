import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:detective_game/game/scene/scene.dart';

class MessageBox extends StatelessWidget {
// Displays simple beam with message(NOT DIALOGUE!) - optional
// Displays bottom buttons with specified functions
  final Scene scene;
  final message;
  MessageBox(this.scene, this.message);

  @override
  Widget build(BuildContext context) {
    final width = this.scene.tileSize * 16; // Ratio 16:9
    final height = MediaQuery.of(context).size.height * 0.25;

    return Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <
        Widget>[
      // Beam with message
      if (message != null)
        Container(
            alignment: Alignment.center,
            color: Colors.white.withOpacity(0.95),
            height: height,
            width: width,
            child: Row(children: <Widget>[
              Expanded(
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: AutoSizeText(this.message,
                        minFontSize: 10,
                        overflow: TextOverflow.fade,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20))),
              )
            ]))
      else
        Container(),

      // Bottom buttons
      Container(
          padding: EdgeInsets.only(left: 5, right: 5, bottom: 2.5),
          width: width,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                    elevation: 5,
                    onPressed:
                        this.scene.gameplay.data.mikeButton ? _onButton1 : null,
                    child: Text('Room 1')),
                RaisedButton(
                    elevation: 5,
                    onPressed:
                        this.scene.gameplay.data.kateButton ? _onButton2 : null,
                    child: Text('Room 2')),
                RaisedButton(
                    elevation: 5,
                    onPressed:
                        this.scene.gameplay.data.lucaButton ? _onButton3 : null,
                    child: Text('Room 3')),
                RaisedButton(
                    elevation: 5,
                    onPressed: this.scene.gameplay.data.danielButton
                        ? _onButton4
                        : null,
                    child: Text('Room 4')),
                RaisedButton(
                    elevation: 5,
                    onPressed:
                        this.scene.gameplay.data.jeffButton ? _onButton5 : null,
                    child: Text('Room 5'))
              ]))
    ]);
  }

  void _onButton1() {
    this.scene.bottomButtonClicked(id: 1);
  }

  void _onButton2() {
    this.scene.bottomButtonClicked(id: 2);
  }

  void _onButton3() {
    this.scene.bottomButtonClicked(id: 3);
  }

  void _onButton4() {
    this.scene.bottomButtonClicked(id: 4);
  }

  void _onButton5() {
    this.scene.bottomButtonClicked(id: 5);
  }
}
