import 'package:detective_game/game/gameplay.dart';
import 'package:detective_game/game/scene/displayer.dart';
import 'package:detective_game/game/scenes/config_resolution.dart';
import 'package:detective_game/game/scenes/daniel_thread/DT01.dart';
import 'package:detective_game/game/scenes/daniel_thread/DT02.dart';
import 'package:detective_game/game/scenes/daniel_thread/DT03.dart';
import 'package:detective_game/game/scenes/daniel_thread/DT04.dart';
import 'package:detective_game/game/scenes/jeff_thread/JT01.dart';
import 'package:detective_game/game/scenes/jeff_thread/JT02.dart';
import 'package:detective_game/game/scenes/jeff_thread/JT03.dart';
import 'package:detective_game/game/scenes/jeff_thread/JT04.dart';
import 'package:detective_game/game/scenes/jeff_thread/JT05.dart';
import 'package:detective_game/game/scenes/kate_thread/KT01.dart';
import 'package:detective_game/game/scenes/kate_thread/KT02.dart';
import 'package:detective_game/game/scenes/kate_thread/KT03.dart';
import 'package:detective_game/game/scenes/kate_thread/KT04.dart';
import 'package:detective_game/game/scenes/kate_thread/KT05.dart';
import 'package:detective_game/game/scenes/kate_thread/KT06.dart';
import 'package:detective_game/game/scenes/kate_thread/KT07.dart';
import 'package:detective_game/game/scenes/kate_thread/KT08.dart';
import 'package:detective_game/game/scenes/kate_thread/KT09.dart';
import 'package:detective_game/game/scenes/luca_thread/LT01.dart';
import 'package:detective_game/game/scenes/mike_thread/MK01.dart';
import 'package:detective_game/game/scenes/mike_thread/MK02.dart';
import 'package:detective_game/game/scenes/mike_thread/MK03.dart';
import 'package:detective_game/game/scenes/mike_thread/MK04.dart';
import 'package:detective_game/game/scenes/mike_thread/MK05.dart';
import 'package:detective_game/game/scenes/mike_thread/MK06.dart';
import 'package:detective_game/game/scenes/mike_thread/MK07.dart';
import 'package:detective_game/game/scenes/mike_thread/MK08.dart';
import 'package:detective_game/game/scenes/mike_thread/MK09.dart';

import 'package:detective_game/screens/pick_resolution.dart';
import 'package:flutter/material.dart';

class DevRoom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      ListView(
      children: <Widget>[
         ListTile(
          title: Text('Resolution Changer'),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => PickResolutionScreen(scene: ConfigResolution(Gameplay()))));
          }
        ,),
        ListTile(
          title: Text('DT01'),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Displayer(scene: DT01(Gameplay()))));
          }
        ,),
        ListTile(
          title: Text('DT02'),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Displayer(scene: DT02(Gameplay()))));
          }
        ,),
        ListTile(
          title: Text('DT03'),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Displayer(scene: DT03(Gameplay()))));
          }
        ,),
        ListTile(
          title: Text('DT04'),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Displayer(scene: DT04(Gameplay()))));
          }
        ,),
        ListTile(
          title: Text('JT01'),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Displayer(scene: JT01(Gameplay()))));
          }
        ,),
        ListTile(
          title: Text('JT02'),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Displayer(scene: JT02(Gameplay()))));
          }
        ,),
        ListTile(
          title: Text('JT03'),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Displayer(scene: JT03(Gameplay()))));
          }
        ,),
        ListTile(
          title: Text('JT04'),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Displayer(scene: JT04(Gameplay()))));
          }
        ,),
        ListTile(
          title: Text('JT05'),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Displayer(scene: JT05(Gameplay()))));
          }
        ,),
        ListTile(
          title: Text('KT01'),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Displayer(scene: KT01(Gameplay()))));
          }
        ,),
        ListTile(
          title: Text('KT02'),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Displayer(scene: KT02(Gameplay()))));
          }
        ,),
        ListTile(
          title: Text('KT03'),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Displayer(scene: KT03(Gameplay()))));
          }
        ,),
        ListTile(
          title: Text('KT04'),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Displayer(scene: KT04(Gameplay()))));
          }
        ,),
        ListTile(
          title: Text('KT05'),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Displayer(scene: KT05(Gameplay()))));
          }
        ,),
        ListTile(
          title: Text('KT06'),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Displayer(scene: KT06(Gameplay()))));
          }
        ,),
        ListTile(
          title: Text('KT07'),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Displayer(scene: KT07(Gameplay()))));
          }
        ,),
        ListTile(
          title: Text('KT08'),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Displayer(scene: KT08(Gameplay()))));
          }
        ,),
        ListTile(
          title: Text('KT09'),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Displayer(scene: KT09(Gameplay()))));
          }
        ,),
         ListTile(
          title: Text('LT01'),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Displayer(scene: LT01(Gameplay()))));
          }
        ,),
        ListTile(
          title: Text('MK01'),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Displayer(scene: MK01(Gameplay()))));
          }
        ,),
        ListTile(
          title: Text('MK02'),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Displayer(scene: MK02(Gameplay()))));
          }
        ,),
        ListTile(
          title: Text('MK03'),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Displayer(scene: MK03(Gameplay()))));
          }
        ,),
        ListTile(
          title: Text('MK04'),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Displayer(scene: MK04(Gameplay()))));
          }
        ,),
        ListTile(
          title: Text('MK05'),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Displayer(scene: MK05(Gameplay()))));
          }
        ,),
        ListTile(
          title: Text('MK06'),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Displayer(scene: MK06(Gameplay()))));
          }
        ,),
        ListTile(
          title: Text('MK07'),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Displayer(scene: MK07(Gameplay()))));
          }
        ,),
        ListTile(
          title: Text('MK08'),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Displayer(scene: MK08(Gameplay()))));
          }
        ,),
        ListTile(
          title: Text('MK09'),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Displayer(scene: MK09(Gameplay()))));
          }
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