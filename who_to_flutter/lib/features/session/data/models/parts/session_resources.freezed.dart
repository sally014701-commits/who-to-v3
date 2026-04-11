// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_resources.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SessionResources implements DiagnosticableTreeMixin {

 List<TagModel> get roleTags; List<TagModel> get interestTags; List<QuestionModel> get discussionQuestions;
/// Create a copy of SessionResources
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionResourcesCopyWith<SessionResources> get copyWith => _$SessionResourcesCopyWithImpl<SessionResources>(this as SessionResources, _$identity);

  /// Serializes this SessionResources to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'SessionResources'))
    ..add(DiagnosticsProperty('roleTags', roleTags))..add(DiagnosticsProperty('interestTags', interestTags))..add(DiagnosticsProperty('discussionQuestions', discussionQuestions));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionResources&&const DeepCollectionEquality().equals(other.roleTags, roleTags)&&const DeepCollectionEquality().equals(other.interestTags, interestTags)&&const DeepCollectionEquality().equals(other.discussionQuestions, discussionQuestions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(roleTags),const DeepCollectionEquality().hash(interestTags),const DeepCollectionEquality().hash(discussionQuestions));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'SessionResources(roleTags: $roleTags, interestTags: $interestTags, discussionQuestions: $discussionQuestions)';
}


}

/// @nodoc
abstract mixin class $SessionResourcesCopyWith<$Res>  {
  factory $SessionResourcesCopyWith(SessionResources value, $Res Function(SessionResources) _then) = _$SessionResourcesCopyWithImpl;
@useResult
$Res call({
 List<TagModel> roleTags, List<TagModel> interestTags, List<QuestionModel> discussionQuestions
});




}
/// @nodoc
class _$SessionResourcesCopyWithImpl<$Res>
    implements $SessionResourcesCopyWith<$Res> {
  _$SessionResourcesCopyWithImpl(this._self, this._then);

  final SessionResources _self;
  final $Res Function(SessionResources) _then;

/// Create a copy of SessionResources
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? roleTags = null,Object? interestTags = null,Object? discussionQuestions = null,}) {
  return _then(_self.copyWith(
roleTags: null == roleTags ? _self.roleTags : roleTags // ignore: cast_nullable_to_non_nullable
as List<TagModel>,interestTags: null == interestTags ? _self.interestTags : interestTags // ignore: cast_nullable_to_non_nullable
as List<TagModel>,discussionQuestions: null == discussionQuestions ? _self.discussionQuestions : discussionQuestions // ignore: cast_nullable_to_non_nullable
as List<QuestionModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [SessionResources].
extension SessionResourcesPatterns on SessionResources {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SessionResources value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SessionResources() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SessionResources value)  $default,){
final _that = this;
switch (_that) {
case _SessionResources():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SessionResources value)?  $default,){
final _that = this;
switch (_that) {
case _SessionResources() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<TagModel> roleTags,  List<TagModel> interestTags,  List<QuestionModel> discussionQuestions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SessionResources() when $default != null:
return $default(_that.roleTags,_that.interestTags,_that.discussionQuestions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<TagModel> roleTags,  List<TagModel> interestTags,  List<QuestionModel> discussionQuestions)  $default,) {final _that = this;
switch (_that) {
case _SessionResources():
return $default(_that.roleTags,_that.interestTags,_that.discussionQuestions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<TagModel> roleTags,  List<TagModel> interestTags,  List<QuestionModel> discussionQuestions)?  $default,) {final _that = this;
switch (_that) {
case _SessionResources() when $default != null:
return $default(_that.roleTags,_that.interestTags,_that.discussionQuestions);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _SessionResources with DiagnosticableTreeMixin implements SessionResources {
  const _SessionResources({final  List<TagModel> roleTags = const [], final  List<TagModel> interestTags = const [], final  List<QuestionModel> discussionQuestions = const []}): _roleTags = roleTags,_interestTags = interestTags,_discussionQuestions = discussionQuestions;
  factory _SessionResources.fromJson(Map<String, dynamic> json) => _$SessionResourcesFromJson(json);

 final  List<TagModel> _roleTags;
@override@JsonKey() List<TagModel> get roleTags {
  if (_roleTags is EqualUnmodifiableListView) return _roleTags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_roleTags);
}

 final  List<TagModel> _interestTags;
@override@JsonKey() List<TagModel> get interestTags {
  if (_interestTags is EqualUnmodifiableListView) return _interestTags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_interestTags);
}

 final  List<QuestionModel> _discussionQuestions;
@override@JsonKey() List<QuestionModel> get discussionQuestions {
  if (_discussionQuestions is EqualUnmodifiableListView) return _discussionQuestions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_discussionQuestions);
}


/// Create a copy of SessionResources
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SessionResourcesCopyWith<_SessionResources> get copyWith => __$SessionResourcesCopyWithImpl<_SessionResources>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SessionResourcesToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'SessionResources'))
    ..add(DiagnosticsProperty('roleTags', roleTags))..add(DiagnosticsProperty('interestTags', interestTags))..add(DiagnosticsProperty('discussionQuestions', discussionQuestions));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SessionResources&&const DeepCollectionEquality().equals(other._roleTags, _roleTags)&&const DeepCollectionEquality().equals(other._interestTags, _interestTags)&&const DeepCollectionEquality().equals(other._discussionQuestions, _discussionQuestions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_roleTags),const DeepCollectionEquality().hash(_interestTags),const DeepCollectionEquality().hash(_discussionQuestions));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'SessionResources(roleTags: $roleTags, interestTags: $interestTags, discussionQuestions: $discussionQuestions)';
}


}

/// @nodoc
abstract mixin class _$SessionResourcesCopyWith<$Res> implements $SessionResourcesCopyWith<$Res> {
  factory _$SessionResourcesCopyWith(_SessionResources value, $Res Function(_SessionResources) _then) = __$SessionResourcesCopyWithImpl;
@override @useResult
$Res call({
 List<TagModel> roleTags, List<TagModel> interestTags, List<QuestionModel> discussionQuestions
});




}
/// @nodoc
class __$SessionResourcesCopyWithImpl<$Res>
    implements _$SessionResourcesCopyWith<$Res> {
  __$SessionResourcesCopyWithImpl(this._self, this._then);

  final _SessionResources _self;
  final $Res Function(_SessionResources) _then;

/// Create a copy of SessionResources
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? roleTags = null,Object? interestTags = null,Object? discussionQuestions = null,}) {
  return _then(_SessionResources(
roleTags: null == roleTags ? _self._roleTags : roleTags // ignore: cast_nullable_to_non_nullable
as List<TagModel>,interestTags: null == interestTags ? _self._interestTags : interestTags // ignore: cast_nullable_to_non_nullable
as List<TagModel>,discussionQuestions: null == discussionQuestions ? _self._discussionQuestions : discussionQuestions // ignore: cast_nullable_to_non_nullable
as List<QuestionModel>,
  ));
}


}

// dart format on
