import 'dart:ui';
import 'package:detective_game/game/gameplay.dart';
import 'package:detective_game/game/scene/scene.dart';

// MT01 ==> Main Thread (Scene) 02
class MT13 extends Scene {
  // Asset Paths
  static List<String> bgdImages = <String>[
    'locations/main_thread/16',
    'locations/main_thread/17',
  ];

  static List<String> dlgFiles = <String>[
    'assets/audio/dialogues/main_thread/13/transcript.txt', // Txt file with transcript of each dialogue(1 line - 1 dialogue)
    'audio/dialogues/main_thread/13/01.mp3', // Other lines are audio files of each dialogue
    'audio/dialogues/main_thread/13/02.mp3',
    'audio/dialogues/main_thread/13/03.mp3',
    'audio/dialogues/main_thread/13/04.mp3',
    'audio/dialogues/main_thread/13/05.mp3',
    'audio/dialogues/main_thread/13/06.mp3',
  ];

  static List<int> chgBackground = <int>[3];

  MT13(Gameplay gameplay) : super(bgdImages, dlgFiles, chgBackground, gameplay);
}
