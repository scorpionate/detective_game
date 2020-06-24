import 'dart:ui';
import 'package:detective_game/game/gameplay.dart';
import 'package:detective_game/game/scene/scene.dart';

// DT01 ==> Daniel Thread (Scene) 01
class DT04 extends Scene {

  // Asset Paths
  static List<String> bgdImages = <String>[
    'locations/daniel_thread/04/01',
  ];
  
  static List<String> dlgFiles = <String>[
    'assets/audio/dialogues/daniel_thread/04/transcript.txt',   // Txt file with transcript of each dialogue(1 line - 1 dialogue)
    'audio/dialogues/daniel_thread/04/01.mp3',           // Other lines are audio files of each dialogue
    'audio/dialogues/daniel_thread/04/02.mp3',
    'audio/dialogues/daniel_thread/04/03.mp3',
    'audio/dialogues/daniel_thread/04/04.mp3',
    'audio/dialogues/daniel_thread/04/05.mp3',
    'audio/dialogues/daniel_thread/04/06.mp3',
    'audio/dialogues/daniel_thread/04/07.mp3',
    'audio/dialogues/daniel_thread/04/08.mp3',
    'audio/dialogues/daniel_thread/04/09.mp3',
    'audio/dialogues/daniel_thread/04/10.mp3',
    'audio/dialogues/daniel_thread/04/11.mp3',
    'audio/dialogues/daniel_thread/04/12.mp3',
    'audio/dialogues/daniel_thread/04/13.mp3',
    'audio/dialogues/daniel_thread/04/14.mp3',
    ];

  DT04(Gameplay gameplay) : super(bgdImages, dlgFiles, gameplay);
  
  @override
  void update(double t) {
    super.update(t);
  }
}