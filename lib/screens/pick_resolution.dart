import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:detective_game/game/scenes/config_resolution.dart';

class PickResolutionScreen extends StatefulWidget {
  final ConfigResolution scene;
  PickResolutionScreen({@required this.scene});

  @override
  _PickResolutionScreenState createState() => _PickResolutionScreenState();
}

class _PickResolutionScreenState extends State<PickResolutionScreen> {
  String _title = '';

  @override
  Widget build(BuildContext context) {
    if (_title.contains('0.75x')) {
      _title = '0.75x';
    } else if (_title.contains('1x')) {
      _title = '1x';
    } else if (_title.contains('1.5x')) {
      _title = '1.5x';
    } else if (_title.contains('2x')) {
      _title = '2x';
    } else if (_title.contains('3x')) {
      _title = '3x';
    } else if (_title.contains('4x')) {
      _title = '4x';
    } else {
      _title = '0.75x';
    }

    final info = _title == '3x' || _title == '4x'
        ? '\nThis resolution may cause stability problems. In case of errors, pick a lower one. '
        : '';

    final width = MediaQuery.of(context).size.height / 9 * 16;

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            // Game Layer
            Positioned.fill(child: widget.scene.widget),

            // UI Layer
            Positioned.fill(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    color: Colors.white.withOpacity(0.95),
                    height: 75,
                    width: width,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 5),
                              child: AutoSizeText(
                                'Current resolution: $_title$info',
                                minFontSize: 10,
                                overflow: TextOverflow.fade,
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 20),
                              )),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    width: width,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              elevation: 5,
                              color: Colors.white.withOpacity(0.95),
                              child: Text('Previous'),
                              onPressed: () {
                                widget.scene.previousBackgound();
                                setState(() {
                                  this._title = widget.scene.backgroundManager
                                      .currentBackgroundPath;
                                });
                              }),
                          RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            elevation: 5,
                            color: Colors.white.withOpacity(0.95),
                            child: Text('Accept'),
                            onPressed: () async {
                              await widget.scene.saveImageFactor();
                              Navigator.pop(context);
                            },
                          ),
                          RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              elevation: 5,
                              color: Colors.white.withOpacity(0.95),
                              child: Text('Next'),
                              onPressed: () {
                                widget.scene.backgroundManager.nextBackground();
                                setState(() {
                                  this._title = widget.scene.backgroundManager
                                      .currentBackgroundPath;
                                });
                              }),
                        ]),
                  ),
                ]))
          ],
        ),
      ),
    );
  }
}
