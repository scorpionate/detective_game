import 'dart:async';
import 'package:flutter/material.dart';

import 'package:detective_game/model/game_state.dart';
import 'package:detective_game/screens/stats_screen.dart';
import 'package:detective_game/services/local_save_manager.dart';
import 'package:detective_game/game/scene/scene.dart';
import 'package:detective_game/game/scene/displayer.dart';
import 'package:detective_game/game/scene/managers/background_ambient_manager.dart';
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

enum PartialScene { luca, daniel, jeff, kate, mike }

class _GamePlayData {
// This is Gameplay, which controls... gameplay!
// Gameplay data contains all references to scenes, controls and get&set
// Gameplay is widget displayng specific scene to the user
// Gameplay manages flow and order of scenes
// Gameplay provides methods for changing scenes
  final StreamController<bool> controller = StreamController<bool>.broadcast();
  final ambient = BackgroundAmbientManager();

  // List with prepared scenes ready to be played
  final List<Displayer> jeffThread = List<Displayer>();
  final List<Displayer> kateThread = List<Displayer>();
  final List<Displayer> lucaThread = List<Displayer>();
  final List<Displayer> mainThread = List<Displayer>();
  final List<Displayer> mikeThread = List<Displayer>();
  final List<Displayer> danielThread = List<Displayer>();

  // Indexes to control scenes
  int jeffThreadIndex = 0;
  int kateThreadIndex = 0;
  int lucaThreadIndex = 0;
  int mainThreadIndex = 0;
  int mikeThreadIndex = 0;
  int danielThreadIndex = 0;

  // Bottom buttons state required for scene MT11 & MT12
  // Needs to stare state here
  bool jeffButton = true;
  bool kateButton = true;
  bool lucaButton = true;
  bool mikeButton = true;
  bool danielButton = true;

  // Current scene
  var scene;
  bool partialsThreadsEndedTrigger = false;

  void initializeMainThread(Gameplay obj) {
    // Initializes scenes and preload assets
    mainThread.add(Displayer(scene: MT01(obj)));
    mainThread.add(Displayer(scene: MT02(obj)));
    mainThread.add(Displayer(scene: MT03(obj)));
    mainThread.add(Displayer(scene: MT04(obj)));
    mainThread.add(Displayer(scene: MT05(obj)));
    mainThread.add(Displayer(scene: MT06(obj)));
    mainThread.add(Displayer(scene: MT07(obj)));
    mainThread.add(Displayer(scene: MT08(obj)));
    mainThread.add(Displayer(scene: MT09(obj)));
    mainThread.add(Displayer(scene: MT10(obj)));
    mainThread.add(Displayer(scene: MT11(obj)));
    mainThread.add(Displayer(scene: MT12(obj)));
    mainThread.add(Displayer(scene: MT13(obj)));
    mainThread.add(Displayer(scene: MT14(obj)));
    mainThread.add(Displayer(scene: MT15(obj)));
    mainThread.add(Displayer(scene: MT16(obj)));
  }

  void initializeOtherThreads(Gameplay obj) {
    // Initializes scenes and preload assets
    jeffThread.add(Displayer(scene: JT01(obj)));
    jeffThread.add(Displayer(scene: JT02(obj)));
    jeffThread.add(Displayer(scene: JT03(obj)));
    jeffThread.add(Displayer(scene: JT04(obj)));
    jeffThread.add(Displayer(scene: JT05(obj)));
    jeffThread.add(Displayer(scene: JT06(obj)));

    lucaThread.add(Displayer(scene: LT01(obj)));
    lucaThread.add(Displayer(scene: LT02(obj)));
    lucaThread.add(Displayer(scene: LT03(obj)));
    lucaThread.add(Displayer(scene: LT04(obj)));
    lucaThread.add(Displayer(scene: LT05(obj)));
    lucaThread.add(Displayer(scene: LT06(obj)));

    danielThread.add(Displayer(scene: DT01(obj)));
    danielThread.add(Displayer(scene: DT02(obj)));
    danielThread.add(Displayer(scene: DT03(obj)));
    danielThread.add(Displayer(scene: DT04(obj)));
    danielThread.add(Displayer(scene: DT05(obj)));
    danielThread.add(Displayer(scene: DT06(obj)));

    kateThread.add(Displayer(scene: KT01(obj)));
    kateThread.add(Displayer(scene: KT02(obj)));
    kateThread.add(Displayer(scene: KT03(obj)));
    kateThread.add(Displayer(scene: KT04(obj)));
    kateThread.add(Displayer(scene: KT05(obj)));
    kateThread.add(Displayer(scene: KT06(obj)));
    kateThread.add(Displayer(scene: KT07(obj)));
    kateThread.add(Displayer(scene: KT08(obj)));

    mikeThread.add(Displayer(scene: MK01(obj)));
    mikeThread.add(Displayer(scene: MK02(obj)));
    mikeThread.add(Displayer(scene: MK03(obj)));
    mikeThread.add(Displayer(scene: MK04(obj)));
    mikeThread.add(Displayer(scene: MK05(obj)));
    mikeThread.add(Displayer(scene: MK06(obj)));
    mikeThread.add(Displayer(scene: MK07(obj)));
    mikeThread.add(Displayer(scene: MK08(obj)));
  }

