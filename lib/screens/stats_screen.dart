import 'dart:async';
import 'package:flutter/material.dart';
import 'package:detective_game/model/game_state.dart';
import 'package:detective_game/screens/loading_screen.dart';
import 'package:detective_game/services/local_save_manager.dart';
import 'package:detective_game/screens/widgets/stats_screen_charts.dart';

class StatsScreen extends StatelessWidget {
// Shows statistics after last scene of gameplay
// Shows credits of some free assets used while developmnent
  final _controller = StreamController<Map<String, int>>.broadcast();

  @override
  Widget build(BuildContext context) {
    _calculateStats();

    return WillPopScope(
        onWillPop: () async {
          // TODO: Uncomment
          // await LocalSaveManager().clearAllSavedChoices();
          // await LocalSaveManager().saveGameState(GameState(0));
          return true;
        },
        child: Scaffold(
            appBar: AppBar(
                title: Text('Your statistics'),
                backgroundColor: Colors.black54,
                centerTitle: true),
            body: StreamBuilder<Object>(
                stream: _controller.stream,
                builder: (context, snapshot) {
                  if (snapshot.hasData)
                    return StatsScreenCharts(snapshot.data);
                  else
                    return LoadingScreen(Colors.black);
                })));
  }

  Future<void> _calculateStats() async {
    final map = await loadData();
    this._controller.add(map);
  }

  Future<Map<String, int>> loadData() async {
    // Load saved choices
    // Should contain saves from every scene with optionals
    final choices = await LocalSaveManager().loadOptionalChoices();

    // Process data
    // Index of optionals are declared in transcripts
    // Each optional choice has assigned value in points
    int confidence = 0, awkwardness = 0, impolitness = 0, neutral = 0;
    choices.data.forEach((element) {
      if (element.scene == 'MT02') {
        if (element.index == 2) {
          // 2: c+3, a+1, i+0, n+0
          confidence += 3;
          awkwardness += 1;
        } else if (element.index == 3) {
          // 3: c+1, a+3, i+0, n+2
          confidence += 1;
          awkwardness += 3;
          neutral += 2;
        } else if (element.index == 4) {
          // 4: c+1, a+2, i+0, n+2
          confidence += 1;
          awkwardness += 2;
          neutral += 2;
        } else if (element.index == 15) {
          // 15: c+3, a+1, i+1, n+0
          confidence += 3;
          awkwardness += 1;
          impolitness += 1;
        } else if (element.index == 16) {
          //16: c+2, a+1, i+0, n+1
          confidence += 2;
          awkwardness += 1;
          neutral += 1;
        } else if (element.index == 17) {
          //17: c+1. a+2, i+0, n+1
          confidence += 1;
          awkwardness += 2;
          neutral += 1;
        }
      } else if (element.scene == 'MT04') {
        if (element.index == 4) {
          // 4: c+3, a+1, i+3, n+0
          confidence += 3;
          awkwardness += 1;
          impolitness += 3;
        } else if (element.index == 5) {
          // 5: c+1, a+1, i+1, n+3
          confidence += 1;
          awkwardness += 1;
          impolitness += 1;
          neutral += 3;
        } else if (element.index == 6) {
          // 6: c+1, a+3, i+2, n+2
          confidence += 1;
          awkwardness += 3;
          impolitness += 2;
          neutral += 2;
        } else if (element.index == 15) {
          // 15: c+3, a+1, i+1, n+0
          confidence += 3;
          awkwardness += 1;
          impolitness += 1;
        } else if (element.index == 16) {
          // 16: c+1, a+2, i+0, n+2
          confidence += 1;
          awkwardness += 2;
          neutral += 2;
        } else if (element.index == 17) {
          // 17: c+2, a+2, i+1, n+0
          confidence += 2;
          awkwardness += 2;
          impolitness += 1;
        }
      } else if (element.scene == 'MT05') {
        if (element.index == 7) {
          // 7: c+3, a+1, i+3, n+0
          confidence += 3;
          awkwardness += 1;
          impolitness += 3;
        } else if (element.index == 8) {
          // 8: c+1, a+3, i+1, n+2
          confidence += 1;
          awkwardness += 3;
          impolitness += 1;
          neutral += 2;
        } else if (element.index == 9) {
          // 9: c+1, a+3, i+0, n+3
          confidence += 1;
          awkwardness += 3;
          neutral += 3;
        }
      } else if (element.scene == 'MT07') {
        if (element.index == 7) {
          //7: c+3, a+1, i+1, n+1
          confidence += 3;
          awkwardness += 1;
          impolitness += 1;
          neutral += 1;
        } else if (element.index == 8) {
          //8: c+2, a+1, i+1, n+2
          confidence += 2;
          awkwardness += 1;
          impolitness += 1;
          neutral += 2;
        } else if (element.index == 9) {
          // 9: c+1, a+2, i+2, n+1
          confidence += 1;
          awkwardness += 2;
          impolitness += 2;
          neutral += 1;
        }
      } else if (element.scene == 'MT10') {
        if (element.index == 2) {
          // 2: c+1, a+1, i+2, n+0
          confidence += 1;
          awkwardness += 1;
          impolitness += 2;
        } else if (element.index == 3) {
          // 3: c+2, a+1, i+0, n+3
          confidence += 2;
          awkwardness += 1;
          neutral += 3;
        } else if (element.index == 4) {
          //4: c+1, a+3, i+3, n+0
          confidence += 1;
          awkwardness += 3;
          impolitness += 3;
        } else if (element.index == 14) {
          // 14: c+3, a+1, i+1, n+0
          confidence += 3;
          awkwardness += 1;
          impolitness += 1;
        } else if (element.index == 15) {
          // 15: c+2, a+2, i+0, n+2
          confidence += 2;
          awkwardness += 2;
          neutral += 2;
        } else if (element.index == 16) {
          // 16: c+1, a+3, i+0, n+1
          confidence += 1;
          awkwardness += 3;
          neutral += 1;
        }
      }
    });

    // Transfer to percents
    // Max confidence = 23
    // Max awkwardness = 21
    // Max impolitness = 14
    // Max neutralness = 18
    final confInPrc = ((confidence.toDouble() / 23.0) * 100.0).floor();
    final awkwInPrc = ((awkwardness.toDouble() / 21.0) * 100.0).floor();
    final impoInPrc = ((impolitness.toDouble() / 14.0) * 100.0).floor();
    final neutInPrc = ((neutral.toDouble() / 18.0) * 100.0).floor();

    Map<String, int> map = {
      'Confidence': confInPrc,
      'Awkwardness': awkwInPrc,
      'Impolitness': impoInPrc,
      'Neutralness': neutInPrc
    };

    return Future.value(map);
  }
}
