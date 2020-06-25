import 'dart:ui';
import 'package:detective_game/game/gameplay.dart';
import 'package:detective_game/game/scene/scene.dart';

// MT01 ==> Main Thread (Scene) 02
class MT05 extends Scene {

  // Asset Paths
  static List<String> bgdImages = <String>[
    'locations/main_thread/05/01',
  ];
  
  static List<String> dlgFiles = <String>[
    'assets/audio/dialogues/main_thread/05/transcript.txt',   // Txt file with transcript of each dialogue(1 line - 1 dialogue)
    'audio/dialogues/main_thread/05/01.mp3',                  // Other lines are audio files of each dialogue
    'audio/dialogues/main_thread/05/02.mp3',
    'audio/dialogues/main_thread/05/03.mp3',
    'audio/dialogues/main_thread/05/04.mp3',
    'audio/dialogues/main_thread/05/05_a.mp3',
    'audio/dialogues/main_thread/05/05_b.mp3',
    'audio/dialogues/main_thread/05/05_c.mp3',
    'audio/dialogues/main_thread/05/06_a.mp3',
    'audio/dialogues/main_thread/05/06_b.mp3',
    'audio/dialogues/main_thread/05/06_c.mp3',
    'audio/dialogues/main_thread/05/07.mp3',
    'audio/dialogues/main_thread/05/08.mp3',
    'audio/dialogues/main_thread/05/09.mp3',
  ];

  MT05(Gameplay gameplay) : super(bgdImages, dlgFiles, gameplay);
  
  @override
  void update(double t) {
    super.update(t);
  }

}