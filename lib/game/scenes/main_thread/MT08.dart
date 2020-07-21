import 'dart:ui';
import 'package:detective_game/game/gameplay.dart';
import 'package:detective_game/game/scene/scene.dart';

// MT01 ==> Main Thread (Scene) 02
class MT08 extends Scene {
  // Asset Paths
  static List<String> bgdImages = <String>[
    'locations/main_thread/10',
    'locations/main_thread/11',
    'locations/main_thread/12',
  ];

  static List<String> dlgFiles = <String>[
    'assets/audio/dialogues/main_thread/08/transcript.txt', // Txt file with transcript of each dialogue(1 line - 1 dialogue)
    'audio/dialogues/main_thread/08/01.mp3', // Other lines are audio files of each dialogue
    'audio/dialogues/main_thread/08/02.mp3',
    'audio/dialogues/main_thread/08/03.mp3',
    'audio/dialogues/main_thread/08/04.mp3',
    'audio/dialogues/main_thread/08/05.mp3',
    'audio/dialogues/main_thread/08/06.mp3',
    'audio/dialogues/main_thread/08/07.mp3',
    'audio/dialogues/main_thread/08/08.mp3',
    'audio/dialogues/main_thread/08/09.mp3',
    'audio/dialogues/main_thread/08/10.mp3',
    'audio/dialogues/main_thread/08/11.mp3',
    'audio/dialogues/main_thread/08/12.mp3',
  ];

  static List<int> chgBackground = <int>[4, 12];

  MT08(Gameplay gameplay) : super(bgdImages, dlgFiles, chgBackground, gameplay);
}
