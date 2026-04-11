import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:who_to_flutter/features/profile/data/models/parts/student_identity.dart';
import 'package:who_to_flutter/features/profile/data/models/parts/student_profile.dart';
import 'package:who_to_flutter/features/profile/data/models/parts/student_matching_inputs.dart';
import 'package:who_to_flutter/features/profile/data/models/parts/team_deployment.dart';

part 'student_model.freezed.dart';
part 'student_model.g.dart';

@freezed
class StudentModel with _$StudentModel {
  @JsonSerializable(explicitToJson: true)
  const factory StudentModel({
    required StudentIdentity identity,
    required StudentProfile profile,
    required StudentMatchingInputs inputs,
    TeamDeployment? deployment,
  }) = _StudentModel;

  factory StudentModel.fromJson(Map<String, dynamic> json) => _$StudentModelFromJson(json);
}
