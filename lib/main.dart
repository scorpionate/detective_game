import 'package:detective_game/game/scenes/main_thread/MT02/MT02.dart';
import 'package:detective_game/screens/home_screen.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:detective_game/game/displayer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Hide Status Bar and bottom buttons
  await SystemChrome.setEnabledSystemUIOverlays([]);
  
  await SystemChrome.setPreferredOrientations([
    // DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight
  ]);
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Multithreaded detective game.',
      //showPerformanceOverlay: true,
      theme: ThemeData(
        fontFamily: 'Quicksand',
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Displayer(scene: MT02()),
      //home: HomeScreen(),
    );
  }
}