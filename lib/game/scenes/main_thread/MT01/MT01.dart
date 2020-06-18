import 'dart:ui';
import 'package:detective_game/game/scene.dart';

// MT01 ==> Main Thread (Scene) 01
class MT01 extends Scene {

  // Asset Paths
  static List<String> bgdImages = <String>[
    'locations/main_thread/01/01.png',
    'locations/main_thread/01/02.png',
  ];
  
  static List<String> dlgFiles = <String>[
    'dialogues/main_thread/01/transcript.txt',   // Txt file with transcript of each dialogue(1 line - 1 dialogue)
    'dialogues/main_thread/01/01.mp3',           // Other lines are audio files of each dialogue
    'dialogues/main_thread/01/02.mp3',
  ];

  MT01() : super(bgdImages, dlgFiles);

  @override
  void continueAction() {
    
  }
  
  @override
  void update(double t) {
  }

}