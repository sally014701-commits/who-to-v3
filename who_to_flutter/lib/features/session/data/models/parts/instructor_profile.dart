import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'instructor_profile.freezed.dart';
part 'instructor_profile.g.dart';

@freezed
class InstructorProfile with _$InstructorProfile {
  @JsonSerializable(explicitToJson: true)
  const factory InstructorProfile({
    required String name,
    String? emoji,
    required String password,
  }) = _InstructorProfile;

  factory InstructorProfile.fromJson(Map<String, dynamic> json) => _$InstructorProfileFromJson(json);
}
