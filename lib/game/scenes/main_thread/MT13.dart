import 'dart:ui';
import 'package:detective_game/game/gameplay.dart';
import 'package:detective_game/game/scene/scene.dart';

// MT01 ==> Main Thread (Scene) 02
class MT13 extends Scene {

  // Asset Paths
  static List<String> bgdImages = <String>[
    'locations/main_thread/13/01',
    'locations/main_thread/13/02',
    'locations/main_thread/13/02',
  ];
  
  static List<String> dlgFiles = <String>[
    'assets/audio/dialogues/main_thread/13/transcript.txt',   // Txt file with transcript of each dialogue(1 line - 1 dialogue)
    'audio/dialogues/main_thread/13/01.mp3',                  // Other lines are audio files of each dialogue
    'audio/dialogues/main_thread/13/02.mp3',
    'audio/dialogues/main_thread/13/03.mp3',
    'audio/dialogues/main_thread/13/04.mp3',
    'audio/dialogues/main_thread/13/05_a.mp3',
    'audio/dialogues/main_thread/13/05_b.mp3',
    'audio/dialogues/main_thread/13/05_c.mp3',
    'audio/dialogues/main_thread/13/05_d.mp3',
    'audio/dialogues/main_thread/13/06.mp3',
    'audio/dialogues/main_thread/13/07_a.mp3',
    'audio/dialogues/main_thread/13/07_b_a.mp3',
    'audio/dialogues/main_thread/13/07_b_b.mp3',
    'audio/dialogues/main_thread/13/07_b_c.mp3',
    'audio/dialogues/main_thread/13/07_c.mp3',
    'audio/dialogues/main_thread/13/07_d.mp3',
    'audio/dialogues/main_thread/13/08.mp3',
    'audio/dialogues/main_thread/13/09.mp3',
    'audio/dialogues/main_thread/13/10.mp3',
    'audio/dialogues/main_thread/13/11_a.mp3',
    'audio/dialogues/main_thread/13/11_b.mp3',
    'audio/dialogues/main_thread/13/11_c.mp3',
    'audio/dialogues/main_thread/13/12.mp3',
    'audio/dialogues/main_thread/13/13.mp3',
  ];
  
  MT13(Gameplay gameplay) : super(bgdImages, dlgFiles, gameplay);
  
  @override
  void update(double t) {
    super.update(t);
  }

}