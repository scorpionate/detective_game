import 'package:flutter/material.dart';
import 'package:detective_game/game/scenes/config_resolution.dart';

class PickResolutionScreen extends StatelessWidget {
  final ConfigResolution scene;
  PickResolutionScreen({@required this.scene});

  @override
  Widget build(BuildContext context) {

    return Scaffold(    
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Game Layer
          Positioned.fill(
            child: scene.widget
          ),
          
          // UI Layer
          Positioned.fill(child:
           Column(
              children: <Widget> [Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  RaisedButton(
                    child: Text('Previous'),
                    onPressed: scene.previousBackgound,
                  ),
                  RaisedButton(
                    child: Text('Next'),
                    onPressed: scene.nextBackground,
                  ),

                ]
              
          ),

          RaisedButton(
                    child: Text('Accept'),
                    onPressed: (){
                      scene.saveImageFactor();
                      Navigator.pop(context);
                    },
          ),

          ]
           ))
      ],),
    
    );
   }

}