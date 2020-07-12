import 'dart:ui';
import 'package:detective_game/game/gameplay.dart';
import 'package:detective_game/game/scene/scene.dart';

// MT01 ==> Main Thread (Scene) 02
class MT10 extends Scene {

  // Asset Paths
  static List<String> bgdImages = <String>[
    'locations/main_thread/10/01',
    'locations/main_thread/10/02',
  ];
  
  static List<String> dlgFiles = <String>[
    'assets/audio/dialogues/main_thread/10/transcript.txt',   // Txt file with transcript of each dialogue(1 line - 1 dialogue)
    'audio/dialogues/main_thread/10/01.mp3',                  // Other lines are audio files of each dialogue
    'audio/dialogues/main_thread/10/02_a.mp3',
    'audio/dialogues/main_thread/10/02_b.mp3',
    'audio/dialogues/main_thread/10/02_c.mp3',
    'audio/dialogues/main_thread/10/03.mp3',
    'audio/dialogues/main_thread/10/04.mp3',
    'audio/dialogues/main_thread/10/05.mp3',
    'audio/dialogues/main_thread/10/06.mp3',
    'audio/dialogues/main_thread/10/07.mp3',
    'audio/dialogues/main_thread/10/08.mp3',
    'audio/dialogues/main_thread/10/09.mp3',
    'audio/dialogues/main_thread/10/10_a.mp3',
    'audio/dialogues/main_thread/10/10_b.mp3',
    'audio/dialogues/main_thread/10/10_c.mp3',
    'audio/dialogues/main_thread/10/11.mp3',
  ];
  
  MT10(Gameplay gameplay) : super(bgdImages, dlgFiles, gameplay);
  
  @override
  void update(double t) {
    super.update(t);
  }

}