import 'package:detective_game/screens/dev_room.dart';
import 'package:detective_game/services/local_save_manager.dart';
import 'package:flutter/material.dart';
import 'package:detective_game/game/gameplay.dart';
import 'package:detective_game/screens/pick_resolution.dart';
import 'package:detective_game/game/scenes/config_resolution.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: Only for deving
    LocalSaveManager().clearSavedChoices();

    return Scaffold(
      body: Stack(fit: StackFit.expand, children: <Widget>[
        // Background Layer
        Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/coverart.png'),
                    fit: BoxFit.cover))),

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
                      )),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      OutlineButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DevRoom()));
                        },
                        child: Text('Dev Room'),
                      ),
                      OutlineButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Gameplay()));
                        },
                        child: Text('Play.'),
                      ),
                      OutlineButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PickResolutionScreen(
                                      scene: ConfigResolution(Gameplay()))));
                        },
                        child: Text('Resolution.'),
                      ),
                    ],
                  )
                ]))
      ]),
    );
  }
}
