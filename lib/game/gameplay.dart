import 'dart:async';

import 'package:detective_game/game/scene/scene.dart';
import 'package:detective_game/model/game_state.dart';
import 'package:detective_game/screens/stats_screen.dart';
import 'package:detective_game/services/local_save_manager.dart';
import 'package:flutter/material.dart';
import 'package:detective_game/game/scene/displayer.dart';
import 'package:detective_game/game/scenes/config_resolution.dart';
import 'package:detective_game/game/scenes/daniel_thread/DT01.dart';
import 'package:detective_game/game/scenes/daniel_thread/DT02.dart';
import 'package:detective_game/game/scenes/daniel_thread/DT03.dart';
import 'package:detective_game/game/scenes/daniel_thread/DT04.dart';
import 'package:detective_game/game/scenes/daniel_thread/DT05.dart';
import 'package:detective_game/game/scenes/daniel_thread/DT06.dart';
import 'package:detective_game/game/scenes/jeff_thread/JT01.dart';
import 'package:detective_game/game/scenes/jeff_thread/JT02.dart';
import 'package:detective_game/game/scenes/jeff_thread/JT03.dart';
import 'package:detective_game/game/scenes/jeff_thread/JT04.dart';
import 'package:detective_game/game/scenes/jeff_thread/JT05.dart';
import 'package:detective_game/game/scenes/jeff_thread/JT06.dart';
import 'package:detective_game/game/scenes/kate_thread/KT01.dart';
import 'package:detective_game/game/scenes/kate_thread/KT02.dart';
import 'package:detective_game/game/scenes/kate_thread/KT03.dart';
import 'package:detective_game/game/scenes/kate_thread/KT04.dart';
import 'package:detective_game/game/scenes/kate_thread/KT05.dart';
import 'package:detective_game/game/scenes/kate_thread/KT06.dart';
import 'package:detective_game/game/scenes/kate_thread/KT07.dart';
import 'package:detective_game/game/scenes/kate_thread/KT08.dart';
import 'package:detective_game/game/scenes/luca_thread/LT01.dart';
import 'package:detective_game/game/scenes/luca_thread/LT02.dart';
import 'package:detective_game/game/scenes/luca_thread/LT03.dart';
import 'package:detective_game/game/scenes/luca_thread/LT04.dart';
import 'package:detective_game/game/scenes/luca_thread/LT05.dart';
import 'package:detective_game/game/scenes/luca_thread/LT06.dart';
import 'package:detective_game/game/scenes/mike_thread/MK01.dart';
import 'package:detective_game/game/scenes/mike_thread/MK02.dart';
import 'package:detective_game/game/scenes/mike_thread/MK03.dart';
import 'package:detective_game/game/scenes/mike_thread/MK04.dart';
import 'package:detective_game/game/scenes/mike_thread/MK05.dart';
import 'package:detective_game/game/scenes/mike_thread/MK06.dart';
import 'package:detective_game/game/scenes/mike_thread/MK07.dart';
import 'package:detective_game/game/scenes/mike_thread/MK08.dart';
import 'package:detective_game/game/scenes/main_thread/MT01.dart';
import 'package:detective_game/game/scenes/main_thread/MT02.dart';
import 'package:detective_game/game/scenes/main_thread/MT03.dart';
import 'package:detective_game/game/scenes/main_thread/MT04.dart';
import 'package:detective_game/game/scenes/main_thread/MT05.dart';
import 'package:detective_game/game/scenes/main_thread/MT06.dart';
import 'package:detective_game/game/scenes/main_thread/MT07.dart';
import 'package:detective_game/game/scenes/main_thread/MT08.dart';
import 'package:detective_game/game/scenes/main_thread/MT09.dart';
import 'package:detective_game/game/scenes/main_thread/MT10.dart';
import 'package:detective_game/game/scenes/main_thread/MT11.dart';
import 'package:detective_game/game/scenes/main_thread/MT12.dart';
import 'package:detective_game/game/scenes/main_thread/MT13.dart';
import 'package:detective_game/game/scenes/main_thread/MT14.dart';
import 'package:detective_game/game/scenes/main_thread/MT15.dart';
import 'package:detective_game/game/scenes/main_thread/MT16.dart';

