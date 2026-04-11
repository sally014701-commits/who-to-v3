import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'session_state.freezed.dart';
part 'session_state.g.dart';

@freezed
class SessionState with _$SessionState {
  @JsonSerializable(explicitToJson: true)
  const factory SessionState({
    @Default('open') String status, // open, published
  }) = _SessionState;

  factory SessionState.fromJson(Map<String, dynamic> json) => _$SessionStateFromJson(json);
}
