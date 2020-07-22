import 'package:detective_game/model/game_state.dart';
import 'package:detective_game/screens/stats_screen.dart';
import 'package:detective_game/services/local_save_manager.dart';
import 'package:flutter/material.dart';
import 'package:detective_game/game/gameplay.dart';
import 'package:detective_game/screens/pick_resolution.dart';
import 'package:detective_game/game/scenes/config_resolution.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _animController;
  Animation<double> _opacity;
  final _animationDuration = Duration(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    // Animation configuration
    _animController =
        AnimationController(duration: this._animationDuration, vsync: this)
          ..addListener(() => setState(() {}))
          ..addStatusListener((status) async {
            if (status == AnimationStatus.completed) {
              await Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Gameplay()));
              _animController.reset();
            }
          });

    _opacity = Tween<double>(begin: 0.0, end: 1.0).animate(_animController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(fit: StackFit.expand, children: <Widget>[
        // Background Layer
        Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/coverart.png'),
                    fit: BoxFit.cover))),

        Positioned.fill(
            child: Container(color: Colors.black.withOpacity(_opacity.value))),
        // UI Layer
        Container(
            padding: EdgeInsets.symmetric(vertical: 5),
            alignment: Alignment.center,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  // Title
                  Text("Wyatt's Story",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 50,
                      )),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      OutlineButton(
                        onPressed: () {
                          LocalSaveManager().saveGameState(GameState(0));
                          LocalSaveManager().clearAllSavedChoices();
                        },
                        child: Text('ResetProgress'),
                      ),
                      OutlineButton(
                        onPressed: () {
                          _animController.forward();
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
                      OutlineButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => StatsScreen()));
                        },
                        child: Text('Stats.'),
                      ),
                    ],
                  )
                ])),
      ]),
    );
  }
}
