import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'matching_config.freezed.dart';
part 'matching_config.g.dart';

@freezed
class MatchingConfig with _$MatchingConfig {
  @JsonSerializable(explicitToJson: true)
  const factory MatchingConfig({
    @Default(4) int teamSize,
    @Default([]) List<String> selectedParams,
    @Default({}) Map<String, int> weights,
  }) = _MatchingConfig;

  factory MatchingConfig.fromJson(Map<String, dynamic> json) => _$MatchingConfigFromJson(json);
}
