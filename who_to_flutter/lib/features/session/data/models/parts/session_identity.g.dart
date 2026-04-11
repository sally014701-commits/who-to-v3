// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_identity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SessionIdentity _$SessionIdentityFromJson(Map<String, dynamic> json) =>
    _SessionIdentity(
      id: json['id'] as String,
      code: json['code'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$SessionIdentityToJson(_SessionIdentity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
    };
