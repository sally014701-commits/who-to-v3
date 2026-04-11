// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TeamIdentity _$TeamIdentityFromJson(Map<String, dynamic> json) =>
    _TeamIdentity(id: json['id'] as String, name: json['name'] as String);

Map<String, dynamic> _$TeamIdentityToJson(_TeamIdentity instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};

_MatchingResults _$MatchingResultsFromJson(Map<String, dynamic> json) =>
    _MatchingResults(
      cohesionScore: (json['cohesionScore'] as num?)?.toDouble() ?? 0.0,
      memberIds:
          (json['memberIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$MatchingResultsToJson(_MatchingResults instance) =>
    <String, dynamic>{
      'cohesionScore': instance.cohesionScore,
      'memberIds': instance.memberIds,
    };

_TeamModel _$TeamModelFromJson(Map<String, dynamic> json) => _TeamModel(
  identity: TeamIdentity.fromJson(json['identity'] as Map<String, dynamic>),
  results: MatchingResults.fromJson(json['results'] as Map<String, dynamic>),
);

Map<String, dynamic> _$TeamModelToJson(_TeamModel instance) =>
    <String, dynamic>{
      'identity': instance.identity.toJson(),
      'results': instance.results.toJson(),
    };
