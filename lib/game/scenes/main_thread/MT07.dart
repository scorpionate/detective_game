import 'dart:ui';
import 'package:detective_game/game/gameplay.dart';
import 'package:detective_game/game/scene/scene.dart';
import 'package:detective_game/services/local_save_manager.dart';

class MT07 extends Scene {
  // MT07 ==> Main Thread (Scene) 07
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
    'locations/main_thread/09',
  ];

  static List<String> dlgFiles = <String>[
    'assets/audio/dialogues/main_thread/07/transcript.txt', // Txt file with transcript of each dialogue(1 line - 1 dialogue)
    'audio/dialogues/main_thread/07/01.mp3', // Other lines are audio files of each dialogue
    'audio/dialogues/main_thread/07/02.mp3',
    'audio/dialogues/main_thread/07/03.mp3',
    'audio/dialogues/main_thread/07/04.mp3',
    'audio/dialogues/main_thread/07/05.mp3',
    'audio/dialogues/main_thread/07/06.mp3',
    'audio/dialogues/main_thread/07/07_a.mp3',
    'audio/dialogues/main_thread/07/07_b.mp3',
    'audio/dialogues/main_thread/07/07_c.mp3',
    'audio/dialogues/main_thread/07/08_a.mp3',
    'audio/dialogues/main_thread/07/08_b.mp3',
    'audio/dialogues/main_thread/07/08_c.mp3',
    'audio/dialogues/main_thread/07/09.mp3',
    'audio/dialogues/main_thread/07/10.mp3',
    'audio/dialogues/main_thread/07/11.mp3',
    'audio/dialogues/main_thread/07/12.mp3',
    'audio/dialogues/main_thread/07/13.mp3',
    'audio/dialogues/main_thread/07/14.mp3',
  ];

  static List<int> chgBackground = <int>[];
  static String ambient;

  MT07(Gameplay gameplay)
      : super(bgdImages, dlgFiles, chgBackground, gameplay, ambient);

  @override
  void onStart() {
    LocalSaveManager().clearSavedChoicesForScene(this.runtimeType);
  }
}
