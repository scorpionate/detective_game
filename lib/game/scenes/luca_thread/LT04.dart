import 'dart:ui';
import 'package:detective_game/game/gameplay.dart';
import 'package:detective_game/game/scene/scene.dart';

// DT01 ==> Daniel Thread (Scene) 01
class LT04 extends Scene {
  // Asset Paths
  static List<String> bgdImages = <String>[
    'locations/luca_thread/04',
    'locations/luca_thread/01',
  ];

  static List<String> dlgFiles = <String>[
    'assets/audio/dialogues/luca_thread/04/transcript.txt', // Txt file with transcript of each dialogue(1 line - 1 dialogue)
    'audio/dialogues/luca_thread/04/01.mp3', // Other lines are audio files of each dialogue
    'audio/dialogues/luca_thread/04/02.mp3',
    'audio/dialogues/luca_thread/04/03.mp3',
    'audio/dialogues/luca_thread/04/04.mp3',
    'audio/dialogues/luca_thread/04/05.mp3',
    'audio/dialogues/luca_thread/04/06.mp3',
    'audio/dialogues/luca_thread/04/07.mp3',
    'audio/dialogues/luca_thread/04/08.mp3',
  ];

  static List<int> chgBackground = <int>[6];
  static String ambient;

  LT04(Gameplay gameplay)
      : super(bgdImages, dlgFiles, chgBackground, gameplay, ambient);

  @override
  void nextScene() {
    // Come back to scene
    this.gameplay.playMainThreadScene(index: 11);
  }
}
