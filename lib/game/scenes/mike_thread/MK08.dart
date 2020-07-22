import 'dart:ui';
import 'package:detective_game/game/gameplay.dart';
import 'package:detective_game/game/scene/scene.dart';

// DT01 ==> Daniel Thread (Scene) 01
class MK08 extends Scene {
  // Asset Paths
  static List<String> bgdImages = <String>[
    'locations/mike_thread/01',
  ];

  static List<String> dlgFiles = <String>[
    'assets/audio/dialogues/mike_thread/08/transcript.txt', // Txt file with transcript of each dialogue(1 line - 1 dialogue)
    'audio/dialogues/mike_thread/08/01.mp3', // Other lines are audio files of each dialogue
    'audio/dialogues/mike_thread/08/02.mp3',
    'audio/dialogues/mike_thread/08/03.mp3',
    'audio/dialogues/mike_thread/08/04.mp3',
    'audio/dialogues/mike_thread/08/05.mp3',
    'audio/dialogues/mike_thread/08/06.mp3',
    'audio/dialogues/mike_thread/08/07.mp3',
    'audio/dialogues/mike_thread/08/08.mp3',
    'audio/dialogues/mike_thread/08/09.mp3',
    'audio/dialogues/mike_thread/08/10.mp3',
    'audio/dialogues/mike_thread/08/11.mp3',
    'audio/dialogues/mike_thread/08/12.mp3',
    'audio/dialogues/mike_thread/08/13.mp3',
    'audio/dialogues/mike_thread/08/14.mp3',
    'audio/dialogues/mike_thread/08/15.mp3',
  ];

  static List<int> chgBackground = <int>[];
  static String ambient;

  MK08(Gameplay gameplay)
      : super(bgdImages, dlgFiles, chgBackground, gameplay, ambient);

  @override
  void nextScene() {
    // Come back to scene
    this.gameplay.playMainThreadScene(index: 11);
  }
}
