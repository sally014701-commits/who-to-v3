import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'team_model.freezed.dart';
part 'team_model.g.dart';

@freezed
class TeamIdentity with _$TeamIdentity {
  @JsonSerializable(explicitToJson: true)
  const factory TeamIdentity({
    required String id,
    required String name,
  }) = _TeamIdentity;

  factory TeamIdentity.fromJson(Map<String, dynamic> json) => _$TeamIdentityFromJson(json);
}

@freezed
class MatchingResults with _$MatchingResults {
  @JsonSerializable(explicitToJson: true)
  const factory MatchingResults({
    @Default(0.0) double cohesionScore,
    @Default([]) List<String> memberIds,
  }) = _MatchingResults;

  factory MatchingResults.fromJson(Map<String, dynamic> json) => _$MatchingResultsFromJson(json);
}

@freezed
class TeamModel with _$TeamModel {
  @JsonSerializable(explicitToJson: true)
  const factory TeamModel({
    required TeamIdentity identity,
    required MatchingResults results,
  }) = _TeamModel;

  factory TeamModel.fromJson(Map<String, dynamic> json) => _$TeamModelFromJson(json);
}