// Manage gameplay, toggle between scenes
class Gameplay extends StatefulWidget {
  final List<Displayer> _jeffThread = List<Displayer>();

  final List<Displayer> _kateThread = List<Displayer>();

  final List<Displayer> _lucaThread = List<Displayer>();

  final List<Displayer> _mainThread = List<Displayer>();

  final List<Displayer> _mikeThread = List<Displayer>();

  final List<Displayer> _danielThread = List<Displayer>();

  int _jeffThreadIndex = 0;

  int _kateThreadIndex = 0;

  int _lucaThreadIndex = 0;

  int _mainThreadIndex = 0;

  int _mikeThreadIndex = 0;

  int _danielThreadIndex = 0;

  bool jeffButton = true;

  bool kateButton = true;

  bool lucaButton = true;

  bool mikeButton = true;

  bool danielButton = true;

  bool _partialsFinished = false;

  bool get partialsFinished {
    return _partialsFinished;
  }

  var _scene;

  final StreamController<bool> sceneController =
      StreamController<bool>.broadcast();

  void _initializeMainThread() {
    _mainThread.add(Displayer(scene: MT01(this)));
    _mainThread.add(Displayer(scene: MT02(this)));
    _mainThread.add(Displayer(scene: MT03(this)));
    _mainThread.add(Displayer(scene: MT04(this)));
    _mainThread.add(Displayer(scene: MT05(this)));
    _mainThread.add(Displayer(scene: MT06(this)));
    _mainThread.add(Displayer(scene: MT07(this)));
    _mainThread.add(Displayer(scene: MT08(this)));
    _mainThread.add(Displayer(scene: MT09(this)));
    _mainThread.add(Displayer(scene: MT10(this)));
    _mainThread.add(Displayer(scene: MT11(this)));
    _mainThread.add(Displayer(scene: MT12(this)));
    _mainThread.add(Displayer(scene: MT13(this)));
    _mainThread.add(Displayer(scene: MT14(this)));
    _mainThread.add(Displayer(scene: MT15(this)));
    _mainThread.add(Displayer(scene: MT16(this)));
  }

  void initializeOtherThreads() {
    _jeffThread.add(Displayer(scene: JT01(this)));
    _jeffThread.add(Displayer(scene: JT02(this)));
    _jeffThread.add(Displayer(scene: JT03(this)));
    _jeffThread.add(Displayer(scene: JT04(this)));
    _jeffThread.add(Displayer(scene: JT05(this)));
    _jeffThread.add(Displayer(scene: JT06(this)));

    _lucaThread.add(Displayer(scene: LT01(this)));
    _lucaThread.add(Displayer(scene: LT02(this)));
    _lucaThread.add(Displayer(scene: LT03(this)));
    _lucaThread.add(Displayer(scene: LT04(this)));
    _lucaThread.add(Displayer(scene: LT05(this)));
    _lucaThread.add(Displayer(scene: LT06(this)));

    _danielThread.add(Displayer(scene: DT01(this)));
    _danielThread.add(Displayer(scene: DT02(this)));
    _danielThread.add(Displayer(scene: DT03(this)));
    _danielThread.add(Displayer(scene: DT04(this)));
    _danielThread.add(Displayer(scene: DT05(this)));
    _danielThread.add(Displayer(scene: DT06(this)));

    _kateThread.add(Displayer(scene: KT01(this)));
    _kateThread.add(Displayer(scene: KT02(this)));
    _kateThread.add(Displayer(scene: KT03(this)));
    _kateThread.add(Displayer(scene: KT04(this)));
    _kateThread.add(Displayer(scene: KT05(this)));
    _kateThread.add(Displayer(scene: KT06(this)));
    _kateThread.add(Displayer(scene: KT07(this)));
    _kateThread.add(Displayer(scene: KT08(this)));

    _mikeThread.add(Displayer(scene: MK01(this)));
    _mikeThread.add(Displayer(scene: MK02(this)));
    _mikeThread.add(Displayer(scene: MK03(this)));
    _mikeThread.add(Displayer(scene: MK04(this)));
    _mikeThread.add(Displayer(scene: MK05(this)));
    _mikeThread.add(Displayer(scene: MK06(this)));
    _mikeThread.add(Displayer(scene: MK07(this)));
    _mikeThread.add(Displayer(scene: MK08(this)));
  }

