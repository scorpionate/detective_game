import 'dart:ui';
import 'package:detective_game/game/gameplay.dart';
import 'package:detective_game/game/scene/scene.dart';
import 'package:detective_game/services/local_save_manager.dart';

// MT01 ==> Main Thread (Scene) 02
class MT05 extends Scene {
  // Asset Paths
  static List<String> bgdImages = <String>[
    'locations/main_thread/08',
  ];

  static List<String> dlgFiles = <String>[
    'assets/audio/dialogues/main_thread/05/transcript.txt', // Txt file with transcript of each dialogue(1 line - 1 dialogue)
    'audio/dialogues/main_thread/05/01.mp3', // Other lines are audio files of each dialogue
    'audio/dialogues/main_thread/05/02.mp3',
    'audio/dialogues/main_thread/05/03.mp3',
    'audio/dialogues/main_thread/05/04.mp3',
    'audio/dialogues/main_thread/05/05.mp3',
    'audio/dialogues/main_thread/05/06.mp3',
    'audio/dialogues/main_thread/05/07_a.mp3',
    'audio/dialogues/main_thread/05/07_b.mp3',
    'audio/dialogues/main_thread/05/07_c.mp3',
    'audio/dialogues/main_thread/05/08_a.mp3',
    'audio/dialogues/main_thread/05/08_b.mp3',
    'audio/dialogues/main_thread/05/08_c.mp3',
    'audio/dialogues/main_thread/05/09.mp3',
    'audio/dialogues/main_thread/05/10.mp3',
    'audio/dialogues/main_thread/05/11.mp3',
  ];

  static List<int> chgBackground = <int>[];
  static String ambient = 'audio/effects/electric_noise.mp3';

  MT05(Gameplay gameplay)
      : super(bgdImages, dlgFiles, chgBackground, gameplay, ambient);

  @override
  void onStart() {
    LocalSaveManager().clearSavedChoicesForScene(this.runtimeType.toString());
  }
}
