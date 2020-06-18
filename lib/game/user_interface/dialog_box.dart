import 'package:detective_game/game/scene.dart';
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
    final width = MediaQuery.of(context).size.width - 80;  // Better for debugging 
    //final width = this.scene.tileSize * 16;

    final dlg = data[0];
    final avatarPath = data[1];

    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.95),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(height), bottomLeft: Radius.circular(height)),
          ),
          height: height,
          width: width,
          
          child: Row(
            children: <Widget>[
              Container(
                width: height,
                height: height,
                child: CircleAvatar(
                  backgroundImage: AssetImage(avatarPath),
                )
              ),

              Expanded(
                child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  height: height,
                  child: AutoSizeText(
                    dlg,
                    minFontSize: 15,
                    overflow: TextOverflow.fade,
                    style: TextStyle(
                      fontSize: 20
                    ),
                  )), 
              ),

            ],
          ),
        ),


      ],);
  }
}