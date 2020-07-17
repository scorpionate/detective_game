import 'package:json_annotation/json_annotation.dart';

part 'choice.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable()
class Choice {
  final String scene;
  final int index;

  Choice(this.scene, this.index);

  // Auto generated
  factory Choice.fromJson(Map<String, dynamic> json) => _$ChoiceFromJson(json);
  Map<String, dynamic> toJson() => _$ChoiceToJson(this);
}
