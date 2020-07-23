import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:wyatts_story/game/scenes/config_resolution.dart';

class PickResolutionScreen extends StatefulWidget {
// Allows user to change resolution of displayed bacgorund for every scene
  final ConfigResolution scene;
  PickResolutionScreen({@required this.scene});

  @override
  _PickResolutionScreenState createState() => _PickResolutionScreenState();
}

class _PickResolutionScreenState extends State<PickResolutionScreen> {
  String _title = '';

  @override
  Widget build(BuildContext context) {
    _title = _createHeaderMessage(_title);
    final titleWidth = MediaQuery.of(context).size.height / 9 * 16;
    final titleHeight = 100.0;

    return WillPopScope(
        onWillPop: this._onWillPop,
        child: Scaffold(
            body: Stack(fit: StackFit.expand, children: [
          // Game(Background) Layer
          Positioned.fill(child: widget.scene.widget),

          // UI Layer
          Positioned.fill(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    color: Colors.white.withOpacity(0.95),
                    height: titleHeight,
                    width: titleWidth,
                    child: Row(children: <Widget>[
                      Expanded(
                          child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 5),
                              child: AutoSizeText(this._title,
                                  minFontSize: 10,
                                  overflow: TextOverflow.fade,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 20))))
                    ])),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          RaisedButton(
                              elevation: 5,
                              child: Text('Previous'),
                              onPressed: this._onPrevious),
                          RaisedButton(
                              elevation: 5,
                              child: Text('Accept'),
                              onPressed: this._onAccept),
                          RaisedButton(
                              elevation: 5,
                              child: Text('Next'),
                              onPressed: this._onNext)
                        ]))
              ]))
        ])));
  }

  Future<bool> _onWillPop() async {
    return false;
  }

  void _onPrevious() {
    widget.scene.previousBackgound();
    setState(() {
      this._title = widget.scene.backgroundManager.currentBackgroundPath;
    });
  }

  void _onAccept() async {
    await widget.scene.saveImageFactor();
    Navigator.pop(context);
  }

  void _onNext() {
    widget.scene.backgroundManager.nextBackground();
    setState(() {
      this._title = widget.scene.backgroundManager.currentBackgroundPath;
    });
  }

  String _createHeaderMessage(String input) {
    if (input.contains('0.75x')) {
      input = '0.75x';
    } else if (input.contains('1x')) {
      input = '1x';
    } else if (input.contains('1.5x')) {
      input = '1.5x';
    } else if (_title.contains('2x')) {
      input = '2x';
    } else if (input.contains('3x')) {
      input = '3x';
    } else if (_title.contains('4x')) {
      input = '4x';
    } else {
      input = '0.75x';
    }

    final info = input == '3x' || input == '4x'
        ? '\nThis resolution may cause stability problems. In case of errors, pick a lower one. '
        : '';

    return 'Current resolution: ' + input + info;
  }
}
