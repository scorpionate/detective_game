import 'package:detective_game/game/scene/scene.dart';
import 'package:flutter/material.dart';

class MessageBox extends StatelessWidget {
  final Scene scene;
  final message;
  MessageBox(this.scene, this.message);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                color: Colors.white,
                child: Text(this.message),
              )
            ]),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                onPressed: () => this.scene.bottomButtonClicked(id: 1),
                child: Text('Room1'),
              ),
              RaisedButton(
                onPressed: () => this.scene.bottomButtonClicked(id: 2),
                child: Text('Room2'),
              ),
              RaisedButton(
                onPressed: () => this.scene.bottomButtonClicked(id: 3),
                child: Text('Room3'),
              ),
              RaisedButton(
                onPressed: () => this.scene.bottomButtonClicked(id: 4),
                child: Text('Room4'),
              ),
              RaisedButton(
                onPressed: () => this.scene.bottomButtonClicked(id: 5),
                child: Text('Room5'),
              ),
            ],
          ),
        )
      ],
    );
  }
}
