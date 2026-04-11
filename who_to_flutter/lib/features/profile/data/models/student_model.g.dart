// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StudentModel _$StudentModelFromJson(Map<String, dynamic> json) =>
    _StudentModel(
      identity: StudentIdentity.fromJson(
        json['identity'] as Map<String, dynamic>,
      ),
      profile: StudentProfile.fromJson(json['profile'] as Map<String, dynamic>),
      inputs: StudentMatchingInputs.fromJson(
        json['inputs'] as Map<String, dynamic>,
      ),
      deployment: json['deployment'] == null
          ? null
          : TeamDeployment.fromJson(json['deployment'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StudentModelToJson(_StudentModel instance) =>
    <String, dynamic>{
      'identity': instance.identity.toJson(),
      'profile': instance.profile.toJson(),
      'inputs': instance.inputs.toJson(),
      'deployment': instance.deployment?.toJson(),
    };