  bool get areAllScenesLoaded {
    for (int i = 0; i < _jeffThread.length; i++)
      if (!_jeffThread[i].scene.assetsLoaded) return false;

    for (int i = 0; i < _lucaThread.length; i++)
      if (!_lucaThread[i].scene.assetsLoaded) return false;

    for (int i = 0; i < _danielThread.length; i++)
      if (!_danielThread[i].scene.assetsLoaded) return false;

    for (int i = 0; i < _kateThread.length; i++)
      if (!_kateThread[i].scene.assetsLoaded) return false;

    for (int i = 0; i < _mikeThread.length; i++)
      if (!_mikeThread[i].scene.assetsLoaded) return false;

    for (int i = 0; i < _mainThread.length; i++)
      if (!_mainThread[i].scene.assetsLoaded) return false;

    return true;
  }

  void _incrementAllIndexes() {
    _disableShorterThreads() {
      danielButton = false;
      jeffButton = false;
      lucaButton = false;
    }

    // Increment all
    if (_danielThread.length > _danielThreadIndex) _danielThreadIndex++;
    if (_jeffThread.length > _jeffThreadIndex) _jeffThreadIndex++;
    if (_kateThread.length > _kateThreadIndex) _kateThreadIndex++;
    if (_lucaThread.length > _lucaThreadIndex) _lucaThreadIndex++;
    if (_mikeThread.length > _mikeThreadIndex) _mikeThreadIndex++;

    if (_danielThreadIndex == _danielThread.length ||
        _lucaThreadIndex == _lucaThread.length ||
        _jeffThreadIndex == _jeffThread.length) _disableShorterThreads();
  }

  bool _areThreadsEnded() {
    bool a = false, b = false, c = false, d = false, e = false;

    if (_danielThread.length <= _danielThreadIndex) a = true;
    if (_mikeThread.length <= _mikeThreadIndex) b = true;
    if (_lucaThread.length <= _lucaThreadIndex) c = true;
    if (_kateThread.length <= _kateThreadIndex) d = true;
    if (_kateThread.length <= _kateThreadIndex) e = true;

    if (a && b && c && d && e)
      return true;
    else
      return false;
  }

  bool get allPartialThreadsFinished {
    return _areThreadsEnded();
  }

  bool _areAllButtonsDisabled() {
    bool a = danielButton ? true : false;
    bool b = mikeButton ? true : false;
    bool c = jeffButton ? true : false;
    bool d = lucaButton ? true : false;
    bool e = kateButton ? true : false;

    if (!a && !b && !c && !d && !e)
      return true;
    else
      return false;
  }

  void _setAllButtons({bool to}) {
    jeffButton = to;
    kateButton = to;
    mikeButton = to;
    lucaButton = to;
    danielButton = to;
  }

  void playMainThreadScene({int index}) {
    if (index == null) {
      _mainThreadIndex++;
      _scene = _mainThread[_mainThreadIndex];
    } else {
      _scene = _mainThread[index];
      final val = _scene as Displayer;
      val.scene.fadeOut = false;
    }

    LocalSaveManager().saveGameState(GameState(_mainThreadIndex));
    sceneController.add(true);
  }

  void playDanielThreadScene() {
    if (_danielThread.length > _danielThreadIndex) {
      this._scene.scene.uiManager.fadeIn();
      _scene = _danielThread[_danielThreadIndex];

      if (_danielThreadIndex == 0) {
        _danielThreadIndex++;
        danielButton = false;
        if (_areAllButtonsDisabled()) _setAllButtons(to: true);
      } else {
        //Increment all scenes
        _incrementAllIndexes();
      }
    } else {
      if (_areThreadsEnded()) {
        this._partialsFinished = true;
        this._scene.scene.uiManager.fadeIn();
      }
    }
  }

