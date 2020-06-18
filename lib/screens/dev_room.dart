import 'package:detective_game/game/displayer.dart';
import 'package:detective_game/game/scenes/main_thread/MT01/MT01.dart';
import 'package:flutter/material.dart';

class DevRoom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      ListView(
      children: <Widget>[
         ListTile(
          title: Text('Room0'),
          onTap: (){
            //Navigator.push(context, MaterialPageRoute(builder: (context) => Displayer(scene: MT00())));
          }
        ,),
        ListTile(
          title: Text('Room1'),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Displayer(scene: MT01())));
          }
        ,),
        ListTile(
          title: Text('Room2'),
          onTap: (){
           // Navigator.push(context, MaterialPageRoute(builder: (context) => Displayer(scene: MT02())));
          }
        ,),
        ListTile(
          title: Text('Room3'),
          onTap: (){}
        ,),
        ListTile(
          title: Text('Room4'),
          onTap: (){}
        ,),
        ListTile(
          title: Text('Go back'),
          onTap: (){
            Navigator.pop(context);
          }
        ,),



      ],));
  }
}