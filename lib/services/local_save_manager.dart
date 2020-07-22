import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:detective_game/model/choice.dart';
import 'package:detective_game/model/choices.dart';
import 'package:detective_game/model/game_state.dart';

class LocalSaveManager {
// Manages saving data into shared preferences.
// Saves game state, and optional dialogues, chosen by the player.
  static String choicesKey = 'SAVEDCHOICES';
  static String stateKey = 'GAMESTATE';
  static String resolutionKey = 'RESOLUTION';

  Future<void> clearAllSavedChoices() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(choicesKey, null);
  }

  Future<void> clearSavedChoicesForScene(T) async {
    // Clears saved choices for specified scene
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(choicesKey);
    final type = T.toString();

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
      prefs.setString(choicesKey, cleared);
    } else {
      return;
    }
  }

  Future<void> addToOptionalChoices(String scene, int index) async {
    // Adds to all optional choices another choice
    final prefs = await SharedPreferences.getInstance();
    final choices = await this.loadOptionalChoices();

    var list = List<Choice>()
      ..addAll(choices.data)
      ..add(Choice(scene, index));

    final result = json.encode(Choices(list).toJson());
    prefs.setString(choicesKey, result);
  }

  Future<Choices> loadOptionalChoices() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(choicesKey);

    if (data != null) {
      Map val = json.decode(data);
      return Choices.fromJson(val);
    } else {
      return Choices.init();
    }
  }

  Future<void> saveGameState(GameState state) async {
    final prefs = await SharedPreferences.getInstance();
    final val = json.encode(state.toJson());
    prefs.setString(stateKey, val);
  }

  Future<GameState> loadGameState() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(stateKey);

    if (data != null) {
      Map val = json.decode(data);
      final state = GameState.fromJson(val);
      return state;
    } else {
      return GameState(0);
    }
  }

  Future<void> saveResolution(String factor) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(resolutionKey, factor);
  }
}
