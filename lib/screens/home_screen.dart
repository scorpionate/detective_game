import 'package:detective_game/screens/dev_room.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          // Background Layer
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
              image: AssetImage('assets/images/coverart.png'),
              fit: BoxFit.cover
          ))),

          // UI Layer
          Container(
            padding: EdgeInsets.symmetric(vertical: 5),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // Title
                Text('THE GAME',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 50,
                  )
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => DevRoom()));
                      },
                      
                      child: Text('Dev Room'),
                    ),

                    RaisedButton(
                      onPressed: (){},
                      child: Text('Play.'),
                    ),
                  ],)

          ])
          )

        ]),
      );
  }
}