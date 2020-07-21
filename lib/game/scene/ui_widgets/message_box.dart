import 'package:auto_size_text/auto_size_text.dart';
import 'package:detective_game/game/scene/scene.dart';
import 'package:flutter/material.dart';

class MessageBox extends StatelessWidget {
  final Scene scene;
  final message;
  MessageBox(this.scene, this.message);

  @override
  Widget build(BuildContext context) {
    final width = this.scene.tileSize * 16;
    final height = MediaQuery.of(context).size.height * 0.25;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        if (message != null)
          Container(
            alignment: Alignment.center,
            color: Colors.white.withOpacity(0.95),
            height: height,
            width: width,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      child: AutoSizeText(
                        this.message,
                        minFontSize: 10,
                        overflow: TextOverflow.fade,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      )),
                ),
              ],
            ),
          )
        else
          Container(),
        Container(
          padding: EdgeInsets.only(left: 5, right: 5, bottom: 2.5),
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
                onPressed: this.scene.gameplay.mikeButton
                    ? () => this.scene.bottomButtonClicked(id: 1)
                    : null,
                child: Text('Room 1'),
              ),
              RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 5,
                color: Colors.white.withOpacity(0.95),
                onPressed: this.scene.gameplay.kateButton
                    ? () => this.scene.bottomButtonClicked(id: 2)
                    : null,
                child: Text('Room 2'),
              ),
              RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 5,
                color: Colors.white.withOpacity(0.95),
                onPressed: this.scene.gameplay.lucaButton
                    ? () => this.scene.bottomButtonClicked(id: 3)
                    : null,
                child: Text('Room 3'),
              ),
              RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 5,
                color: Colors.white.withOpacity(0.95),
                onPressed: this.scene.gameplay.danielButton
                    ? () => this.scene.bottomButtonClicked(id: 4)
                    : null,
                child: Text('Room 4'),
              ),
              RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 5,
                color: Colors.white.withOpacity(0.95),
                onPressed: this.scene.gameplay.jeffButton
                    ? () => this.scene.bottomButtonClicked(id: 5)
                    : null,
                child: Text('Room 5'),
              ),
            ],
          ),
        )
      ],
    );
  }
}
