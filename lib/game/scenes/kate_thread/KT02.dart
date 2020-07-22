import 'dart:ui';
import 'package:detective_game/game/gameplay.dart';
import 'package:detective_game/game/scene/scene.dart';

// DT01 ==> Daniel Thread (Scene) 01
class KT02 extends Scene {
  // Asset Paths
  static List<String> bgdImages = <String>[
    'locations/kate_thread/02',
    'locations/kate_thread/03',
  ];

  static List<String> dlgFiles = <String>[
    'assets/audio/dialogues/kate_thread/02/transcript.txt', // Txt file with transcript of each dialogue(1 line - 1 dialogue)
    'audio/dialogues/kate_thread/02/01.mp3', // Other lines are audio files of each dialogue
    'audio/dialogues/kate_thread/02/02.mp3',
    'audio/dialogues/kate_thread/02/03.mp3',
    'audio/dialogues/kate_thread/02/04.mp3',
    'audio/dialogues/kate_thread/02/05.mp3',
    'audio/dialogues/kate_thread/02/06.mp3',
    'audio/dialogues/kate_thread/02/07.mp3',
    'audio/dialogues/kate_thread/02/08.mp3',
    'audio/dialogues/kate_thread/02/09.mp3',
    'audio/dialogues/kate_thread/02/10.mp3',
    'audio/dialogues/kate_thread/02/11.mp3',
    'audio/dialogues/kate_thread/02/12.mp3',
    'audio/dialogues/kate_thread/02/13.mp3',
    'audio/dialogues/kate_thread/02/14.mp3',
    'audio/dialogues/kate_thread/02/15.mp3',
  ];

  static List<int> chgBackground = <int>[2];
  static String ambient = 'audio/effects/birds.mp3';

  KT02(Gameplay gameplay)
      : super(bgdImages, dlgFiles, chgBackground, gameplay, ambient);

  @override
  void nextScene() {
    // Come back to scene
    this.gameplay.playMainThreadScene(index: 11);
  }
}
