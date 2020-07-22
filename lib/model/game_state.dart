import 'package:json_annotation/json_annotation.dart';

part 'game_state.g.dart';

@JsonSerializable()

// Model represents game state, what was last played by player
class GameState {
  final int mainThreadIndex; // Last scene played(but not finished)

  GameState(this.mainThreadIndex);

  // Auto generated
  factory GameState.fromJson(Map<String, dynamic> json) =>
      _$GameStateFromJson(json);
  Map<String, dynamic> toJson() => _$GameStateToJson(this);
}
