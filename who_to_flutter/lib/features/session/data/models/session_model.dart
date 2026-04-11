import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:who_to_flutter/features/session/data/models/parts/session_identity.dart';
import 'package:who_to_flutter/features/session/data/models/parts/instructor_profile.dart';
import 'package:who_to_flutter/features/session/data/models/parts/matching_config.dart';
import 'package:who_to_flutter/features/session/data/models/parts/session_resources.dart';
import 'package:who_to_flutter/features/session/data/models/parts/session_state.dart';

part 'session_model.freezed.dart';
part 'session_model.g.dart';

@freezed
class SessionModel with _$SessionModel {
  @JsonSerializable(explicitToJson: true)
  const factory SessionModel({
    required SessionIdentity identity,
    required InstructorProfile instructor,
    required MatchingConfig config,
    required SessionResources resources,
    required SessionState state,
  }) = _SessionModel;

  factory SessionModel.fromJson(Map<String, dynamic> json) => _$SessionModelFromJson(json);
}
