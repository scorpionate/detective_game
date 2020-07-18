import 'dart:ui';
import 'package:detective_game/game/gameplay.dart';
import 'package:detective_game/game/scene/scene.dart';
import 'package:flame/flame.dart';

// DT01 ==> Daniel Thread (Scene) 01
class LT01 extends Scene {
  // Asset Paths
  static List<String> bgdImages = <String>[
    'locations/luca_thread/02',
    'locations/luca_thread/06',
    'locations/luca_thread/03',
  ];

  static List<String> dlgFiles = <String>[
    'assets/audio/dialogues/luca_thread/01/transcript.txt', // Txt file with transcript of each dialogue(1 line - 1 dialogue)
    'audio/dialogues/luca_thread/01/01.mp3', // Other lines are audio files of each dialogue
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
  ];

  static List<int> chgBackground = <int>[4, 6];

  LT01(Gameplay gameplay) : super(bgdImages, dlgFiles, chgBackground, gameplay);

  @override
  void nextScene() {
    // Come back to scene
    this.gameplay.playMainThreadScene(index: 11);
  }
}
