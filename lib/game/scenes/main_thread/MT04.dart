import 'dart:ui';
import 'package:detective_game/game/gameplay.dart';
import 'package:detective_game/game/scene/scene.dart';

// MT01 ==> Main Thread (Scene) 02
class MT04 extends Scene {

  // Asset Paths
  static List<String> bgdImages = <String>[
    'locations/main_thread/04/01',
    'locations/main_thread/04/02',
  ];
  
  static List<String> dlgFiles = <String>[
    'assets/audio/dialogues/main_thread/04/transcript.txt',   // Txt file with transcript of each dialogue(1 line - 1 dialogue)
    'audio/dialogues/main_thread/04/01.mp3',                  // Other lines are audio files of each dialogue
    'audio/dialogues/main_thread/04/02.mp3',
    'audio/dialogues/main_thread/04/03.mp3',
    'audio/dialogues/main_thread/04/04_a.mp3',
    'audio/dialogues/main_thread/04/04_b.mp3',
    'audio/dialogues/main_thread/04/04_c.mp3',
    'audio/dialogues/main_thread/04/05_a.mp3',
    'audio/dialogues/main_thread/04/05_b.mp3',
    'audio/dialogues/main_thread/04/05_c.mp3',
    'audio/dialogues/main_thread/04/06.mp3',
    'audio/dialogues/main_thread/04/07.mp3',
    'audio/dialogues/main_thread/04/08.mp3',
    'audio/dialogues/main_thread/04/09.mp3',
    'audio/dialogues/main_thread/04/10.mp3',
    'audio/dialogues/main_thread/04/11_a.mp3',
    'audio/dialogues/main_thread/04/11_b.mp3',
    'audio/dialogues/main_thread/04/11_c.mp3',
    'audio/dialogues/main_thread/04/12.mp3',
    'audio/dialogues/main_thread/04/13.mp3',
  ];

  MT04(Gameplay gameplay) : super(bgdImages, dlgFiles, gameplay);
  
  @override
  void update(double t) {
    super.update(t);
  }

}