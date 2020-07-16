import 'dart:async';

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

class Gameplay extends StatelessWidget {
  // Scenes
  List<Displayer> _jeffThread;
  List<Displayer> _kateThread;
  List<Displayer> _lucaThread;
  List<Displayer> _mainThread;
  List<Displayer> _mikeThread;
  List<Displayer> _danielThread;

  // Current scene played
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

  var _scene;

  final StreamController<bool> _sceneController =
      StreamController<bool>.broadcast();

  Gameplay() {
    _initialize();
  }

  void _initialize() {
    _jeffThread = [
      Displayer(scene: JT01(this)),
      Displayer(scene: JT02(this)),
      Displayer(scene: JT03(this)),
      Displayer(scene: JT04(this)),
      Displayer(scene: JT05(this)),
      Displayer(scene: JT06(this)),
    ];

    _lucaThread = [
      Displayer(scene: LT01(this)),
      Displayer(scene: LT02(this)),
      Displayer(scene: LT03(this)),
      Displayer(scene: LT04(this)),
      Displayer(scene: LT05(this)),
      Displayer(scene: LT06(this)),
    ];

    _danielThread = [
      Displayer(scene: DT01(this)),
      Displayer(scene: DT02(this)),
      Displayer(scene: DT03(this)),
      Displayer(scene: DT04(this)),
      Displayer(scene: DT05(this)),
      Displayer(scene: DT06(this)),
    ];

    _kateThread = [
      Displayer(scene: KT01(this)),
      Displayer(scene: KT02(this)),
      Displayer(scene: KT03(this)),
      Displayer(scene: KT04(this)),
      Displayer(scene: KT05(this)),
      Displayer(scene: KT06(this)),
      Displayer(scene: KT07(this)),
      Displayer(scene: KT08(this)),
    ];

    _mikeThread = [
      Displayer(scene: MK01(this)),
      Displayer(scene: MK02(this)),
      Displayer(scene: MK03(this)),
      Displayer(scene: MK04(this)),
      Displayer(scene: MK05(this)),
      Displayer(scene: MK06(this)),
      Displayer(scene: MK07(this)),
      Displayer(scene: MK08(this)),
    ];

    _mainThread = [
      Displayer(scene: MT01(this)),
      Displayer(scene: MT02(this)),
      Displayer(scene: MT03(this)),
      Displayer(scene: MT04(this)),
      Displayer(scene: MT05(this)),
      Displayer(scene: MT06(this)),
      Displayer(scene: MT07(this)),
      Displayer(scene: MT08(this)),
      Displayer(scene: MT09(this)),
      Displayer(scene: MT10(this)),
      Displayer(scene: MT11(this)),
      Displayer(scene: MT12(this)),
      Displayer(scene: MT13(this)),
      Displayer(scene: MT14(this)),
      Displayer(scene: MT15(this)),
      Displayer(scene: MT16(this)),
    ];
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
    // Increment all
    if (_danielThread.length > _danielThreadIndex) _danielThreadIndex++;
    if (_jeffThread.length > _jeffThreadIndex) _jeffThreadIndex++;
    if (_kateThread.length > _kateThreadIndex) _kateThreadIndex++;
    if (_lucaThread.length > _lucaThreadIndex) _lucaThreadIndex++;
    if (_mikeThread.length > _mikeThreadIndex) _mikeThreadIndex++;
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

  bool _setAllButtons({bool to}) {
    jeffButton = to;
    kateButton = to;
    mikeButton = to;
    danielButton = to;
    lucaButton = to;
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

    _sceneController.add(true);
  }

  void playDanielThreadScene() {
    if (_danielThread.length > _danielThreadIndex) {
      _scene = _danielThread[_danielThreadIndex];

      if (_danielThreadIndex == 0) {
        _danielThreadIndex++;
        danielButton = false;
        if (_areAllButtonsDisabled()) _setAllButtons(to: true);
      } else {
        //Increment all scenes
        _incrementAllIndexes();
      }

      _sceneController.add(true);
    } else {
      if (_areThreadsEnded()) {
        playMainThreadScene();
      }
    }
  }

  void playMikeThreadScene() {
    if (_mikeThread.length > _mikeThreadIndex) {
      _scene = _mikeThread[_mikeThreadIndex];

      if (_mikeThreadIndex == 0) {
        _mikeThreadIndex++;
        mikeButton = false;
        if (_areAllButtonsDisabled()) _setAllButtons(to: true);
      } else {
        //Increment all scenes
        _incrementAllIndexes();
      }

      _sceneController.add(true);
    } else {
      if (_areThreadsEnded()) {
        playMainThreadScene();
      }
    }
  }

  void playLucaThreadScene() {
    if (_lucaThread.length > _lucaThreadIndex) {
      _scene = _lucaThread[_lucaThreadIndex];

      if (_lucaThreadIndex == 0) {
        _lucaThreadIndex++;
        lucaButton = false;
        if (_areAllButtonsDisabled()) _setAllButtons(to: true);
      } else {
        //Increment all scenes
        _incrementAllIndexes();
      }

      _sceneController.add(true);
    } else {
      if (_areThreadsEnded()) {
        playMainThreadScene();
      }
    }
  }

  void playKateThreadScene() {
    if (_kateThread.length > _kateThreadIndex) {
      _scene = _kateThread[_kateThreadIndex];

      if (_kateThreadIndex == 0) {
        _kateThreadIndex++;
        kateButton = false;
        if (_areAllButtonsDisabled()) _setAllButtons(to: true);
      } else {
        //Increment all scenes
        _incrementAllIndexes();
      }

      _sceneController.add(true);
    } else {
      if (_areThreadsEnded()) {
        playMainThreadScene();
      }
    }
  }

  void playJeffThreadScene() {
    if (_jeffThread.length > _jeffThreadIndex) {
      _scene = _jeffThread[_jeffThreadIndex];

      if (_jeffThreadIndex == 0) {
        _jeffThreadIndex++;
        jeffButton = false;
        if (_areAllButtonsDisabled()) _setAllButtons(to: true);
      } else {
        //Increment all scenes
        _incrementAllIndexes();
      }

      _sceneController.add(true);
    } else {
      if (_areThreadsEnded()) {
        playMainThreadScene();
      }
    }
  }

  Displayer _initialScene() {
    // Load last played scene from shared prefs

    // In other case start with MT01
    _mainThreadIndex = 11;

    final scene = _mainThread[_mainThreadIndex];
    return scene;
  }

  void showStatisticsScreen() {}

  @override
  Widget build(BuildContext context) {
    _scene = _initialScene();

    return StreamBuilder(
      stream: this._sceneController.stream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return _scene;
        } else if (snapshot.hasError) {
          return Container();
        } else {
          return _scene;
        }
      },
    );
  }
}
