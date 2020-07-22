import 'dart:ui';
import 'package:detective_game/game/gameplay.dart';
import 'package:detective_game/game/scene/scene.dart';
import 'package:detective_game/services/local_save_manager.dart';

class MT02 extends Scene {
  // MT01 ==> Main Thread (Scene) 01
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
    'locations/main_thread/03',
    'locations/main_thread/04',
  ];

  static List<String> dlgFiles = <String>[
    'assets/audio/dialogues/main_thread/02/transcript.txt', // Txt file with transcript of each dialogue(1 line - 1 dialogue)
    'audio/dialogues/main_thread/02/01.mp3', // Other lines are audio files of each dialogue
    'audio/dialogues/main_thread/02/02_a.mp3',
    'audio/dialogues/main_thread/02/02_b.mp3',
    'audio/dialogues/main_thread/02/02_c.mp3',
    'audio/dialogues/main_thread/02/03_a.mp3',
    'audio/dialogues/main_thread/02/03_b.mp3',
    'audio/dialogues/main_thread/02/03_c.mp3',
    'audio/dialogues/main_thread/02/04.mp3',
    'audio/dialogues/main_thread/02/05.mp3',
    'audio/dialogues/main_thread/02/06.mp3',
    'audio/dialogues/main_thread/02/07.mp3',
    'audio/dialogues/main_thread/02/08.mp3',
    'audio/dialogues/main_thread/02/09.mp3',
    'audio/dialogues/main_thread/02/10.mp3',
    'audio/dialogues/main_thread/02/11_a.mp3',
    'audio/dialogues/main_thread/02/11_b.mp3',
    'audio/dialogues/main_thread/02/11_c.mp3',
    'audio/dialogues/main_thread/02/12_a.mp3',
    'audio/dialogues/main_thread/02/12_b.mp3',
    'audio/dialogues/main_thread/02/12_c.mp3',
    'audio/dialogues/main_thread/02/13.mp3',
  ];

  static List<int> chgBackground = <int>[21];
  static String ambient = 'audio/effects/busy_place.mp3';

  MT02(Gameplay gameplay)
      : super(bgdImages, dlgFiles, chgBackground, gameplay, ambient);

  @override
  void onStart() {
    // before optional scene make sure the previous progress is erased
    LocalSaveManager().clearSavedChoicesForScene(this.runtimeType);
  }
}
