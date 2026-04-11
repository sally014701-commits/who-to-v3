import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:who_to_flutter/features/shared/data/models/tag_model.dart';
import 'package:who_to_flutter/features/shared/data/models/question_model.dart';

part 'session_resources.freezed.dart';
part 'session_resources.g.dart';

@freezed
class SessionResources with _$SessionResources {
  @JsonSerializable(explicitToJson: true)
  const factory SessionResources({
    @Default([]) List<TagModel> roleTags,
    @Default([]) List<TagModel> interestTags,
    @Default([]) List<QuestionModel> discussionQuestions,
  }) = _SessionResources;

  factory SessionResources.fromJson(Map<String, dynamic> json) => _$SessionResourcesFromJson(json);
}
