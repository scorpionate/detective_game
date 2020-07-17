import 'package:detective_game/model/choice.dart';
import 'package:json_annotation/json_annotation.dart';

part 'choices.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable(explicitToJson: true)
class Choices {
  final List<Choice> data;

  Choices(this.data);
  Choices.init() : data = List.unmodifiable(<Choice>[]);

  factory Choices.fromJson(Map<String, dynamic> json) =>
      _$ChoicesFromJson(json);
  Map<String, dynamic> toJson() => _$ChoicesToJson(this);
}
