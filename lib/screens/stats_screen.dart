import 'package:flutter/material.dart';

class StatsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HERE YOU GO TO THE END'),
      ),
      body: Container(
        child: Center(
          child: Text(
            'STATISTICS BRO',
            style: TextStyle(fontSize: 50),
          ),
        ),
      ),
    );
  }
}
