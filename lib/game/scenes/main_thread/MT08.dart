import 'dart:ui';
import 'package:detective_game/game/gameplay.dart';
import 'package:detective_game/game/scene/scene.dart';

class MT08 extends Scene {
  // MT08 ==> Main Thread (Scene) 08
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
    'locations/main_thread/10',
    'locations/main_thread/11',
    'locations/main_thread/12',
  ];

  static List<String> dlgFiles = <String>[
    'assets/audio/dialogues/main_thread/08/transcript.txt', // Txt file with transcript of each dialogue(1 line - 1 dialogue)
    'audio/dialogues/main_thread/08/01.mp3', // Other lines are audio files of each dialogue
    'audio/dialogues/main_thread/08/02.mp3',
    'audio/dialogues/main_thread/08/03.mp3',
    'audio/dialogues/main_thread/08/04.mp3',
    'audio/dialogues/main_thread/08/05.mp3',
    'audio/dialogues/main_thread/08/06.mp3',
    'audio/dialogues/main_thread/08/07.mp3',
    'audio/dialogues/main_thread/08/08.mp3',
    'audio/dialogues/main_thread/08/09.mp3',
    'audio/dialogues/main_thread/08/10.mp3',
    'audio/dialogues/main_thread/08/11.mp3',
    'audio/dialogues/main_thread/08/12.mp3',
  ];

  static List<int> chgBackground = <int>[4, 12];
  static String ambient = 'audio/effects/pub.mp3';

  MT08(Gameplay gameplay)
      : super(bgdImages, dlgFiles, chgBackground, gameplay, ambient);
}
