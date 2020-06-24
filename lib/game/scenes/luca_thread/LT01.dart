import 'dart:ui';
import 'package:detective_game/game/gameplay.dart';
import 'package:detective_game/game/scene/scene.dart';

// DT01 ==> Daniel Thread (Scene) 01
class LT01 extends Scene {

  // Asset Paths
  static List<String> bgdImages = <String>[
    'locations/luca_thread/01/01',
    'locations/luca_thread/01/02',
    'locations/luca_thread/01/03',
    'locations/luca_thread/01/04',
    'locations/luca_thread/01/05',
    'locations/luca_thread/01/06',
  ];
  
  static List<String> dlgFiles = <String>[
    'assets/audio/dialogues/luca_thread/01/transcript.txt',   // Txt file with transcript of each dialogue(1 line - 1 dialogue)
    'audio/dialogues/luca_thread/01/01.mp3',        // Other lines are audio files of each dialogue
    'audio/dialogues/luca_thread/01/02.mp3',
    'audio/dialogues/luca_thread/01/03.mp3',           
    'audio/dialogues/luca_thread/01/04.mp3',           
    'audio/dialogues/luca_thread/01/05.mp3',           
    'audio/dialogues/luca_thread/01/06.mp3',           
    'audio/dialogues/luca_thread/01/07.mp3',           
    'audio/dialogues/luca_thread/01/08.mp3',           
    'audio/dialogues/luca_thread/01/09.mp3',           
    'audio/dialogues/luca_thread/01/10.mp3',           
    'audio/dialogues/luca_thread/01/11.mp3',           
    'audio/dialogues/luca_thread/01/12.mp3',           
    'audio/dialogues/luca_thread/01/13.mp3',           
    'audio/dialogues/luca_thread/01/14.mp3',           
    'audio/dialogues/luca_thread/01/15.mp3',           
    'audio/dialogues/luca_thread/01/16.mp3',           
    'audio/dialogues/luca_thread/01/17.mp3',           
    'audio/dialogues/luca_thread/01/18.mp3',           
    'audio/dialogues/luca_thread/01/19.mp3',           
    'audio/dialogues/luca_thread/01/20.mp3',           
    'audio/dialogues/luca_thread/01/21.mp3',
    'audio/dialogues/luca_thread/01/22.mp3',           
    'audio/dialogues/luca_thread/01/23.mp3',           
    'audio/dialogues/luca_thread/01/24.mp3',           
    'audio/dialogues/luca_thread/01/25.mp3',           
    'audio/dialogues/luca_thread/01/26.mp3',           
    'audio/dialogues/luca_thread/01/27.mp3',           
    'audio/dialogues/luca_thread/01/28.mp3',           
    'audio/dialogues/luca_thread/01/29.mp3',           
    'audio/dialogues/luca_thread/01/30.mp3',           
    'audio/dialogues/luca_thread/01/31.mp3',           
    'audio/dialogues/luca_thread/01/32.mp3',           
    'audio/dialogues/luca_thread/01/33.mp3',           
    'audio/dialogues/luca_thread/01/34.mp3',           
    'audio/dialogues/luca_thread/01/35.mp3',           
    'audio/dialogues/luca_thread/01/36.mp3',           
    'audio/dialogues/luca_thread/01/37.mp3',           
    'audio/dialogues/luca_thread/01/38.mp3',           
    'audio/dialogues/luca_thread/01/39.mp3',           
    'audio/dialogues/luca_thread/01/40.mp3',           
    'audio/dialogues/luca_thread/01/41.mp3',           
    'audio/dialogues/luca_thread/01/42.mp3',           
    'audio/dialogues/luca_thread/01/43.mp3',           
    'audio/dialogues/luca_thread/01/44.mp3',           
    'audio/dialogues/luca_thread/01/45.mp3',           
    'audio/dialogues/luca_thread/01/46.mp3',           
    'audio/dialogues/luca_thread/01/47.mp3',           
    'audio/dialogues/luca_thread/01/48.mp3',           
    'audio/dialogues/luca_thread/01/49.mp3',           
    'audio/dialogues/luca_thread/01/50.mp3',   
    'audio/dialogues/luca_thread/01/51.mp3',           
    'audio/dialogues/luca_thread/01/52.mp3',           
    'audio/dialogues/luca_thread/01/53.mp3',           
    'audio/dialogues/luca_thread/01/54.mp3',           
    'audio/dialogues/luca_thread/01/55.mp3',           
    'audio/dialogues/luca_thread/01/56.mp3',           
    'audio/dialogues/luca_thread/01/57.mp3',           

  ];

  LT01(Gameplay gameplay) : super(bgdImages, dlgFiles, gameplay);
  
  @override
  void update(double t) {
    super.update(t);
  }
}