// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'choices.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Choices _$ChoicesFromJson(Map<String, dynamic> json) {
  return Choices(
    (json['data'] as List)
        ?.map((e) =>
            e == null ? null : Choice.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ChoicesToJson(Choices instance) => <String, dynamic>{
      'data': instance.data?.map((e) => e?.toJson())?.toList(),
    };
