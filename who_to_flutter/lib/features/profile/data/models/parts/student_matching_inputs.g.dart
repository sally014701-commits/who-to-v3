// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_matching_inputs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StudentMatchingInputs _$StudentMatchingInputsFromJson(
  Map<String, dynamic> json,
) => _StudentMatchingInputs(
  roleTagIds:
      (json['roleTagIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  interestTagIds:
      (json['interestTagIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  customInterest: json['customInterest'] as String?,
  extroversionScore: (json['extroversionScore'] as num?)?.toInt() ?? 5,
  englishLevel: (json['englishLevel'] as num?)?.toInt() ?? 1,
  discussionQuestionId: json['discussionQuestionId'] as String?,
);

Map<String, dynamic> _$StudentMatchingInputsToJson(
  _StudentMatchingInputs instance,
) => <String, dynamic>{
  'roleTagIds': instance.roleTagIds,
  'interestTagIds': instance.interestTagIds,
  'customInterest': instance.customInterest,
  'extroversionScore': instance.extroversionScore,
  'englishLevel': instance.englishLevel,
  'discussionQuestionId': instance.discussionQuestionId,
};
