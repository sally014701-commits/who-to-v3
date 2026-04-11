import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tag_model.freezed.dart';
part 'tag_model.g.dart';

@freezed
class TagModel with _$TagModel {
  @JsonSerializable(explicitToJson: true)
  const factory TagModel({
    required String id,
    required String name,
    String? emoji,
  }) = _TagModel;

  factory TagModel.fromJson(Map<String, dynamic> json) => _$TagModelFromJson(json);
}
