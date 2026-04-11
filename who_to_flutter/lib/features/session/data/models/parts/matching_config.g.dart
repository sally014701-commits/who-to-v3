// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'matching_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MatchingConfig _$MatchingConfigFromJson(Map<String, dynamic> json) =>
    _MatchingConfig(
      teamSize: (json['teamSize'] as num?)?.toInt() ?? 4,
      selectedParams:
          (json['selectedParams'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      weights:
          (json['weights'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, (e as num).toInt()),
          ) ??
          const {},
    );

Map<String, dynamic> _$MatchingConfigToJson(_MatchingConfig instance) =>
    <String, dynamic>{
      'teamSize': instance.teamSize,
      'selectedParams': instance.selectedParams,
      'weights': instance.weights,
    };
