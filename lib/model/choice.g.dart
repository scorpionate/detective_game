// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'choice.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Choice _$ChoiceFromJson(Map<String, dynamic> json) {
  return Choice(
    json['scene'] as String,
    json['index'] as int,
  );
}

Map<String, dynamic> _$ChoiceToJson(Choice instance) => <String, dynamic>{
      'scene': instance.scene,
      'index': instance.index,
    };
