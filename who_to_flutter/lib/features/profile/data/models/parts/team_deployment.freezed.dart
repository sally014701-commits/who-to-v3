// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'team_deployment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TeamDeployment implements DiagnosticableTreeMixin {

 String? get teamId; String? get messageToTeam;
/// Create a copy of TeamDeployment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TeamDeploymentCopyWith<TeamDeployment> get copyWith => _$TeamDeploymentCopyWithImpl<TeamDeployment>(this as TeamDeployment, _$identity);

  /// Serializes this TeamDeployment to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'TeamDeployment'))
    ..add(DiagnosticsProperty('teamId', teamId))..add(DiagnosticsProperty('messageToTeam', messageToTeam));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TeamDeployment&&(identical(other.teamId, teamId) || other.teamId == teamId)&&(identical(other.messageToTeam, messageToTeam) || other.messageToTeam == messageToTeam));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,teamId,messageToTeam);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'TeamDeployment(teamId: $teamId, messageToTeam: $messageToTeam)';
}


}

/// @nodoc
abstract mixin class $TeamDeploymentCopyWith<$Res>  {
  factory $TeamDeploymentCopyWith(TeamDeployment value, $Res Function(TeamDeployment) _then) = _$TeamDeploymentCopyWithImpl;
@useResult
$Res call({
 String? teamId, String? messageToTeam
});




}
/// @nodoc
class _$TeamDeploymentCopyWithImpl<$Res>
    implements $TeamDeploymentCopyWith<$Res> {
  _$TeamDeploymentCopyWithImpl(this._self, this._then);

  final TeamDeployment _self;
  final $Res Function(TeamDeployment) _then;

/// Create a copy of TeamDeployment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? teamId = freezed,Object? messageToTeam = freezed,}) {
  return _then(_self.copyWith(
teamId: freezed == teamId ? _self.teamId : teamId // ignore: cast_nullable_to_non_nullable
as String?,messageToTeam: freezed == messageToTeam ? _self.messageToTeam : messageToTeam // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TeamDeployment].
extension TeamDeploymentPatterns on TeamDeployment {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TeamDeployment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TeamDeployment() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TeamDeployment value)  $default,){
final _that = this;
switch (_that) {
case _TeamDeployment():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TeamDeployment value)?  $default,){
final _that = this;
switch (_that) {
case _TeamDeployment() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? teamId,  String? messageToTeam)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TeamDeployment() when $default != null:
return $default(_that.teamId,_that.messageToTeam);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? teamId,  String? messageToTeam)  $default,) {final _that = this;
switch (_that) {
case _TeamDeployment():
return $default(_that.teamId,_that.messageToTeam);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? teamId,  String? messageToTeam)?  $default,) {final _that = this;
switch (_that) {
case _TeamDeployment() when $default != null:
return $default(_that.teamId,_that.messageToTeam);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _TeamDeployment with DiagnosticableTreeMixin implements TeamDeployment {
  const _TeamDeployment({this.teamId, this.messageToTeam});
  factory _TeamDeployment.fromJson(Map<String, dynamic> json) => _$TeamDeploymentFromJson(json);

@override final  String? teamId;
@override final  String? messageToTeam;

/// Create a copy of TeamDeployment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TeamDeploymentCopyWith<_TeamDeployment> get copyWith => __$TeamDeploymentCopyWithImpl<_TeamDeployment>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TeamDeploymentToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'TeamDeployment'))
    ..add(DiagnosticsProperty('teamId', teamId))..add(DiagnosticsProperty('messageToTeam', messageToTeam));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TeamDeployment&&(identical(other.teamId, teamId) || other.teamId == teamId)&&(identical(other.messageToTeam, messageToTeam) || other.messageToTeam == messageToTeam));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,teamId,messageToTeam);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'TeamDeployment(teamId: $teamId, messageToTeam: $messageToTeam)';
}


}

/// @nodoc
abstract mixin class _$TeamDeploymentCopyWith<$Res> implements $TeamDeploymentCopyWith<$Res> {
  factory _$TeamDeploymentCopyWith(_TeamDeployment value, $Res Function(_TeamDeployment) _then) = __$TeamDeploymentCopyWithImpl;
@override @useResult
$Res call({
 String? teamId, String? messageToTeam
});




}
/// @nodoc
class __$TeamDeploymentCopyWithImpl<$Res>
    implements _$TeamDeploymentCopyWith<$Res> {
  __$TeamDeploymentCopyWithImpl(this._self, this._then);

  final _TeamDeployment _self;
  final $Res Function(_TeamDeployment) _then;

/// Create a copy of TeamDeployment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? teamId = freezed,Object? messageToTeam = freezed,}) {
  return _then(_TeamDeployment(
teamId: freezed == teamId ? _self.teamId : teamId // ignore: cast_nullable_to_non_nullable
as String?,messageToTeam: freezed == messageToTeam ? _self.messageToTeam : messageToTeam // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
