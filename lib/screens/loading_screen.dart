import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatelessWidget {
  final Color color;
  LoadingScreen(this.color);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitCircle(
        color: this.color,
        size: 50.0,
      ),
    );
  }
}
