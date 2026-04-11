import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'team_deployment.freezed.dart';
part 'team_deployment.g.dart';

@freezed
class TeamDeployment with _$TeamDeployment {
  @JsonSerializable(explicitToJson: true)
  const factory TeamDeployment({
    String? teamId,
    String? messageToTeam,
  }) = _TeamDeployment;

  factory TeamDeployment.fromJson(Map<String, dynamic> json) => _$TeamDeploymentFromJson(json);
}
