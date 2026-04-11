// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'student_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StudentModel implements DiagnosticableTreeMixin {

 StudentIdentity get identity; StudentProfile get profile; StudentMatchingInputs get inputs; TeamDeployment? get deployment;
/// Create a copy of StudentModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StudentModelCopyWith<StudentModel> get copyWith => _$StudentModelCopyWithImpl<StudentModel>(this as StudentModel, _$identity);

  /// Serializes this StudentModel to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'StudentModel'))
    ..add(DiagnosticsProperty('identity', identity))..add(DiagnosticsProperty('profile', profile))..add(DiagnosticsProperty('inputs', inputs))..add(DiagnosticsProperty('deployment', deployment));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StudentModel&&(identical(other.identity, identity) || other.identity == identity)&&(identical(other.profile, profile) || other.profile == profile)&&(identical(other.inputs, inputs) || other.inputs == inputs)&&(identical(other.deployment, deployment) || other.deployment == deployment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,identity,profile,inputs,deployment);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'StudentModel(identity: $identity, profile: $profile, inputs: $inputs, deployment: $deployment)';
}


}

/// @nodoc
abstract mixin class $StudentModelCopyWith<$Res>  {
  factory $StudentModelCopyWith(StudentModel value, $Res Function(StudentModel) _then) = _$StudentModelCopyWithImpl;
@useResult
$Res call({
 StudentIdentity identity, StudentProfile profile, StudentMatchingInputs inputs, TeamDeployment? deployment
});


$StudentIdentityCopyWith<$Res> get identity;$StudentProfileCopyWith<$Res> get profile;$StudentMatchingInputsCopyWith<$Res> get inputs;$TeamDeploymentCopyWith<$Res>? get deployment;

}
/// @nodoc
class _$StudentModelCopyWithImpl<$Res>
    implements $StudentModelCopyWith<$Res> {
  _$StudentModelCopyWithImpl(this._self, this._then);

  final StudentModel _self;
  final $Res Function(StudentModel) _then;

/// Create a copy of StudentModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? identity = null,Object? profile = null,Object? inputs = null,Object? deployment = freezed,}) {
  return _then(_self.copyWith(
identity: null == identity ? _self.identity : identity // ignore: cast_nullable_to_non_nullable
as StudentIdentity,profile: null == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as StudentProfile,inputs: null == inputs ? _self.inputs : inputs // ignore: cast_nullable_to_non_nullable
as StudentMatchingInputs,deployment: freezed == deployment ? _self.deployment : deployment // ignore: cast_nullable_to_non_nullable
as TeamDeployment?,
  ));
}
/// Create a copy of StudentModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StudentIdentityCopyWith<$Res> get identity {
  
  return $StudentIdentityCopyWith<$Res>(_self.identity, (value) {
    return _then(_self.copyWith(identity: value));
  });
}/// Create a copy of StudentModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StudentProfileCopyWith<$Res> get profile {
  
  return $StudentProfileCopyWith<$Res>(_self.profile, (value) {
    return _then(_self.copyWith(profile: value));
  });
}/// Create a copy of StudentModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StudentMatchingInputsCopyWith<$Res> get inputs {
  
  return $StudentMatchingInputsCopyWith<$Res>(_self.inputs, (value) {
    return _then(_self.copyWith(inputs: value));
  });
}/// Create a copy of StudentModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TeamDeploymentCopyWith<$Res>? get deployment {
    if (_self.deployment == null) {
    return null;
  }

  return $TeamDeploymentCopyWith<$Res>(_self.deployment!, (value) {
    return _then(_self.copyWith(deployment: value));
  });
}
}


