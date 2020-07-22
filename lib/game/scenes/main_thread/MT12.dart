import 'dart:ui';
import 'package:detective_game/game/gameplay.dart';
import 'package:detective_game/game/scene/scene.dart';
import 'package:flame/flame.dart';

// MT01 ==> Main Thread (Scene) 02
class MT12 extends Scene {
  // Asset Paths
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
      this.gameplay.playMikeThreadScene();
    } else if (id == 2) {
      this.gameplay.playKateThreadScene();
    } else if (id == 3) {
      this.gameplay.playLucaThreadScene();
    } else if (id == 4) {
      this.gameplay.playDanielThreadScene();
    } else if (id == 5) {
      this.gameplay.playJeffThreadScene();
    }
  }

  @override
  void onEnd() {
    this.hideUI();
    if (this.gameplay.partialsFinished) {
      this.gameplay.playMainThreadScene();
    } else {
      this.gameplay.sceneController.add(true);
    }
    Flame.assets.clearCache();
  }

  @override
  void onTap() {
    if (this.gameplay.noneOfPartialsPlayed) {
      final val =
          "Click to choose between cameras installed in rooms. Wyatt will hear a fragment of chosen interrogation or victim's memories. In other room's there are continuous, independent interrogations so choose wisely!";
      this.uiManager.showSimpleMessage(val);
    } else if (this.gameplay.allPartialThreadsFinished) {
      final val = "All interrogations ended.";
      this.uiManager.showSimpleMessage(val);
    } else {
      this.uiManager.showSimpleMessage(null);
    }
  }
}
