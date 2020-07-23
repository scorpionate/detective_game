import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:wyatts_story/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Hide Status Bar and bottom buttons
  await SystemChrome.setEnabledSystemUIOverlays([]);

  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.landscapeRight]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Multithreaded detective game.',
      theme: ThemeData(
          fontFamily: 'Quicksand',
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.white.withOpacity(0.95),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          )),
      home: HomeScreen(),
    );
  }
}
