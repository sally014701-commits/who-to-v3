// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'student_matching_inputs.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StudentMatchingInputs implements DiagnosticableTreeMixin {

 List<String> get roleTagIds; List<String> get interestTagIds; String? get customInterest; int get extroversionScore; int get englishLevel; String? get discussionQuestionId;
/// Create a copy of StudentMatchingInputs
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StudentMatchingInputsCopyWith<StudentMatchingInputs> get copyWith => _$StudentMatchingInputsCopyWithImpl<StudentMatchingInputs>(this as StudentMatchingInputs, _$identity);

  /// Serializes this StudentMatchingInputs to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'StudentMatchingInputs'))
    ..add(DiagnosticsProperty('roleTagIds', roleTagIds))..add(DiagnosticsProperty('interestTagIds', interestTagIds))..add(DiagnosticsProperty('customInterest', customInterest))..add(DiagnosticsProperty('extroversionScore', extroversionScore))..add(DiagnosticsProperty('englishLevel', englishLevel))..add(DiagnosticsProperty('discussionQuestionId', discussionQuestionId));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StudentMatchingInputs&&const DeepCollectionEquality().equals(other.roleTagIds, roleTagIds)&&const DeepCollectionEquality().equals(other.interestTagIds, interestTagIds)&&(identical(other.customInterest, customInterest) || other.customInterest == customInterest)&&(identical(other.extroversionScore, extroversionScore) || other.extroversionScore == extroversionScore)&&(identical(other.englishLevel, englishLevel) || other.englishLevel == englishLevel)&&(identical(other.discussionQuestionId, discussionQuestionId) || other.discussionQuestionId == discussionQuestionId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(roleTagIds),const DeepCollectionEquality().hash(interestTagIds),customInterest,extroversionScore,englishLevel,discussionQuestionId);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'StudentMatchingInputs(roleTagIds: $roleTagIds, interestTagIds: $interestTagIds, customInterest: $customInterest, extroversionScore: $extroversionScore, englishLevel: $englishLevel, discussionQuestionId: $discussionQuestionId)';
}


}

