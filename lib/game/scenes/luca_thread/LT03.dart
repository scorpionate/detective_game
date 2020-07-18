import 'dart:ui';
import 'package:detective_game/game/gameplay.dart';
import 'package:detective_game/game/scene/scene.dart';
import 'package:flame/flame.dart';

// DT01 ==> Daniel Thread (Scene) 01
class LT03 extends Scene {
  // Asset Paths
  static List<String> bgdImages = <String>[
    'locations/luca_thread/04',
    'locations/luca_thread/01',
    'locations/luca_thread/04',
  ];

  static List<String> dlgFiles = <String>[
    'assets/audio/dialogues/luca_thread/03/transcript.txt', // Txt file with transcript of each dialogue(1 line - 1 dialogue)
    'audio/dialogues/luca_thread/03/01.mp3', // Other lines are audio files of each dialogue
    'audio/dialogues/luca_thread/03/02.mp3',
    'audio/dialogues/luca_thread/03/03.mp3',
    'audio/dialogues/luca_thread/03/04.mp3',
    'audio/dialogues/luca_thread/03/05.mp3',
    'audio/dialogues/luca_thread/03/06.mp3',
    'audio/dialogues/luca_thread/03/07.mp3',
    'audio/dialogues/luca_thread/03/08.mp3',
    'audio/dialogues/luca_thread/03/09.mp3',
    'audio/dialogues/luca_thread/03/10.mp3',
    'audio/dialogues/luca_thread/03/11.mp3',
    'audio/dialogues/luca_thread/03/12.mp3',
    'audio/dialogues/luca_thread/03/13.mp3',
    'audio/dialogues/luca_thread/03/14.mp3',
    'audio/dialogues/luca_thread/03/15.mp3',
    'audio/dialogues/luca_thread/03/16.mp3',
  ];

  static List<int> chgBackground = <int>[3, 6];

  LT03(Gameplay gameplay) : super(bgdImages, dlgFiles, chgBackground, gameplay);

  @override
  void nextScene() {
    // Come back to scene
    this.gameplay.playMainThreadScene(index: 11);
  }
}
