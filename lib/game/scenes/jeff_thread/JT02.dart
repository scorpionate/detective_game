import 'dart:ui';
import 'package:detective_game/game/gameplay.dart';
import 'package:detective_game/game/scene/scene.dart';

// DT01 ==> Daniel Thread (Scene) 01
class JT02 extends Scene {

  // Asset Paths
  static List<String> bgdImages = <String>[
    'locations/jeff_thread/02/01',
  ];
  
  static List<String> dlgFiles = <String>[
    'assets/audio/dialogues/jeff_thread/02/transcript.txt',   // Txt file with transcript of each dialogue(1 line - 1 dialogue)
    'audio/dialogues/jeff_thread/02/01.mp3',           // Other lines are audio files of each dialogue
    'audio/dialogues/jeff_thread/02/02.mp3',
    'audio/dialogues/jeff_thread/02/03.mp3',
    'audio/dialogues/jeff_thread/02/04.mp3',
    'audio/dialogues/jeff_thread/02/05.mp3',
    'audio/dialogues/jeff_thread/02/06.mp3',
    'audio/dialogues/jeff_thread/02/07.mp3',
    'audio/dialogues/jeff_thread/02/08.mp3',
  ];

  JT02(Gameplay gameplay) : super(bgdImages, dlgFiles, gameplay);
  
  @override
  void update(double t) {}
}