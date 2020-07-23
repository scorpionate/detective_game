import 'dart:ui';
import 'package:flame/flame.dart';
import 'package:wyatts_story/game/gameplay.dart';
import 'package:wyatts_story/game/scene/scene.dart';

// MT12 is manager for playing partial threads. It doesnt contain any self dialogues etc.
// It is a switch between partial scenes and UI displayer
class MT12 extends Scene {
  // MT12 ==> Main Thread (Scene) 12
  // bgdImages: contains background images paths SHOULDNT BE EMPTY
  //
  // dlgFiles: contains dialogues music files paths SHOULDNT BE EMPTY
  // List start from path to file with dialogues saved in txt. Basing on that file,
  // the UI is generated. Scene automatically plays dialogues starting from index 1
  // Transcript.txt should have the number of lines equals dlgFiles.length-1
  //
  // chgBackground: contains int's saying at which dialogue(it's index)
  // scene should change background to the following ones listed in bgdImages MAY BE EMPTY
  // ambient: contains path to ambient backgorund of scene If not null it will be played(in loop)
  // automatically when scene starts and automatically stopped when scene ends
  static List<String> bgdImages = <String>[
    'locations/main_thread/20',
  ];

  static List<String> dlgFiles = <String>[];

  static List<int> chgBackground = <int>[];
  static String ambient;

  MT12(Gameplay gameplay)
      : super(bgdImages, dlgFiles, chgBackground, gameplay, ambient);

  @override
  void bottomButtonClicked({int id}) {
    if (id == 1) {
      this.gameplay.data.playPartialScene(PartialScene.mike);
    } else if (id == 2) {
      this.gameplay.data.playPartialScene(PartialScene.kate);
    } else if (id == 3) {
      this.gameplay.data.playPartialScene(PartialScene.luca);
    } else if (id == 4) {
      this.gameplay.data.playPartialScene(PartialScene.daniel);
    } else if (id == 5) {
      this.gameplay.data.playPartialScene(PartialScene.jeff);
    }
  }

  @override
  void onEnd() {
    this.uiManager.hideUI();
    // Trigger because arePartialThreadsEnded fires before dialogues ends to play
    // Trigger waits to the end of dialogue
    if (this.gameplay.data.partialsThreadsEndedTrigger) {
      this.gameplay.data.playMainThreadScene();
    } else {
      this.gameplay.data.controller.add(true);
    }
    Flame.assets.clearCache();
  }

  @override
  void onTap() {
    if (this.gameplay.data.arePartialThreadsAtStart) {
      final val =
          "Click to choose between cameras installed in rooms. Wyatt will hear a fragment of chosen interrogation or victim's memories. In other room's there are continuous, independent interrogations so choose wisely!";
      this.uiManager.showSimpleMessage(val);
    } else if (this.gameplay.data.arePartialThreadsEnded) {
      final val = "All interrogations ended.";
      this.uiManager.showSimpleMessage(val);
    } else {
      this.uiManager.showSimpleMessage(null);
    }
  }
}