  void playMikeThreadScene() {
    if (_mikeThread.length > _mikeThreadIndex) {
      this._scene.scene.uiManager.fadeIn();
      _scene = _mikeThread[_mikeThreadIndex];

      if (_mikeThreadIndex == 0) {
        _mikeThreadIndex++;
        mikeButton = false;
        if (_areAllButtonsDisabled()) _setAllButtons(to: true);
      } else {
        //Increment all scenes
        _incrementAllIndexes();
      }
    } else {
      if (_areThreadsEnded()) {
        this._partialsFinished = true;
        this._scene.scene.uiManager.fadeIn();
      }
    }
  }

  void playLucaThreadScene() {
    if (_lucaThread.length > _lucaThreadIndex) {
      this._scene.scene.uiManager.fadeIn();
      _scene = _lucaThread[_lucaThreadIndex];

      if (_lucaThreadIndex == 0) {
        _lucaThreadIndex++;
        lucaButton = false;
        if (_areAllButtonsDisabled()) _setAllButtons(to: true);
      } else {
        //Increment all scenes
        _incrementAllIndexes();
      }
    } else {
      if (_areThreadsEnded()) {
        this._partialsFinished = true;
        this._scene.scene.uiManager.fadeIn();
      }
    }
  }

  void playKateThreadScene() {
    if (_kateThread.length > _kateThreadIndex) {
      this._scene.scene.uiManager.fadeIn();
      _scene = _kateThread[_kateThreadIndex];

      if (_kateThreadIndex == 0) {
        _kateThreadIndex++;
        kateButton = false;
        if (_areAllButtonsDisabled()) _setAllButtons(to: true);
      } else {
        //Increment all scenes
        _incrementAllIndexes();
      }
    } else {
      if (_areThreadsEnded()) {
        this._partialsFinished = true;
        this._scene.scene.uiManager.fadeIn();
      }
    }
  }

  void playJeffThreadScene() {
    if (_jeffThread.length > _jeffThreadIndex) {
      this._scene.scene.uiManager.fadeIn();
      _scene = _jeffThread[_jeffThreadIndex];

      if (_jeffThreadIndex == 0) {
        _jeffThreadIndex++;
        jeffButton = false;
        if (_areAllButtonsDisabled()) _setAllButtons(to: true);
      } else {
        //Increment all scenes
        _incrementAllIndexes();
      }
    } else {
      if (_areThreadsEnded()) {
        this._partialsFinished = true;
        this._scene.scene.uiManager.fadeIn();
      }
    }
  }

  void showStatisticsScreen() {
    sceneController.addError('Come back to statistics');
  }

  // Scenes
  @override
  _GameplayState createState() => _GameplayState();
}

class _GameplayState extends State<Gameplay> with WidgetsBindingObserver {
  void _onInit() async {
    widget._initializeMainThread();

    // Load last played scene from shared prefs
    final state = await LocalSaveManager().loadGameState();

    widget._mainThreadIndex = state.mainThreadIndex;
    //_mainThreadIndex = 10;
    widget.playMainThreadScene(index: widget._mainThreadIndex);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.inactive) {
      final scene = widget._scene.scene as Scene;
      scene.dialogueManager.pauseDialogue();
    }
    if (state == AppLifecycleState.resumed) {
      final scene = widget._scene.scene as Scene;
      scene.dialogueManager.resumeDialogue();
    }
    if (state == AppLifecycleState.detached) {}
    if (state == AppLifecycleState.paused) {}
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    _onInit();

    return WillPopScope(
      onWillPop: () async {
        final scene = widget._scene.scene as Scene;
        scene.dialogueManager.stopAllSounds();
        return true;
      },
      child: StreamBuilder(
        stream: widget.sceneController.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return widget._scene;
          } else if (snapshot.hasError) {
            return StatsScreen();
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
