import 'dart:ui';
import 'package:detective_game/game/gameplay.dart';
import 'package:detective_game/game/scene/scene.dart';

class MK07 extends Scene {
  // MK07 ==> Mike Thread (Scene) 07
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
    'audio/dialogues/mike_thread/07/11.mp3',
    'audio/dialogues/mike_thread/07/12.mp3',
    'audio/dialogues/mike_thread/07/13.mp3',
  ];

  static List<int> chgBackground = <int>[9];
  static String ambient;
  MK07(Gameplay gameplay)
      : super(bgdImages, dlgFiles, chgBackground, gameplay, ambient);

  @override
  void nextScene() {
    // Come back to scene
    this.gameplay.data.playMainThreadScene(index: 11);
  }
}
