import 'dart:ui';
import 'package:detective_game/game/gameplay.dart';
import 'package:detective_game/game/scene/scene.dart';
import 'package:detective_game/services/local_save_manager.dart';

class MT10 extends Scene {
  // MT10 ==> Main Thread (Scene) 10
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
    'locations/main_thread/13',
    'locations/main_thread/14',
  ];

  static List<String> dlgFiles = <String>[
    'assets/audio/dialogues/main_thread/10/transcript.txt', // Txt file with transcript of each dialogue(1 line - 1 dialogue)
    'audio/dialogues/main_thread/10/01.mp3', // Other lines are audio files of each dialogue
    'audio/dialogues/main_thread/10/02_a.mp3',
    'audio/dialogues/main_thread/10/02_b.mp3',
    'audio/dialogues/main_thread/10/02_c.mp3',
    'audio/dialogues/main_thread/10/03.mp3',
    'audio/dialogues/main_thread/10/04.mp3',
    'audio/dialogues/main_thread/10/05.mp3',
    'audio/dialogues/main_thread/10/06.mp3',
    'audio/dialogues/main_thread/10/07.mp3',
    'audio/dialogues/main_thread/10/08.mp3',
    'audio/dialogues/main_thread/10/09.mp3',
    'audio/dialogues/main_thread/10/10.mp3',
    'audio/dialogues/main_thread/10/11.mp3',
    'audio/dialogues/main_thread/10/12_a.mp3',
    'audio/dialogues/main_thread/10/12_b.mp3',
    'audio/dialogues/main_thread/10/12_c.mp3',
    'audio/dialogues/main_thread/10/13.mp3',
  ];

  static List<int> chgBackground = <int>[7];
  static String ambient;

  MT10(Gameplay gameplay)
      : super(bgdImages, dlgFiles, chgBackground, gameplay, ambient);

  @override
  void onStart() {
    LocalSaveManager().clearSavedChoicesForScene(this.runtimeType);
  }
}
