// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team_deployment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TeamDeployment _$TeamDeploymentFromJson(Map<String, dynamic> json) =>
    _TeamDeployment(
      teamId: json['teamId'] as String?,
      messageToTeam: json['messageToTeam'] as String?,
    );

Map<String, dynamic> _$TeamDeploymentToJson(_TeamDeployment instance) =>
    <String, dynamic>{
      'teamId': instance.teamId,
      'messageToTeam': instance.messageToTeam,
    };
