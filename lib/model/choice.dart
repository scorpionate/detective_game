import 'package:json_annotation/json_annotation.dart';

part 'choice.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable()

// Model represents optional choice made by player, saved into Choices list
class Choice {
  final String scene; // Scene's type as String e.g. 'MT02'
  final int index; // Index of chosen optional dialogue

  Choice(this.scene, this.index);

  // Auto generated
  factory Choice.fromJson(Map<String, dynamic> json) => _$ChoiceFromJson(json);
  Map<String, dynamic> toJson() => _$ChoiceToJson(this);
}
