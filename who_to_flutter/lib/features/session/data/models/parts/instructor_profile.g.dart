// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'instructor_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InstructorProfile _$InstructorProfileFromJson(Map<String, dynamic> json) =>
    _InstructorProfile(
      name: json['name'] as String,
      emoji: json['emoji'] as String?,
      password: json['password'] as String,
    );

Map<String, dynamic> _$InstructorProfileToJson(_InstructorProfile instance) =>
    <String, dynamic>{
      'name': instance.name,
      'emoji': instance.emoji,
      'password': instance.password,
    };
