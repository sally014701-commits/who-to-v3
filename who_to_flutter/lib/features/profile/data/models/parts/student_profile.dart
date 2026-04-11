import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'student_profile.freezed.dart';
part 'student_profile.g.dart';

@freezed
class StudentProfile with _$StudentProfile {
  @JsonSerializable(explicitToJson: true)
  const factory StudentProfile({
    required String name,
    String? emoji,
  }) = _StudentProfile;

  factory StudentProfile.fromJson(Map<String, dynamic> json) => _$StudentProfileFromJson(json);
}