/// Adds pattern-matching-related methods to [StudentModel].
extension StudentModelPatterns on StudentModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StudentModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StudentModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StudentModel value)  $default,){
final _that = this;
switch (_that) {
case _StudentModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StudentModel value)?  $default,){
final _that = this;
switch (_that) {
case _StudentModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( StudentIdentity identity,  StudentProfile profile,  StudentMatchingInputs inputs,  TeamDeployment? deployment)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StudentModel() when $default != null:
return $default(_that.identity,_that.profile,_that.inputs,_that.deployment);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( StudentIdentity identity,  StudentProfile profile,  StudentMatchingInputs inputs,  TeamDeployment? deployment)  $default,) {final _that = this;
switch (_that) {
case _StudentModel():
return $default(_that.identity,_that.profile,_that.inputs,_that.deployment);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( StudentIdentity identity,  StudentProfile profile,  StudentMatchingInputs inputs,  TeamDeployment? deployment)?  $default,) {final _that = this;
switch (_that) {
case _StudentModel() when $default != null:
return $default(_that.identity,_that.profile,_that.inputs,_that.deployment);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _StudentModel with DiagnosticableTreeMixin implements StudentModel {
  const _StudentModel({required this.identity, required this.profile, required this.inputs, this.deployment});
  factory _StudentModel.fromJson(Map<String, dynamic> json) => _$StudentModelFromJson(json);

@override final  StudentIdentity identity;
@override final  StudentProfile profile;
@override final  StudentMatchingInputs inputs;
@override final  TeamDeployment? deployment;

/// Create a copy of StudentModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StudentModelCopyWith<_StudentModel> get copyWith => __$StudentModelCopyWithImpl<_StudentModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StudentModelToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'StudentModel'))
    ..add(DiagnosticsProperty('identity', identity))..add(DiagnosticsProperty('profile', profile))..add(DiagnosticsProperty('inputs', inputs))..add(DiagnosticsProperty('deployment', deployment));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StudentModel&&(identical(other.identity, identity) || other.identity == identity)&&(identical(other.profile, profile) || other.profile == profile)&&(identical(other.inputs, inputs) || other.inputs == inputs)&&(identical(other.deployment, deployment) || other.deployment == deployment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,identity,profile,inputs,deployment);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'StudentModel(identity: $identity, profile: $profile, inputs: $inputs, deployment: $deployment)';
}


}

/// @nodoc
abstract mixin class _$StudentModelCopyWith<$Res> implements $StudentModelCopyWith<$Res> {
  factory _$StudentModelCopyWith(_StudentModel value, $Res Function(_StudentModel) _then) = __$StudentModelCopyWithImpl;
@override @useResult
$Res call({
 StudentIdentity identity, StudentProfile profile, StudentMatchingInputs inputs, TeamDeployment? deployment
});


@override $StudentIdentityCopyWith<$Res> get identity;@override $StudentProfileCopyWith<$Res> get profile;@override $StudentMatchingInputsCopyWith<$Res> get inputs;@override $TeamDeploymentCopyWith<$Res>? get deployment;

}
/// @nodoc
class __$StudentModelCopyWithImpl<$Res>
    implements _$StudentModelCopyWith<$Res> {
  __$StudentModelCopyWithImpl(this._self, this._then);

  final _StudentModel _self;
  final $Res Function(_StudentModel) _then;

/// Create a copy of StudentModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? identity = null,Object? profile = null,Object? inputs = null,Object? deployment = freezed,}) {
  return _then(_StudentModel(
identity: null == identity ? _self.identity : identity // ignore: cast_nullable_to_non_nullable
as StudentIdentity,profile: null == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as StudentProfile,inputs: null == inputs ? _self.inputs : inputs // ignore: cast_nullable_to_non_nullable
as StudentMatchingInputs,deployment: freezed == deployment ? _self.deployment : deployment // ignore: cast_nullable_to_non_nullable
as TeamDeployment?,
  ));
}

/// Create a copy of StudentModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StudentIdentityCopyWith<$Res> get identity {
  
  return $StudentIdentityCopyWith<$Res>(_self.identity, (value) {
    return _then(_self.copyWith(identity: value));
  });
}/// Create a copy of StudentModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StudentProfileCopyWith<$Res> get profile {
  
  return $StudentProfileCopyWith<$Res>(_self.profile, (value) {
    return _then(_self.copyWith(profile: value));
  });
}/// Create a copy of StudentModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StudentMatchingInputsCopyWith<$Res> get inputs {
  
  return $StudentMatchingInputsCopyWith<$Res>(_self.inputs, (value) {
    return _then(_self.copyWith(inputs: value));
  });
}/// Create a copy of StudentModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TeamDeploymentCopyWith<$Res>? get deployment {
    if (_self.deployment == null) {
    return null;
  }

  return $TeamDeploymentCopyWith<$Res>(_self.deployment!, (value) {
    return _then(_self.copyWith(deployment: value));
  });
}
}

// dart format on
