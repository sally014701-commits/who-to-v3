// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'student_identity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StudentIdentity implements DiagnosticableTreeMixin {

 String get id; String get password;
/// Create a copy of StudentIdentity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StudentIdentityCopyWith<StudentIdentity> get copyWith => _$StudentIdentityCopyWithImpl<StudentIdentity>(this as StudentIdentity, _$identity);

  /// Serializes this StudentIdentity to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'StudentIdentity'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('password', password));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StudentIdentity&&(identical(other.id, id) || other.id == id)&&(identical(other.password, password) || other.password == password));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,password);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'StudentIdentity(id: $id, password: $password)';
}


}

/// @nodoc
abstract mixin class $StudentIdentityCopyWith<$Res>  {
  factory $StudentIdentityCopyWith(StudentIdentity value, $Res Function(StudentIdentity) _then) = _$StudentIdentityCopyWithImpl;
@useResult
$Res call({
 String id, String password
});




}
/// @nodoc
class _$StudentIdentityCopyWithImpl<$Res>
    implements $StudentIdentityCopyWith<$Res> {
  _$StudentIdentityCopyWithImpl(this._self, this._then);

  final StudentIdentity _self;
  final $Res Function(StudentIdentity) _then;

/// Create a copy of StudentIdentity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? password = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [StudentIdentity].
extension StudentIdentityPatterns on StudentIdentity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StudentIdentity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StudentIdentity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StudentIdentity value)  $default,){
final _that = this;
switch (_that) {
case _StudentIdentity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StudentIdentity value)?  $default,){
final _that = this;
switch (_that) {
case _StudentIdentity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String password)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StudentIdentity() when $default != null:
return $default(_that.id,_that.password);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String password)  $default,) {final _that = this;
switch (_that) {
case _StudentIdentity():
return $default(_that.id,_that.password);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String password)?  $default,) {final _that = this;
switch (_that) {
case _StudentIdentity() when $default != null:
return $default(_that.id,_that.password);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _StudentIdentity with DiagnosticableTreeMixin implements StudentIdentity {
  const _StudentIdentity({required this.id, required this.password});
  factory _StudentIdentity.fromJson(Map<String, dynamic> json) => _$StudentIdentityFromJson(json);

@override final  String id;
@override final  String password;

/// Create a copy of StudentIdentity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StudentIdentityCopyWith<_StudentIdentity> get copyWith => __$StudentIdentityCopyWithImpl<_StudentIdentity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StudentIdentityToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'StudentIdentity'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('password', password));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StudentIdentity&&(identical(other.id, id) || other.id == id)&&(identical(other.password, password) || other.password == password));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,password);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'StudentIdentity(id: $id, password: $password)';
}


}

/// @nodoc
abstract mixin class _$StudentIdentityCopyWith<$Res> implements $StudentIdentityCopyWith<$Res> {
  factory _$StudentIdentityCopyWith(_StudentIdentity value, $Res Function(_StudentIdentity) _then) = __$StudentIdentityCopyWithImpl;
@override @useResult
$Res call({
 String id, String password
});




}
/// @nodoc
class __$StudentIdentityCopyWithImpl<$Res>
    implements _$StudentIdentityCopyWith<$Res> {
  __$StudentIdentityCopyWithImpl(this._self, this._then);

  final _StudentIdentity _self;
  final $Res Function(_StudentIdentity) _then;

/// Create a copy of StudentIdentity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? password = null,}) {
  return _then(_StudentIdentity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
