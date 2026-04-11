import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'session_identity.freezed.dart';
part 'session_identity.g.dart';

@freezed
class SessionIdentity with _$SessionIdentity {
  @JsonSerializable(explicitToJson: true)
  const factory SessionIdentity({
    required String id,
    required String code,
    required String name,
  }) = _SessionIdentity;

  factory SessionIdentity.fromJson(Map<String, dynamic> json) => _$SessionIdentityFromJson(json);
}