  bool get areAllScenesLoaded {
    for (int i = 0; i < jeffThread.length; i++)
      if (!jeffThread[i].scene.assetsLoaded) return false;
    for (int i = 0; i < lucaThread.length; i++)
      if (!lucaThread[i].scene.assetsLoaded) return false;
    for (int i = 0; i < danielThread.length; i++)
      if (!danielThread[i].scene.assetsLoaded) return false;
    for (int i = 0; i < kateThread.length; i++)
      if (!kateThread[i].scene.assetsLoaded) return false;
    for (int i = 0; i < mikeThread.length; i++)
      if (!mikeThread[i].scene.assetsLoaded) return false;
    for (int i = 0; i < mainThread.length; i++)
      if (!mainThread[i].scene.assetsLoaded) return false;

    return true;
  }

  bool get arePartialThreadsEnded {
    bool a = false, b = false, c = false, d = false, e = false;

    if (danielThread.length <= danielThreadIndex) a = true;
    if (mikeThread.length <= mikeThreadIndex) b = true;
    if (lucaThread.length <= lucaThreadIndex) c = true;
    if (kateThread.length <= kateThreadIndex) d = true;
    if (kateThread.length <= kateThreadIndex) e = true;

    if (a && b && c && d && e)
      return true;
    else
      return false;
  }

  bool get arePartialThreadsAtStart {
    bool a = false, b = false, c = false, d = false, e = false;

    if (danielThreadIndex == 0) a = true;
    if (mikeThreadIndex == 0) b = true;
    if (lucaThreadIndex == 0) c = true;
    if (kateThreadIndex == 0) d = true;
    if (jeffThreadIndex == 0) e = true;

    if (a && b && c && d && e)
      return true;
    else
      return false;
  }

  void incrementAllIndexes() {
    _disableShorterThreads() {
      danielButton = false;
      jeffButton = false;
      lucaButton = false;
    }

    // Increment all indexes
    if (danielThread.length > danielThreadIndex) danielThreadIndex++;
    if (jeffThread.length > jeffThreadIndex) jeffThreadIndex++;
    if (kateThread.length > kateThreadIndex) kateThreadIndex++;
    if (lucaThread.length > lucaThreadIndex) lucaThreadIndex++;
    if (mikeThread.length > mikeThreadIndex) mikeThreadIndex++;

    // This threads are shorter - need to disable buttons in UI
    if (danielThreadIndex == danielThread.length ||
        lucaThreadIndex == lucaThread.length ||
        jeffThreadIndex == jeffThread.length) _disableShorterThreads();
  }

  void incrementIndex(PartialScene who) {
    if (who == PartialScene.daniel) {
      danielThreadIndex++;
    } else if (who == PartialScene.jeff) {
      jeffThreadIndex++;
    } else if (who == PartialScene.kate) {
      kateThreadIndex++;
    } else if (who == PartialScene.luca) {
      lucaThreadIndex++;
    } else if (who == PartialScene.mike) {
      mikeThreadIndex++;
    }
  }

