import 'dart:ui';
import 'package:detective_game/game/gameplay.dart';
import 'package:detective_game/game/scene/scene.dart';
import 'package:detective_game/services/local_save_manager.dart';

// MT01 ==> Main Thread (Scene) 02
class MT02 extends Scene {
  // Asset Paths
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
    LocalSaveManager().clearSavedChoicesForScene(this.runtimeType.toString());
  }
}
