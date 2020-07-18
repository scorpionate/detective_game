import 'package:json_annotation/json_annotation.dart';

part 'game_state.g.dart';

@JsonSerializable()
class GameState {
  final int mainThreadIndex;

  GameState(this.mainThreadIndex);

  // Auto generated
  factory GameState.fromJson(Map<String, dynamic> json) =>
      _$GameStateFromJson(json);
  Map<String, dynamic> toJson() => _$GameStateToJson(this);
}
