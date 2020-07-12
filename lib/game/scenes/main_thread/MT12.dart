import 'dart:ui';
import 'package:detective_game/game/gameplay.dart';
import 'package:detective_game/game/scene/scene.dart';

// MT01 ==> Main Thread (Scene) 02
class MT12 extends Scene {
  // Asset Paths
  static List<String> bgdImages = <String>[
    'locations/main_thread/12/01',
  ];

  static List<String> dlgFiles = <String>[];

  MT12(Gameplay gameplay) : super(bgdImages, dlgFiles, gameplay);

  @override
  void bottomButtonClicked({int id}) {
    this.hideUI();

    if (id == 1) {
      this.gameplay.playDanielThreadScene();
    } else if (id == 2) {
      this.gameplay.playJeffThreadScene();
    } else if (id == 3) {
      this.gameplay.playKateThreadScene();
    } else if (id == 4) {
      this.gameplay.playLucaThreadScene();
    } else if (id == 5) {
      this.gameplay.playMikeThreadScene();
    }
  }

  @override
  void onTap() {
    this.showSimpleDialogue('XD');
  }

  @override
  void update(double t) {}
}
