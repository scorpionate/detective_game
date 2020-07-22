import 'dart:ui';
import 'package:detective_game/game/gameplay.dart';
import 'package:detective_game/game/scene/scene.dart';

// DT01 ==> Daniel Thread (Scene) 01
class LT06 extends Scene {
  // Asset Paths
  static List<String> bgdImages = <String>[
    'locations/luca_thread/05',
    'locations/luca_thread/06',
    'locations/luca_thread/02',
  ];

  static List<String> dlgFiles = <String>[
    'assets/audio/dialogues/luca_thread/06/transcript.txt', // Txt file with transcript of each dialogue(1 line - 1 dialogue)
    'audio/dialogues/luca_thread/06/01.mp3', // Other lines are audio files of each dialogue
    'audio/dialogues/luca_thread/06/02.mp3',
    'audio/dialogues/luca_thread/06/03.mp3',
    'audio/dialogues/luca_thread/06/04.mp3',
  ];

  static List<int> chgBackground = <int>[1, 3];
  static String ambient;
  LT06(Gameplay gameplay)
      : super(bgdImages, dlgFiles, chgBackground, gameplay, ambient);

  @override
  void nextScene() {
    // Come back to scene
    this.gameplay.playMainThreadScene(index: 11);
  }
}
