import 'dart:ui';
import 'package:detective_game/game/gameplay.dart';
import 'package:detective_game/game/scene/scene.dart';

// DT01 ==> Daniel Thread (Scene) 01
class KT05 extends Scene {
  // Asset Paths
  static List<String> bgdImages = <String>[
    'locations/kate_thread/04',
    'locations/kate_thread/05',
    'locations/kate_thread/07',
  ];

  static List<String> dlgFiles = <String>[
    'assets/audio/dialogues/kate_thread/05/transcript.txt', // Txt file with transcript of each dialogue(1 line - 1 dialogue)
    'audio/dialogues/kate_thread/05/01.mp3',
    'audio/dialogues/kate_thread/05/02.mp3',
    'audio/dialogues/kate_thread/05/03.mp3',
    'audio/dialogues/kate_thread/05/04.mp3',
    'audio/dialogues/kate_thread/05/05.mp3',
    'audio/dialogues/kate_thread/05/06.mp3',
    'audio/dialogues/kate_thread/05/07.mp3',
    'audio/dialogues/kate_thread/05/08.mp3',
    'audio/dialogues/kate_thread/05/09.mp3',
    'audio/dialogues/kate_thread/05/10.mp3',
  ];

  static List<int> chgBackground = <int>[2, 3];
  static String ambient = 'audio/effects/plane.mp3';

  KT05(Gameplay gameplay)
      : super(bgdImages, dlgFiles, chgBackground, gameplay, ambient);

  @override
  void nextScene() {
    // Come back to scene
    this.gameplay.playMainThreadScene(index: 11);
  }
}
