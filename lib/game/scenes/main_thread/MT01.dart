import 'dart:ui';
import 'package:detective_game/game/gameplay.dart';
import 'package:detective_game/game/scene/scene.dart';

// MT01 ==> Main Thread (Scene) 01
class MT01 extends Scene {

  // Asset Paths
  static List<String> bgdImages = <String>[
    'locations/main_thread/01/01',
    'locations/main_thread/01/02',
  ];
  
  static List<String> dlgFiles = <String>[
    'assets/audio/dialogues/main_thread/01/transcript.txt',   // Txt file with transcript of each dialogue(1 line - 1 dialogue)
    'audio/dialogues/main_thread/01/01.mp3',           // Other lines are audio files of each dialogue
    'audio/dialogues/main_thread/01/02.mp3',
  ];

  MT01(Gameplay gameplay) : super(bgdImages, dlgFiles, gameplay);
  
  @override
  void update(double t) {
    super.update(t);
    changeBackgroundWhen(dialogueIndexIs: 2);
  }

}