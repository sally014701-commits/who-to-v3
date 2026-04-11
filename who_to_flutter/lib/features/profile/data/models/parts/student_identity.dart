import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'student_identity.freezed.dart';
part 'student_identity.g.dart';

@freezed
class StudentIdentity with _$StudentIdentity {
  @JsonSerializable(explicitToJson: true)
  const factory StudentIdentity({
    required String id,
    required String password,
  }) = _StudentIdentity;

  factory StudentIdentity.fromJson(Map<String, dynamic> json) => _$StudentIdentityFromJson(json);
}
