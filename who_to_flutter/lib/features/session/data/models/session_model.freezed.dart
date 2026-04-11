// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SessionModel implements DiagnosticableTreeMixin {

 SessionIdentity get identity; InstructorProfile get instructor; MatchingConfig get config; SessionResources get resources; SessionState get state;
/// Create a copy of SessionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionModelCopyWith<SessionModel> get copyWith => _$SessionModelCopyWithImpl<SessionModel>(this as SessionModel, _$identity);

  /// Serializes this SessionModel to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'SessionModel'))
    ..add(DiagnosticsProperty('identity', identity))..add(DiagnosticsProperty('instructor', instructor))..add(DiagnosticsProperty('config', config))..add(DiagnosticsProperty('resources', resources))..add(DiagnosticsProperty('state', state));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionModel&&(identical(other.identity, identity) || other.identity == identity)&&(identical(other.instructor, instructor) || other.instructor == instructor)&&(identical(other.config, config) || other.config == config)&&(identical(other.resources, resources) || other.resources == resources)&&(identical(other.state, state) || other.state == state));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,identity,instructor,config,resources,state);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'SessionModel(identity: $identity, instructor: $instructor, config: $config, resources: $resources, state: $state)';
}


}

/// @nodoc
abstract mixin class $SessionModelCopyWith<$Res>  {
  factory $SessionModelCopyWith(SessionModel value, $Res Function(SessionModel) _then) = _$SessionModelCopyWithImpl;
@useResult
$Res call({
 SessionIdentity identity, InstructorProfile instructor, MatchingConfig config, SessionResources resources, SessionState state
});


$SessionIdentityCopyWith<$Res> get identity;$InstructorProfileCopyWith<$Res> get instructor;$MatchingConfigCopyWith<$Res> get config;$SessionResourcesCopyWith<$Res> get resources;$SessionStateCopyWith<$Res> get state;

}
/// @nodoc
class _$SessionModelCopyWithImpl<$Res>
    implements $SessionModelCopyWith<$Res> {
  _$SessionModelCopyWithImpl(this._self, this._then);

  final SessionModel _self;
  final $Res Function(SessionModel) _then;

/// Create a copy of SessionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? identity = null,Object? instructor = null,Object? config = null,Object? resources = null,Object? state = null,}) {
  return _then(_self.copyWith(
identity: null == identity ? _self.identity : identity // ignore: cast_nullable_to_non_nullable
as SessionIdentity,instructor: null == instructor ? _self.instructor : instructor // ignore: cast_nullable_to_non_nullable
as InstructorProfile,config: null == config ? _self.config : config // ignore: cast_nullable_to_non_nullable
as MatchingConfig,resources: null == resources ? _self.resources : resources // ignore: cast_nullable_to_non_nullable
as SessionResources,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as SessionState,
  ));
}
/// Create a copy of SessionModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SessionIdentityCopyWith<$Res> get identity {
  
  return $SessionIdentityCopyWith<$Res>(_self.identity, (value) {
    return _then(_self.copyWith(identity: value));
  });
}/// Create a copy of SessionModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InstructorProfileCopyWith<$Res> get instructor {
  
  return $InstructorProfileCopyWith<$Res>(_self.instructor, (value) {
    return _then(_self.copyWith(instructor: value));
  });
}/// Create a copy of SessionModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MatchingConfigCopyWith<$Res> get config {
  
  return $MatchingConfigCopyWith<$Res>(_self.config, (value) {
    return _then(_self.copyWith(config: value));
  });
}/// Create a copy of SessionModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SessionResourcesCopyWith<$Res> get resources {
  
  return $SessionResourcesCopyWith<$Res>(_self.resources, (value) {
    return _then(_self.copyWith(resources: value));
  });
}/// Create a copy of SessionModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SessionStateCopyWith<$Res> get state {
  
  return $SessionStateCopyWith<$Res>(_self.state, (value) {
    return _then(_self.copyWith(state: value));
  });
}
}


