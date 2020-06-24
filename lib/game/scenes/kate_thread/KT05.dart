import 'dart:ui';
import 'package:detective_game/game/gameplay.dart';
import 'package:detective_game/game/scene/scene.dart';

// DT01 ==> Daniel Thread (Scene) 01
class KT05 extends Scene {

  // Asset Paths
  static List<String> bgdImages = <String>[
    'locations/kate_thread/05/01',
  ];
  
  static List<String> dlgFiles = <String>[
    'assets/audio/dialogues/kate_thread/05/transcript.txt',   // Txt file with transcript of each dialogue(1 line - 1 dialogue)
    'audio/dialogues/kate_thread/05/01.mp3',           // Other lines are audio files of each dialogue
  ];

  KT05(Gameplay gameplay) : super(bgdImages, dlgFiles, gameplay);
  
  @override
  void update(double t) {
    super.update(t);
  }
}