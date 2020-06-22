import 'dart:ui';
import 'package:detective_game/game/scene.dart';
import 'package:shared_preferences/shared_preferences.dart';

// MT01 ==> Main Thread (Scene) 00
class MT00 extends Scene {

  // Asset Paths
  static List<String> bgdImages = <String>[
    'configuration_set/0.75x.png',
    'configuration_set/1x.png',
    'configuration_set/1.5x.png',
    'configuration_set/2x.png',
    'configuration_set/3x.png',
    'configuration_set/4x.png',
  ];
  
  static List<String> dlgFiles = <String>[];

  MT00() : super(bgdImages, dlgFiles);
  
  @override
  void update(double t) {}

  @override void previousBackgound() {
    // Change background
    super.previousBackgound();
    
    // Save constant to persistent
    saveImageFactor();
  }
  
  @override void nextBackground() {
    // Change background
    super.nextBackground();

    // Save constant to persistent
    saveImageFactor();
  }


  void saveImageFactor() async {
    String bgd = this.currentBackgroundPath;
    String factor;
    
    if (bgd.contains('0.75x')) {
      factor = '@0.75x';
    }
    else if (bgd.contains('1x')) {
      factor = '@1x';
    }
    else if (bgd.contains('1.5x')) {
      factor = '@1.5x';
    }
    else if (bgd.contains('2x')) {
      factor = '@2x';
    }
    else if (bgd.contains('3x')) {
      factor = '@3x';
    }
    else if (bgd.contains('4x')) {
      factor = '@4x';
    }

    // Save to persistent
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('RESOLUTION', factor);
  }
}