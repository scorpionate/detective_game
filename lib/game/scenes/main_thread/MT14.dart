import 'dart:ui';
import 'package:detective_game/game/gameplay.dart';
import 'package:detective_game/game/scene/scene.dart';
import 'package:detective_game/services/local_save_manager.dart';

// MT13 ==> Main Thread (Scene) 13
class MT14 extends Scene {
  // MT13 ==> Main Thread (Scene) 13
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
    'locations/main_thread/01',
    'locations/main_thread/23',
  ];

  static List<String> dlgFiles = <String>[
    'assets/audio/dialogues/main_thread/14/transcript.txt', // Txt file with transcript of each dialogue(1 line - 1 dialogue)
    'audio/dialogues/main_thread/14/01.mp3', // Other lines are audio files of each dialogue
    'audio/dialogues/main_thread/14/02.mp3',
    'audio/dialogues/main_thread/14/03.mp3',
    'audio/dialogues/main_thread/14/04.mp3',
    'audio/dialogues/main_thread/14/05_a.mp3',
    'audio/dialogues/main_thread/14/05_b.mp3',
    'audio/dialogues/main_thread/14/05_c.mp3',
    'audio/dialogues/main_thread/14/05_d.mp3',
    'audio/dialogues/main_thread/14/05_e.mp3',
    'audio/dialogues/main_thread/14/06_a.mp3',
    'audio/dialogues/main_thread/14/06_b.mp3',
    'audio/dialogues/main_thread/14/06_c.mp3',
    'audio/dialogues/main_thread/14/06_d.mp3',
    'audio/dialogues/main_thread/14/06_e.mp3',
    'audio/dialogues/main_thread/14/07.mp3',
    'audio/dialogues/main_thread/14/08.mp3',
    'audio/dialogues/main_thread/14/09.mp3',
    'audio/dialogues/main_thread/14/10_a.mp3',
    'audio/dialogues/main_thread/14/10_b.mp3',
    'audio/dialogues/main_thread/14/10_c.mp3',
    'audio/dialogues/main_thread/14/11_a.mp3',
    'audio/dialogues/main_thread/14/11_b.mp3',
    'audio/dialogues/main_thread/14/11_c.mp3',
    'audio/dialogues/main_thread/14/12.mp3',
    'audio/dialogues/main_thread/14/13.mp3',
  ];

  static List<int> chgBackground = <int>[2];
  static String ambient = 'audio/effects/whispering.mp3';

  MT14(Gameplay gameplay)
      : super(bgdImages, dlgFiles, chgBackground, gameplay, ambient);

  @override
  void onStart() {
    LocalSaveManager().clearSavedChoicesForScene(this.runtimeType);
  }
}
