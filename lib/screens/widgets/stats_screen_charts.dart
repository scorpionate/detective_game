import 'package:auto_size_text/auto_size_text.dart';
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
    final width = MediaQuery.of(context).size.width / 2;
    final progressHeight = 50.0;

    return Row(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(10),
          width: width,
          child: ListView(children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                AutoSizeText(
                  '''Your choices helped us discover Wyatt's character. '''
                  '''If you made this far, thank you for playing the game!'''
                  '''\n''',
                  minFontSize: 7,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                ),
                AutoSizeText(
                  '''The game is distributed with MIT license. The source is available: https://github.com/maksmaxx/detective_game'''
                  '''\n\n'''
                  '''During the development the following assets were used:'''
                  '''\n\n'''
                  '''Dances and Dames by Kevin MacLeod https://incompetech.com/'''
                  '''\n'''
                  '''Promoted by MrSnooze https://youtu.be/iYOvAO1rAM0'''
                  '''\n'''
                  '''License: CC BY 3.0 https://goo.gl/Yibru5'''
                  '''\n\n'''
                  '''Ambient sounds:'''
                  '''\n'''
                  '''http://pbblogassets.s3.amazonaws.com/uploads/2016/09/15-Free-Ambient-Sound-Effects.zip'''
                  '''\n\n'''
                  '''Font:'''
                  '''\n'''
                  '''https://fonts.google.com/specimen/Quicksand''',
                  minFontSize: 7,
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
          ]),
        ),

        // s
        Container(
          width: width,
          alignment: Alignment.center,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              Column(children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 5, 5, 2.5),
                  child: RoundedProgressBar(
                    height: progressHeight,
                    childLeft: Text('Confidence'),
                    childRight: Text(_confidence.value.floor().toString()),
                    theme: RoundedProgressBarTheme.red,
                    percent: _confidence.value,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 2.5, 5, 2.5),
                  child: RoundedProgressBar(
                    height: progressHeight,
                    childLeft: Text('Awkwardness'),
                    childRight: Text(_awkwardness.value.floor().toString()),
                    theme: RoundedProgressBarTheme.yellow,
                    percent: _awkwardness.value,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 2.5, 5, 2.5),
                  child: RoundedProgressBar(
                    height: progressHeight,
                    childLeft: Text('Impolitness'),
                    childRight: Text(_impolitness.value.floor().toString()),
                    theme: RoundedProgressBarTheme.blue,
                    percent: _impolitness.value,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 2.5, 5, 2.5),
                  child: RoundedProgressBar(
                    height: progressHeight,
                    childLeft: Text('Neutralness'),
                    childRight: Text(_neutralness.value.floor().toString()),
                    theme: RoundedProgressBarTheme.green,
                    percent: _neutralness.value,
                  ),
                ),
              ]),
            ],
          ),
        ),
      ],
    );
  }
}
