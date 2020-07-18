import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('Showed');
    return Center(
      child: SpinKitCubeGrid(
        color: Colors.white,
        size: 50.0,
      ),
    );
  }
}
