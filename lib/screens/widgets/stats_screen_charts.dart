import 'package:detective_game/services/local_save_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_progress_bar/flutter_rounded_progress_bar.dart';
import 'package:flutter_rounded_progress_bar/rounded_progress_bar_style.dart';

class StatsScreenCharts extends StatefulWidget {
  final Map<String, int> map;
  StatsScreenCharts(this.map);

  @override
  _StatsScreenChartsState createState() => _StatsScreenChartsState();
}

class _StatsScreenChartsState extends State<StatsScreenCharts>
    with SingleTickerProviderStateMixin {
  AnimationController _animController;
  Animation<double> _confidence;
  Animation<double> _awkwardness;
  Animation<double> _impolitness;
  Animation<double> _neutralness;

  double _confPrc;
  double _awkwPrc;
  double _impoPrc;
  double _neutPrc;

  final _animationDuration = Duration(milliseconds: 500);

  @override
  initState() {
    super.initState();

    _confPrc = widget.map['Confidence'].toDouble();
    _awkwPrc = widget.map['Awkwardness'].toDouble();
    _impoPrc = widget.map['Impolitness'].toDouble();
    _neutPrc = widget.map['Neutralness'].toDouble();

    // Animation configuration
    _animController =
        AnimationController(duration: this._animationDuration, vsync: this)
          ..addListener(() => setState(() {}));

    _confidence =
        Tween<double>(begin: 0.0, end: _confPrc).animate(_animController);
    _awkwardness =
        Tween<double>(begin: 0.0, end: _awkwPrc).animate(_animController);
    _impolitness =
        Tween<double>(begin: 0.0, end: _impoPrc).animate(_animController);
    _neutralness =
        Tween<double>(begin: 0.0, end: _neutPrc).animate(_animController);

    Future.delayed(Duration(milliseconds: 500))
        .then((value) => _animController.forward());
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: <Widget>[
        Column(children: <Widget>[
          RoundedProgressBar(
            childLeft: Text('Confidence'),
            childRight: Text(_confidence.value.floor().toString()),
            style: RoundedProgressBarStyle(colorProgress: Colors.red),
            percent: _confidence.value,
          ),
          RoundedProgressBar(
            childLeft: Text('Awkwardness'),
            childRight: Text(_awkwardness.value.floor().toString()),
            style: RoundedProgressBarStyle(colorProgress: Colors.yellow),
            percent: _awkwardness.value,
          ),
          RoundedProgressBar(
            childLeft: Text('Impolitness'),
            childRight: Text(_impolitness.value.floor().toString()),
            style: RoundedProgressBarStyle(colorProgress: Colors.orange),
            percent: _impolitness.value,
          ),
          RoundedProgressBar(
            childLeft: Text('Neutralness'),
            childRight: Text(_neutralness.value.floor().toString()),
            style: RoundedProgressBarStyle(colorProgress: Colors.green),
            percent: _neutralness.value,
          ),
          Text('XD'),
          Text('XD'),
          Text('XD'),
          Text('XD'),
          Text('XD'),
          Text('XD'),
        ]),
      ],
    );
  }
}
