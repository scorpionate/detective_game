import 'dart:ui';
import 'package:detective_game/game/gameplay.dart';
import 'package:detective_game/game/scene/scene.dart';

// MT01 ==> Main Thread (Scene) 02
class MT07 extends Scene {
  // Asset Paths
  static List<String> bgdImages = <String>[
    'locations/main_thread/09',
  ];

  static List<String> dlgFiles = <String>[
    'assets/audio/dialogues/main_thread/07/transcript.txt', // Txt file with transcript of each dialogue(1 line - 1 dialogue)
    'audio/dialogues/main_thread/07/01.mp3', // Other lines are audio files of each dialogue
    'audio/dialogues/main_thread/07/02.mp3',
    'audio/dialogues/main_thread/07/03.mp3',
    'audio/dialogues/main_thread/07/04.mp3',
    'audio/dialogues/main_thread/07/05.mp3',
    'audio/dialogues/main_thread/07/06.mp3',
    'audio/dialogues/main_thread/07/07_a.mp3',
    'audio/dialogues/main_thread/07/07_b.mp3',
    'audio/dialogues/main_thread/07/07_c.mp3',
    'audio/dialogues/main_thread/07/08_a.mp3',
    'audio/dialogues/main_thread/07/08_b.mp3',
    'audio/dialogues/main_thread/07/08_c.mp3',
    'audio/dialogues/main_thread/07/09.mp3',
    'audio/dialogues/main_thread/07/10.mp3',
    'audio/dialogues/main_thread/07/11.mp3',
    'audio/dialogues/main_thread/07/12.mp3',
    'audio/dialogues/main_thread/07/13.mp3',
    'audio/dialogues/main_thread/07/14.mp3',
  ];

  static List<int> chgBackground = <int>[];

  MT07(Gameplay gameplay) : super(bgdImages, dlgFiles, chgBackground, gameplay);
}
