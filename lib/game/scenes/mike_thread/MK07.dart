import 'dart:ui';
import 'package:detective_game/game/gameplay.dart';
import 'package:detective_game/game/scene/scene.dart';
import 'package:flame/flame.dart';

// DT01 ==> Daniel Thread (Scene) 01
class MK07 extends Scene {
  // Asset Paths
  static List<String> bgdImages = <String>[
    'locations/mike_thread/06',
    'locations/mike_thread/01',
  ];

  static List<String> dlgFiles = <String>[
    'assets/audio/dialogues/mike_thread/07/transcript.txt', // Txt file with transcript of each dialogue(1 line - 1 dialogue)
    'audio/dialogues/mike_thread/07/01.mp3', // Other lines are audio files of each dialogue
    'audio/dialogues/mike_thread/07/02.mp3',
    'audio/dialogues/mike_thread/07/03.mp3',
    'audio/dialogues/mike_thread/07/04.mp3',
    'audio/dialogues/mike_thread/07/05.mp3',
    'audio/dialogues/mike_thread/07/06.mp3',
    'audio/dialogues/mike_thread/07/07.mp3',
    'audio/dialogues/mike_thread/07/08.mp3',
    'audio/dialogues/mike_thread/07/09.mp3',
    'audio/dialogues/mike_thread/07/10.mp3',
  ];

  static List<int> chgBackground = <int>[8];

  MK07(Gameplay gameplay) : super(bgdImages, dlgFiles, chgBackground, gameplay);

  @override
  void nextScene() {
    // Come back to scene
    this.gameplay.playMainThreadScene(index: 11);
  }
}