/// Adds pattern-matching-related methods to [SessionModel].
extension SessionModelPatterns on SessionModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SessionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SessionModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SessionModel value)  $default,){
final _that = this;
switch (_that) {
case _SessionModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SessionModel value)?  $default,){
final _that = this;
switch (_that) {
case _SessionModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SessionIdentity identity,  InstructorProfile instructor,  MatchingConfig config,  SessionResources resources,  SessionState state)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SessionModel() when $default != null:
return $default(_that.identity,_that.instructor,_that.config,_that.resources,_that.state);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SessionIdentity identity,  InstructorProfile instructor,  MatchingConfig config,  SessionResources resources,  SessionState state)  $default,) {final _that = this;
switch (_that) {
case _SessionModel():
return $default(_that.identity,_that.instructor,_that.config,_that.resources,_that.state);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SessionIdentity identity,  InstructorProfile instructor,  MatchingConfig config,  SessionResources resources,  SessionState state)?  $default,) {final _that = this;
switch (_that) {
case _SessionModel() when $default != null:
return $default(_that.identity,_that.instructor,_that.config,_that.resources,_that.state);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _SessionModel with DiagnosticableTreeMixin implements SessionModel {
  const _SessionModel({required this.identity, required this.instructor, required this.config, required this.resources, required this.state});
  factory _SessionModel.fromJson(Map<String, dynamic> json) => _$SessionModelFromJson(json);

@override final  SessionIdentity identity;
@override final  InstructorProfile instructor;
@override final  MatchingConfig config;
@override final  SessionResources resources;
@override final  SessionState state;

/// Create a copy of SessionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SessionModelCopyWith<_SessionModel> get copyWith => __$SessionModelCopyWithImpl<_SessionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SessionModelToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'SessionModel'))
    ..add(DiagnosticsProperty('identity', identity))..add(DiagnosticsProperty('instructor', instructor))..add(DiagnosticsProperty('config', config))..add(DiagnosticsProperty('resources', resources))..add(DiagnosticsProperty('state', state));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SessionModel&&(identical(other.identity, identity) || other.identity == identity)&&(identical(other.instructor, instructor) || other.instructor == instructor)&&(identical(other.config, config) || other.config == config)&&(identical(other.resources, resources) || other.resources == resources)&&(identical(other.state, state) || other.state == state));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,identity,instructor,config,resources,state);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'SessionModel(identity: $identity, instructor: $instructor, config: $config, resources: $resources, state: $state)';
}


}

/// @nodoc
abstract mixin class _$SessionModelCopyWith<$Res> implements $SessionModelCopyWith<$Res> {
  factory _$SessionModelCopyWith(_SessionModel value, $Res Function(_SessionModel) _then) = __$SessionModelCopyWithImpl;
@override @useResult
$Res call({
 SessionIdentity identity, InstructorProfile instructor, MatchingConfig config, SessionResources resources, SessionState state
});


@override $SessionIdentityCopyWith<$Res> get identity;@override $InstructorProfileCopyWith<$Res> get instructor;@override $MatchingConfigCopyWith<$Res> get config;@override $SessionResourcesCopyWith<$Res> get resources;@override $SessionStateCopyWith<$Res> get state;

}
/// @nodoc
class __$SessionModelCopyWithImpl<$Res>
    implements _$SessionModelCopyWith<$Res> {
  __$SessionModelCopyWithImpl(this._self, this._then);

  final _SessionModel _self;
  final $Res Function(_SessionModel) _then;

/// Create a copy of SessionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? identity = null,Object? instructor = null,Object? config = null,Object? resources = null,Object? state = null,}) {
  return _then(_SessionModel(
identity: null == identity ? _self.identity : identity // ignore: cast_nullable_to_non_nullable
as SessionIdentity,instructor: null == instructor ? _self.instructor : instructor // ignore: cast_nullable_to_non_nullable
as InstructorProfile,config: null == config ? _self.config : config // ignore: cast_nullable_to_non_nullable
as MatchingConfig,resources: null == resources ? _self.resources : resources // ignore: cast_nullable_to_non_nullable
as SessionResources,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as SessionState,
  ));
}

/// Create a copy of SessionModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SessionIdentityCopyWith<$Res> get identity {
  
  return $SessionIdentityCopyWith<$Res>(_self.identity, (value) {
    return _then(_self.copyWith(identity: value));
  });
}/// Create a copy of SessionModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InstructorProfileCopyWith<$Res> get instructor {
  
  return $InstructorProfileCopyWith<$Res>(_self.instructor, (value) {
    return _then(_self.copyWith(instructor: value));
  });
}/// Create a copy of SessionModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MatchingConfigCopyWith<$Res> get config {
  
  return $MatchingConfigCopyWith<$Res>(_self.config, (value) {
    return _then(_self.copyWith(config: value));
  });
}/// Create a copy of SessionModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SessionResourcesCopyWith<$Res> get resources {
  
  return $SessionResourcesCopyWith<$Res>(_self.resources, (value) {
    return _then(_self.copyWith(resources: value));
  });
}/// Create a copy of SessionModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SessionStateCopyWith<$Res> get state {
  
  return $SessionStateCopyWith<$Res>(_self.state, (value) {
    return _then(_self.copyWith(state: value));
  });
}
}

// dart format on
