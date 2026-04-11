// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SessionModel _$SessionModelFromJson(Map<String, dynamic> json) =>
    _SessionModel(
      identity: SessionIdentity.fromJson(
        json['identity'] as Map<String, dynamic>,
      ),
      instructor: InstructorProfile.fromJson(
        json['instructor'] as Map<String, dynamic>,
      ),
      config: MatchingConfig.fromJson(json['config'] as Map<String, dynamic>),
      resources: SessionResources.fromJson(
        json['resources'] as Map<String, dynamic>,
      ),
      state: SessionState.fromJson(json['state'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SessionModelToJson(_SessionModel instance) =>
    <String, dynamic>{
      'identity': instance.identity.toJson(),
      'instructor': instance.instructor.toJson(),
      'config': instance.config.toJson(),
      'resources': instance.resources.toJson(),
      'state': instance.state.toJson(),
    };