/// @nodoc
abstract mixin class $StudentMatchingInputsCopyWith<$Res>  {
  factory $StudentMatchingInputsCopyWith(StudentMatchingInputs value, $Res Function(StudentMatchingInputs) _then) = _$StudentMatchingInputsCopyWithImpl;
@useResult
$Res call({
 List<String> roleTagIds, List<String> interestTagIds, String? customInterest, int extroversionScore, int englishLevel, String? discussionQuestionId
});




}
/// @nodoc
class _$StudentMatchingInputsCopyWithImpl<$Res>
    implements $StudentMatchingInputsCopyWith<$Res> {
  _$StudentMatchingInputsCopyWithImpl(this._self, this._then);

  final StudentMatchingInputs _self;
  final $Res Function(StudentMatchingInputs) _then;

/// Create a copy of StudentMatchingInputs
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? roleTagIds = null,Object? interestTagIds = null,Object? customInterest = freezed,Object? extroversionScore = null,Object? englishLevel = null,Object? discussionQuestionId = freezed,}) {
  return _then(_self.copyWith(
roleTagIds: null == roleTagIds ? _self.roleTagIds : roleTagIds // ignore: cast_nullable_to_non_nullable
as List<String>,interestTagIds: null == interestTagIds ? _self.interestTagIds : interestTagIds // ignore: cast_nullable_to_non_nullable
as List<String>,customInterest: freezed == customInterest ? _self.customInterest : customInterest // ignore: cast_nullable_to_non_nullable
as String?,extroversionScore: null == extroversionScore ? _self.extroversionScore : extroversionScore // ignore: cast_nullable_to_non_nullable
as int,englishLevel: null == englishLevel ? _self.englishLevel : englishLevel // ignore: cast_nullable_to_non_nullable
as int,discussionQuestionId: freezed == discussionQuestionId ? _self.discussionQuestionId : discussionQuestionId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [StudentMatchingInputs].
extension StudentMatchingInputsPatterns on StudentMatchingInputs {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StudentMatchingInputs value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StudentMatchingInputs() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StudentMatchingInputs value)  $default,){
final _that = this;
switch (_that) {
case _StudentMatchingInputs():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StudentMatchingInputs value)?  $default,){
final _that = this;
switch (_that) {
case _StudentMatchingInputs() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<String> roleTagIds,  List<String> interestTagIds,  String? customInterest,  int extroversionScore,  int englishLevel,  String? discussionQuestionId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StudentMatchingInputs() when $default != null:
return $default(_that.roleTagIds,_that.interestTagIds,_that.customInterest,_that.extroversionScore,_that.englishLevel,_that.discussionQuestionId);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<String> roleTagIds,  List<String> interestTagIds,  String? customInterest,  int extroversionScore,  int englishLevel,  String? discussionQuestionId)  $default,) {final _that = this;
switch (_that) {
case _StudentMatchingInputs():
return $default(_that.roleTagIds,_that.interestTagIds,_that.customInterest,_that.extroversionScore,_that.englishLevel,_that.discussionQuestionId);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<String> roleTagIds,  List<String> interestTagIds,  String? customInterest,  int extroversionScore,  int englishLevel,  String? discussionQuestionId)?  $default,) {final _that = this;
switch (_that) {
case _StudentMatchingInputs() when $default != null:
return $default(_that.roleTagIds,_that.interestTagIds,_that.customInterest,_that.extroversionScore,_that.englishLevel,_that.discussionQuestionId);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _StudentMatchingInputs with DiagnosticableTreeMixin implements StudentMatchingInputs {
  const _StudentMatchingInputs({final  List<String> roleTagIds = const [], final  List<String> interestTagIds = const [], this.customInterest, this.extroversionScore = 5, this.englishLevel = 1, this.discussionQuestionId}): _roleTagIds = roleTagIds,_interestTagIds = interestTagIds;
  factory _StudentMatchingInputs.fromJson(Map<String, dynamic> json) => _$StudentMatchingInputsFromJson(json);

 final  List<String> _roleTagIds;
@override@JsonKey() List<String> get roleTagIds {
  if (_roleTagIds is EqualUnmodifiableListView) return _roleTagIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_roleTagIds);
}

 final  List<String> _interestTagIds;
@override@JsonKey() List<String> get interestTagIds {
  if (_interestTagIds is EqualUnmodifiableListView) return _interestTagIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_interestTagIds);
}

@override final  String? customInterest;
@override@JsonKey() final  int extroversionScore;
@override@JsonKey() final  int englishLevel;
@override final  String? discussionQuestionId;

/// Create a copy of StudentMatchingInputs
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StudentMatchingInputsCopyWith<_StudentMatchingInputs> get copyWith => __$StudentMatchingInputsCopyWithImpl<_StudentMatchingInputs>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StudentMatchingInputsToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'StudentMatchingInputs'))
    ..add(DiagnosticsProperty('roleTagIds', roleTagIds))..add(DiagnosticsProperty('interestTagIds', interestTagIds))..add(DiagnosticsProperty('customInterest', customInterest))..add(DiagnosticsProperty('extroversionScore', extroversionScore))..add(DiagnosticsProperty('englishLevel', englishLevel))..add(DiagnosticsProperty('discussionQuestionId', discussionQuestionId));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StudentMatchingInputs&&const DeepCollectionEquality().equals(other._roleTagIds, _roleTagIds)&&const DeepCollectionEquality().equals(other._interestTagIds, _interestTagIds)&&(identical(other.customInterest, customInterest) || other.customInterest == customInterest)&&(identical(other.extroversionScore, extroversionScore) || other.extroversionScore == extroversionScore)&&(identical(other.englishLevel, englishLevel) || other.englishLevel == englishLevel)&&(identical(other.discussionQuestionId, discussionQuestionId) || other.discussionQuestionId == discussionQuestionId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_roleTagIds),const DeepCollectionEquality().hash(_interestTagIds),customInterest,extroversionScore,englishLevel,discussionQuestionId);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'StudentMatchingInputs(roleTagIds: $roleTagIds, interestTagIds: $interestTagIds, customInterest: $customInterest, extroversionScore: $extroversionScore, englishLevel: $englishLevel, discussionQuestionId: $discussionQuestionId)';
}


}

/// @nodoc
abstract mixin class _$StudentMatchingInputsCopyWith<$Res> implements $StudentMatchingInputsCopyWith<$Res> {
  factory _$StudentMatchingInputsCopyWith(_StudentMatchingInputs value, $Res Function(_StudentMatchingInputs) _then) = __$StudentMatchingInputsCopyWithImpl;
@override @useResult
$Res call({
 List<String> roleTagIds, List<String> interestTagIds, String? customInterest, int extroversionScore, int englishLevel, String? discussionQuestionId
});




}
/// @nodoc
class __$StudentMatchingInputsCopyWithImpl<$Res>
    implements _$StudentMatchingInputsCopyWith<$Res> {
  __$StudentMatchingInputsCopyWithImpl(this._self, this._then);

  final _StudentMatchingInputs _self;
  final $Res Function(_StudentMatchingInputs) _then;

/// Create a copy of StudentMatchingInputs
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? roleTagIds = null,Object? interestTagIds = null,Object? customInterest = freezed,Object? extroversionScore = null,Object? englishLevel = null,Object? discussionQuestionId = freezed,}) {
  return _then(_StudentMatchingInputs(
roleTagIds: null == roleTagIds ? _self._roleTagIds : roleTagIds // ignore: cast_nullable_to_non_nullable
as List<String>,interestTagIds: null == interestTagIds ? _self._interestTagIds : interestTagIds // ignore: cast_nullable_to_non_nullable
as List<String>,customInterest: freezed == customInterest ? _self.customInterest : customInterest // ignore: cast_nullable_to_non_nullable
as String?,extroversionScore: null == extroversionScore ? _self.extroversionScore : extroversionScore // ignore: cast_nullable_to_non_nullable
as int,englishLevel: null == englishLevel ? _self.englishLevel : englishLevel // ignore: cast_nullable_to_non_nullable
as int,discussionQuestionId: freezed == discussionQuestionId ? _self.discussionQuestionId : discussionQuestionId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
