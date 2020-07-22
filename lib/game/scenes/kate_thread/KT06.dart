import 'dart:ui';
import 'package:detective_game/game/gameplay.dart';
import 'package:detective_game/game/scene/scene.dart';

class KT06 extends Scene {
  // KT06 ==> Kate Thread (Scene) 06
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
    'locations/kate_thread/04',
    'locations/kate_thread/07',
    'locations/kate_thread/08',
    'locations/kate_thread/09',
  ];

  static List<String> dlgFiles = <String>[
    'assets/audio/dialogues/kate_thread/06/transcript.txt', // Txt file with transcript of each dialogue(1 line - 1 dialogue)
    'audio/dialogues/kate_thread/06/01.mp3', // Other lines are audio files of each dialogue
    'audio/dialogues/kate_thread/06/02.mp3',
    'audio/dialogues/kate_thread/06/03.mp3',
    'audio/dialogues/kate_thread/06/04.mp3',
    'audio/dialogues/kate_thread/06/05.mp3',
    'audio/dialogues/kate_thread/06/06.mp3',
  ];

  static List<int> chgBackground = <int>[3, 4, 5];
  static String ambient = 'audio/effects/plane.mp3';

  KT06(Gameplay gameplay)
      : super(bgdImages, dlgFiles, chgBackground, gameplay, ambient);

  @override
  void nextScene() {
    // Come back to scene
    this.gameplay.data.playMainThreadScene(index: 11);
  }
}
