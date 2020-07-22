import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:detective_game/model/game_state.dart';
import 'package:detective_game/screens/stats_screen.dart';
import 'package:detective_game/services/local_save_manager.dart';
import 'package:detective_game/game/gameplay.dart';
import 'package:detective_game/screens/pick_resolution.dart';
import 'package:detective_game/game/scenes/config_resolution.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  // To animate fade out after "Play" click
  AnimationController _animController;
  Animation<double> _opacity;
  final _animationDuration = Duration(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    _configureAnimation();
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final title = "Wyatt's Story";
    final titleHeight = MediaQuery.of(context).size.height * 0.2;
    final buttonHeight = titleHeight * 0.9;

    return Scaffold(
      body: Stack(fit: StackFit.expand, children: <Widget>[
        // Background(big image) Layer
        Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/coverart.png'),
                    fit: BoxFit.cover))),

        // Opacity layer
        Positioned.fill(
            child: Container(color: Colors.black.withOpacity(_opacity.value))),

        // UI Layer(title + buttons)
        Container(
            padding: EdgeInsets.symmetric(vertical: 5),
            alignment: Alignment.center,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  // Main Title
                  Container(
                      alignment: Alignment.center,
                      height: titleHeight,
                      child: AutoSizeText(title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 50, fontWeight: FontWeight.w400))),

                  // Bottom Buttons
                  Container(
                    height: buttonHeight,
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        FlatButton(
                            onPressed: this._onReset, child: Text('Reset')),
                        FlatButton(
                            onPressed: this._onPlay, child: Text('Play')),
                        FlatButton(
                            onPressed: this._onResolution,
                            child: Text('Resolution')),
                        // TODO: delete
                        FlatButton(
                          onPressed: () async {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => StatsScreen()));
                          },
                          child: Text('Stats'),
                        ),
                      ],
                    ),
                  )
                ])),
      ]),
    );
  }

  // Animates fade in when enetring gameplay
  void _configureAnimation() {
    _animController =
        AnimationController(duration: this._animationDuration, vsync: this)
          ..addListener(() => setState(() {}))
          ..addStatusListener((status) async {
            // onEnd
            if (status == AnimationStatus.completed) this._goToGame();
          });

    _opacity = Tween<double>(begin: 0.0, end: 1.0).animate(_animController);
  }

  void _onReset() {
    // Reset user's progress
    LocalSaveManager().saveGameState(GameState(0));
    LocalSaveManager().clearAllSavedChoices();
  }

  void _onPlay() {
    // Proceeds to game
    _animController.forward();
  }

  Future<void> _goToGame() async {
    // After fade in, proceed to game
    await Navigator.push(
        context, MaterialPageRoute(builder: (context) => Gameplay()));
    // Returns from gameplay, reset opacity to become transparent again
    _animController.reset();
  }

  void _onResolution() {
    // Go to pick resolution screen
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                PickResolutionScreen(scene: ConfigResolution(Gameplay()))));
  }
}
