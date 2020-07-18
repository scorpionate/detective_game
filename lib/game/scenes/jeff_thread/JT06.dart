import 'dart:ui';
import 'package:detective_game/game/gameplay.dart';
import 'package:detective_game/game/scene/scene.dart';
import 'package:flame/flame.dart';

// DT01 ==> Daniel Thread (Scene) 01
class JT06 extends Scene {
  // Asset Paths
  static List<String> bgdImages = <String>[
    'locations/jeff_thread/01',
  ];

  static List<String> dlgFiles = <String>[
    'assets/audio/dialogues/jeff_thread/06/transcript.txt', // Txt file with transcript of each dialogue(1 line - 1 dialogue)
    'audio/dialogues/jeff_thread/06/01.mp3', // Other lines are audio files of each dialogue
    'audio/dialogues/jeff_thread/06/02.mp3',
    'audio/dialogues/jeff_thread/06/03.mp3',
    'audio/dialogues/jeff_thread/06/04.mp3',
    'audio/dialogues/jeff_thread/06/05.mp3',
    'audio/dialogues/jeff_thread/06/06.mp3',
    'audio/dialogues/jeff_thread/06/07.mp3',
  ];

  static List<int> chgBackground = <int>[];

  JT06(Gameplay gameplay) : super(bgdImages, dlgFiles, chgBackground, gameplay);

  @override
  void nextScene() {
    // Come back to scene
    this.gameplay.playMainThreadScene(index: 11);
  }
}
