import 'dart:ui';
import 'package:detective_game/game/gameplay.dart';
import 'package:detective_game/game/scene/scene.dart';

// DT01 ==> Daniel Thread (Scene) 01
class KT09 extends Scene {

  // Asset Paths
  static List<String> bgdImages = <String>[
    'locations/kate_thread/09/01',
  ];
  
  static List<String> dlgFiles = <String>[
    'assets/audio/dialogues/kate_thread/09/transcript.txt',   // Txt file with transcript of each dialogue(1 line - 1 dialogue)
    'audio/dialogues/kate_thread/09/01.mp3',           // Other lines are audio files of each dialogue
    'audio/dialogues/kate_thread/09/02.mp3',
    'audio/dialogues/kate_thread/09/03.mp3',
    'audio/dialogues/kate_thread/09/04.mp3',
    'audio/dialogues/kate_thread/09/05.mp3',
    'audio/dialogues/kate_thread/09/06.mp3',
    'audio/dialogues/kate_thread/09/07.mp3',
    'audio/dialogues/kate_thread/09/08.mp3',
    'audio/dialogues/kate_thread/09/09.mp3',
    'audio/dialogues/kate_thread/09/10.mp3',
    'audio/dialogues/kate_thread/09/11.mp3',
  ];

  KT09(Gameplay gameplay) : super(bgdImages, dlgFiles, gameplay);
  
  @override
  void update(double t) {
    super.update(t);
  }
}