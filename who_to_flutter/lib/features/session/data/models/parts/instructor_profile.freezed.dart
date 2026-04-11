// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'instructor_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InstructorProfile implements DiagnosticableTreeMixin {

 String get name; String? get emoji; String get password;
/// Create a copy of InstructorProfile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InstructorProfileCopyWith<InstructorProfile> get copyWith => _$InstructorProfileCopyWithImpl<InstructorProfile>(this as InstructorProfile, _$identity);

  /// Serializes this InstructorProfile to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'InstructorProfile'))
    ..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('emoji', emoji))..add(DiagnosticsProperty('password', password));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InstructorProfile&&(identical(other.name, name) || other.name == name)&&(identical(other.emoji, emoji) || other.emoji == emoji)&&(identical(other.password, password) || other.password == password));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,emoji,password);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'InstructorProfile(name: $name, emoji: $emoji, password: $password)';
}


}

/// @nodoc
abstract mixin class $InstructorProfileCopyWith<$Res>  {
  factory $InstructorProfileCopyWith(InstructorProfile value, $Res Function(InstructorProfile) _then) = _$InstructorProfileCopyWithImpl;
@useResult
$Res call({
 String name, String? emoji, String password
});




}
/// @nodoc
class _$InstructorProfileCopyWithImpl<$Res>
    implements $InstructorProfileCopyWith<$Res> {
  _$InstructorProfileCopyWithImpl(this._self, this._then);

  final InstructorProfile _self;
  final $Res Function(InstructorProfile) _then;

/// Create a copy of InstructorProfile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? emoji = freezed,Object? password = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,emoji: freezed == emoji ? _self.emoji : emoji // ignore: cast_nullable_to_non_nullable
as String?,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [InstructorProfile].
extension InstructorProfilePatterns on InstructorProfile {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InstructorProfile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InstructorProfile() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InstructorProfile value)  $default,){
final _that = this;
switch (_that) {
case _InstructorProfile():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InstructorProfile value)?  $default,){
final _that = this;
switch (_that) {
case _InstructorProfile() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String? emoji,  String password)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InstructorProfile() when $default != null:
return $default(_that.name,_that.emoji,_that.password);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String? emoji,  String password)  $default,) {final _that = this;
switch (_that) {
case _InstructorProfile():
return $default(_that.name,_that.emoji,_that.password);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String? emoji,  String password)?  $default,) {final _that = this;
switch (_that) {
case _InstructorProfile() when $default != null:
return $default(_that.name,_that.emoji,_that.password);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _InstructorProfile with DiagnosticableTreeMixin implements InstructorProfile {
  const _InstructorProfile({required this.name, this.emoji, required this.password});
  factory _InstructorProfile.fromJson(Map<String, dynamic> json) => _$InstructorProfileFromJson(json);

@override final  String name;
@override final  String? emoji;
@override final  String password;

/// Create a copy of InstructorProfile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InstructorProfileCopyWith<_InstructorProfile> get copyWith => __$InstructorProfileCopyWithImpl<_InstructorProfile>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InstructorProfileToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'InstructorProfile'))
    ..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('emoji', emoji))..add(DiagnosticsProperty('password', password));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InstructorProfile&&(identical(other.name, name) || other.name == name)&&(identical(other.emoji, emoji) || other.emoji == emoji)&&(identical(other.password, password) || other.password == password));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,emoji,password);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'InstructorProfile(name: $name, emoji: $emoji, password: $password)';
}


}

/// @nodoc
abstract mixin class _$InstructorProfileCopyWith<$Res> implements $InstructorProfileCopyWith<$Res> {
  factory _$InstructorProfileCopyWith(_InstructorProfile value, $Res Function(_InstructorProfile) _then) = __$InstructorProfileCopyWithImpl;
@override @useResult
$Res call({
 String name, String? emoji, String password
});




}
/// @nodoc
class __$InstructorProfileCopyWithImpl<$Res>
    implements _$InstructorProfileCopyWith<$Res> {
  __$InstructorProfileCopyWithImpl(this._self, this._then);

  final _InstructorProfile _self;
  final $Res Function(_InstructorProfile) _then;

/// Create a copy of InstructorProfile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? emoji = freezed,Object? password = null,}) {
  return _then(_InstructorProfile(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,emoji: freezed == emoji ? _self.emoji : emoji // ignore: cast_nullable_to_non_nullable
as String?,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
