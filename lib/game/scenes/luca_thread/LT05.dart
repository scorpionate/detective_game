import 'dart:ui';
import 'package:detective_game/game/gameplay.dart';
import 'package:detective_game/game/scene/scene.dart';

class LT05 extends Scene {
  // LT05 ==> Luca Thread (Scene) 05
  // bgdImages: contains background images paths SHOULDNT BE EMPTY
  //
  // dlgFiles: contains dialogues music files paths SHOULDNT BE EMPTY
  // List start from path to file with dialogues saved in txt. Basing on that file,
  // the UI is generated. Scene automatically plays dialogues starting from index 1
  // Transcript.txt should have the number of lines equals dlgFiles.length-1
  //
  // chgBackground: contains int's saying at which dialogue(it's index)
  // scene should change background to the following ones listed in bgdImages MAY BE EMPTY
  // ambient: contains path to ambient backgorund of scene If not null it will be played(in loop)
  // automatically when scene starts and automatically stopped when scene ends
  static List<String> bgdImages = <String>[
    'locations/luca_thread/04',
  ];

  static List<String> dlgFiles = <String>[
    'assets/audio/dialogues/luca_thread/05/transcript.txt', // Txt file with transcript of each dialogue(1 line - 1 dialogue)
    'audio/dialogues/luca_thread/05/01.mp3', // Other lines are audio files of each dialogue
    'audio/dialogues/luca_thread/05/02.mp3',
    'audio/dialogues/luca_thread/05/03.mp3',
    'audio/dialogues/luca_thread/05/04.mp3',
    'audio/dialogues/luca_thread/05/05.mp3',
    'audio/dialogues/luca_thread/05/06.mp3',
    'audio/dialogues/luca_thread/05/07.mp3',
  ];

  static List<int> chgBackground = <int>[];
  static String ambient;

  LT05(Gameplay gameplay)
      : super(bgdImages, dlgFiles, chgBackground, gameplay, ambient);

  @override
  void nextScene() {
    // Come back to scene
    this.gameplay.data.playMainThreadScene(index: 11);
  }
}