  bool get areAllButtonsDisabled {
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

  void setButton(PartialScene who, val) {
    if (who == PartialScene.daniel) {
      danielButton = val;
    } else if (who == PartialScene.jeff) {
      jeffButton = val;
    } else if (who == PartialScene.kate) {
      kateButton = val;
    } else if (who == PartialScene.luca) {
      lucaButton = val;
    } else if (who == PartialScene.mike) {
      mikeButton = val;
    }
  }

  set setAllButtonsTo(bool to) {
    jeffButton = to;
    kateButton = to;
    mikeButton = to;
    lucaButton = to;
    danielButton = to;
  }

  void playMainThreadScene({int index}) {
    // Index is optional, may be not provided
    if (index == null) {
      mainThreadIndex++;
      scene = mainThread[mainThreadIndex];
    } else {
      scene = mainThread[index];
      final val = scene as Displayer;
      val.scene.fadeOut = false;
    }

    LocalSaveManager().saveGameState(GameState(mainThreadIndex));
    controller.add(true);
  }

  void playPartialScene(PartialScene who) {
    var list;
    var index;

    // Decide which thread is playing
    if (who == PartialScene.daniel) {
      list = danielThread;
      index = danielThreadIndex;
    } else if (who == PartialScene.jeff) {
      list = jeffThread;
      index = jeffThreadIndex;
    } else if (who == PartialScene.kate) {
      list = kateThread;
      index = kateThreadIndex;
    } else if (who == PartialScene.luca) {
      list = lucaThread;
      index = lucaThreadIndex;
    } else if (who == PartialScene.mike) {
      list = mikeThread;
      index = mikeThreadIndex;
    }

    // Play scene
    if (list.length > index) {
      this.scene.scene.uiManager.fadeIn();
      this.scene = list[index];

      // First sequence is mandatory for each thread
      // This provides user from going further unless he
      // plays first scene from each thread
      if (index == 0) {
        this.incrementIndex(who);
        this.setButton(who, false);
        if (this.areAllButtonsDisabled) this.setAllButtonsTo = true;
      } else {
        incrementAllIndexes();
      }
    } else {
      if (this.arePartialThreadsEnded) {
        // Proceed to next Main Thread Scene after animation
        this.partialsThreadsEndedTrigger = true;
        this.scene.scene.uiManager.fadeIn();
      }
    }
  }
}

class Gameplay extends StatefulWidget {
// Manage gameplay, toggle between scenes
  final data = _GamePlayData();

  void showStatisticsScreen() =>
      data.controller.addError('Come back to statistics');

  @override
  _GameplayState createState() => _GameplayState();
}

class _GameplayState extends State<Gameplay> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    // Stop Background's theme
    widget.data.ambient.stopAmbientBackground();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.inactive) {
      _onInactive();
    }
    if (state == AppLifecycleState.resumed) {
      _onResumed();
    }
    if (state == AppLifecycleState.detached) {}
    if (state == AppLifecycleState.paused) {}
  }

  @override
  Widget build(BuildContext context) {
    _onInit();

    return WillPopScope(
      onWillPop: () async {
        final scene = widget.data.scene.scene as Scene;
        scene.backgroundAmbientManager.stopAmbientBackground();
        scene.dialogueManager.stopAllSounds();
        widget.data.ambient.stopAmbientBackground();
        return true;
      },
      child: StreamBuilder(
        stream: widget.data.controller.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return widget.data.scene;
          } else if (snapshot.hasError) {
            return StatsScreen();
          } else {
            return Container();
          }
        },
      ),
    );
  }

  void _onInit() async {
    // Preload scenes
    widget.data.initializeMainThread(widget);
    widget.data.initializeOtherThreads(widget);

    // Load last played scene from shared prefs
    final state = await LocalSaveManager().loadGameState();
    widget.data.mainThreadIndex = state.mainThreadIndex; // Neccessary!

    //Play Scene and background theme
    widget.data.playMainThreadScene(index: widget.data.mainThreadIndex);
    widget.data.ambient
        .playAmbientBackground('audio/effects/background_theme.mp3');
  }

  void _onInactive() {
    final scene = widget.data.scene.scene as Scene;
    scene.dialogueManager.pauseDialogue();
    scene.backgroundAmbientManager.pauseAmbientBackground();
    widget.data.ambient.pauseAmbientBackground();
  }

  void _onResumed() {
    final scene = widget.data.scene.scene as Scene;
    scene.dialogueManager.resumeDialogue();
    scene.backgroundAmbientManager.resumeAmbientBackground();
    widget.data.ambient.resumeAmbientBackground();
  }
}
