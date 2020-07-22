import 'dart:ui';
import 'package:detective_game/game/gameplay.dart';
import 'package:detective_game/game/scene/scene.dart';
import 'package:detective_game/services/local_save_manager.dart';

class ConfigResolution extends Scene {
//Scene prepared for displaying custom resolution and saving user preference
  static List<String> bgdImages = <String>[
    'configuration_set/0.75x.png',
    'configuration_set/1x.png',
    'configuration_set/1.5x.png',
    'configuration_set/2x.png',
    'configuration_set/3x.png',
    'configuration_set/4x.png',
  ];

  // Needed because ITS SCENE
  static List<String> dlgFiles = <String>[];
  static List<int> chgBackground = <int>[];
  static String ambient;

  ConfigResolution(Gameplay gameplay)
      : super(bgdImages, dlgFiles, chgBackground, gameplay, ambient);

  void previousBackgound() {
    // Change background
    super.backgroundManager.previousBackground();

    // Save constant to persistent
    saveImageFactor();
  }

  void nextBackground() {
    // Change background
    super.backgroundManager.nextBackground();

    // Save constant to persistent
    saveImageFactor();
  }

  Future<void> saveImageFactor() async {
    String bgd = this.backgroundManager.currentBackgroundPath;
    String factor;

    // Shrink file path
    if (bgd.contains('0.75x')) {
      factor = '@0.75x';
    } else if (bgd.contains('1x')) {
      factor = '@1x';
    } else if (bgd.contains('1.5x')) {
      factor = '@1.5x';
    } else if (bgd.contains('2x')) {
      factor = '@2x';
    } else if (bgd.contains('3x')) {
      factor = '@3x';
    } else if (bgd.contains('4x')) {
      factor = '@4x';
    }

    // Save to persistent
    LocalSaveManager().saveResolution(factor);
  }
}
