// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_resources.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SessionResources _$SessionResourcesFromJson(Map<String, dynamic> json) =>
    _SessionResources(
      roleTags:
          (json['roleTags'] as List<dynamic>?)
              ?.map((e) => TagModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      interestTags:
          (json['interestTags'] as List<dynamic>?)
              ?.map((e) => TagModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      discussionQuestions:
          (json['discussionQuestions'] as List<dynamic>?)
              ?.map((e) => QuestionModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$SessionResourcesToJson(_SessionResources instance) =>
    <String, dynamic>{
      'roleTags': instance.roleTags.map((e) => e.toJson()).toList(),
      'interestTags': instance.interestTags.map((e) => e.toJson()).toList(),
      'discussionQuestions': instance.discussionQuestions
          .map((e) => e.toJson())
          .toList(),
    };
