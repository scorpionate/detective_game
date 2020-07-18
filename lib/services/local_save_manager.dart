import 'dart:async';
import 'dart:convert';
import 'package:detective_game/model/choice.dart';
import 'package:detective_game/model/choices.dart';
import 'package:detective_game/model/game_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalSaveManager {
  Future<void> addToOptionalChoices(String scene, int index) async {
    final prefs = await SharedPreferences.getInstance();
    final choices = await this.loadOptionalChoices();

    var list = List<Choice>()
      ..addAll(choices.data)
      ..add(Choice(scene, index));

    final result = json.encode(Choices(list).toJson());
    prefs.setString('SAVEDCHOICES', result);
  }

  Future<void> clearAllSavedChoices() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('SAVEDCHOICES', null);
  }

  Future<void> saveGameState(GameState state) async {
    final prefs = await SharedPreferences.getInstance();
    final val = json.encode(state.toJson());
    prefs.setString('GAMESTATE', val);
  }

  Future<GameState> loadGameState() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString('GAMESTATE');

    if (data != null) {
      Map val = json.decode(data);
      final state = GameState.fromJson(val);
      return state;
    } else {
      return GameState(0);
    }
  }

  Future<void> clearSavedChoicesForScene(String type) async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString('SAVEDCHOICES');

    if (data != null) {
      Map val = json.decode(data);
      final choices = Choices.fromJson(val);

      var list = List<Choice>();
      choices.data.forEach((element) {
        if (element.scene != type) {
          list.add(Choice(element.scene, element.index));
        }
      });

      final cleared = json.encode(Choices(list).toJson());
      prefs.setString('SAVEDCHOICES', cleared);
    } else {
      return;
    }
  }

  Future<Choices> loadOptionalChoices() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString('SAVEDCHOICES');

    if (data != null) {
      Map val = json.decode(data);
      return Choices.fromJson(val);
    } else {
      return Choices.init();
    }
  }
}
