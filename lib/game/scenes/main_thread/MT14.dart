import 'dart:ui';
import 'package:detective_game/game/gameplay.dart';
import 'package:detective_game/game/scene/scene.dart';

// MT01 ==> Main Thread (Scene) 02
class MT14 extends Scene {
  // Asset Paths
  static List<String> bgdImages = <String>[
    'locations/main_thread/01',
    'locations/main_thread/02',
    'locations/main_thread/18',
  ];

  static List<String> dlgFiles = <String>[
    'assets/audio/dialogues/main_thread/14/transcript.txt', // Txt file with transcript of each dialogue(1 line - 1 dialogue)
    'audio/dialogues/main_thread/14/01.mp3', // Other lines are audio files of each dialogue
    'audio/dialogues/main_thread/14/02.mp3',
    'audio/dialogues/main_thread/14/03.mp3',
    'audio/dialogues/main_thread/14/04.mp3',
    'audio/dialogues/main_thread/14/05_a.mp3',
    'audio/dialogues/main_thread/14/05_b.mp3',
    'audio/dialogues/main_thread/14/05_c.mp3',
    'audio/dialogues/main_thread/14/05_d.mp3',
    'audio/dialogues/main_thread/14/06.mp3',
    'audio/dialogues/main_thread/14/07_a.mp3',
    'audio/dialogues/main_thread/14/07_b_a.mp3',
    'audio/dialogues/main_thread/14/07_b_b.mp3',
    'audio/dialogues/main_thread/14/07_b_c.mp3',
    'audio/dialogues/main_thread/14/07_c.mp3',
    'audio/dialogues/main_thread/14/07_d.mp3',
    'audio/dialogues/main_thread/14/08.mp3',
    'audio/dialogues/main_thread/14/09.mp3',
    'audio/dialogues/main_thread/14/10.mp3',
    'audio/dialogues/main_thread/14/11_a.mp3',
    'audio/dialogues/main_thread/14/11_b.mp3',
    'audio/dialogues/main_thread/14/11_c.mp3',
    'audio/dialogues/main_thread/14/12.mp3',
    'audio/dialogues/main_thread/14/13.mp3',
  ];

  static List<int> chgBackground = <int>[];

  MT14(Gameplay gameplay) : super(bgdImages, dlgFiles, chgBackground, gameplay);
}
