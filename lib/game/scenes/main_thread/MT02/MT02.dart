import 'dart:ui';
import 'package:detective_game/game/scene.dart';

// MT01 ==> Main Thread (Scene) 02
class MT02 extends Scene {

  // Asset Paths
  static List<String> bgdImages = <String>[
    'locations/main_thread/02/01.png',
    'locations/main_thread/02/02.png',
  ];
  
  static List<String> dlgFiles = <String>[
    'dialogues/main_thread/02/transcript.txt',   // Txt file with transcript of each dialogue(1 line - 1 dialogue)
    'dialogues/main_thread/02/01.mp3',           // Other lines are audio files of each dialogue
    'dialogues/main_thread/02/02_a.mp3',
    'dialogues/main_thread/02/02_b.mp3',
    'dialogues/main_thread/02/02_c.mp3',
    'dialogues/main_thread/02/03_a.mp3',
    'dialogues/main_thread/02/03_b.mp3',
    'dialogues/main_thread/02/03_c.mp3',
    'dialogues/main_thread/02/04.mp3',
    'dialogues/main_thread/02/05.mp3',
    'dialogues/main_thread/02/06.mp3',
    'dialogues/main_thread/02/07.mp3',
    'dialogues/main_thread/02/08.mp3',
    'dialogues/main_thread/02/09.mp3',
    'dialogues/main_thread/02/10_a.mp3',
    'dialogues/main_thread/02/10_b.mp3',
    'dialogues/main_thread/02/10_c.mp3',
    'dialogues/main_thread/02/11_a.mp3',
    'dialogues/main_thread/02/11_b.mp3',
    'dialogues/main_thread/02/11_c.mp3',
    'dialogues/main_thread/02/12.mp3',
  ];

  MT02() : super(bgdImages, dlgFiles);

  @override
  void continueAction() {
    playDialog(Duration(seconds: 1));
  }
  
  @override
  void update(double t) {
  }

}