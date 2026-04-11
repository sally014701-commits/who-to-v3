import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'student_matching_inputs.freezed.dart';
part 'student_matching_inputs.g.dart';

@freezed
class StudentMatchingInputs with _$StudentMatchingInputs {
  @JsonSerializable(explicitToJson: true)
  const factory StudentMatchingInputs({
    @Default([]) List<String> roleTagIds,
    @Default([]) List<String> interestTagIds,
    String? customInterest,
    @Default(5) int extroversionScore,
    @Default(1) int englishLevel,
    String? discussionQuestionId,
  }) = _StudentMatchingInputs;

  factory StudentMatchingInputs.fromJson(Map<String, dynamic> json) => _$StudentMatchingInputsFromJson(json);
}
