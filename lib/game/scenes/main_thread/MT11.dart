import 'dart:ui';
import 'package:detective_game/game/gameplay.dart';
import 'package:detective_game/game/scene/scene.dart';

// MT01 ==> Main Thread (Scene) 02
class MT11 extends Scene {

  // Asset Paths
  static List<String> bgdImages = <String>[
    'locations/main_thread/11/01',
  ];
  
  static List<String> dlgFiles = <String>[
    'assets/audio/dialogues/main_thread/11/transcript.txt',   // Txt file with transcript of each dialogue(1 line - 1 dialogue)
    'audio/dialogues/main_thread/11/01.mp3',                  // Other lines are audio files of each dialogue
    'audio/dialogues/main_thread/11/02.mp3',
    'audio/dialogues/main_thread/11/03.mp3',
    'audio/dialogues/main_thread/11/04.mp3',
    'audio/dialogues/main_thread/11/05.mp3',
    'audio/dialogues/main_thread/11/06.mp3',
    'audio/dialogues/main_thread/11/07.mp3',
    'audio/dialogues/main_thread/11/08.mp3',
    'audio/dialogues/main_thread/11/09.mp3',
    'audio/dialogues/main_thread/11/10.mp3',
    'audio/dialogues/main_thread/11/11.mp3',
    'audio/dialogues/main_thread/11/12.mp3',
    'audio/dialogues/main_thread/11/13.mp3',
    'audio/dialogues/main_thread/11/14.mp3',
    'audio/dialogues/main_thread/11/15.mp3',
    'audio/dialogues/main_thread/11/16.mp3',
  ];
  
  MT11(Gameplay gameplay) : super(bgdImages, dlgFiles, gameplay);
  
  @override
  void update(double t) {
    super.update(t);
  }

}