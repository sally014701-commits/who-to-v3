// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'matching_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MatchingConfig implements DiagnosticableTreeMixin {

 int get teamSize; List<String> get selectedParams; Map<String, int> get weights;
/// Create a copy of MatchingConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MatchingConfigCopyWith<MatchingConfig> get copyWith => _$MatchingConfigCopyWithImpl<MatchingConfig>(this as MatchingConfig, _$identity);

  /// Serializes this MatchingConfig to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'MatchingConfig'))
    ..add(DiagnosticsProperty('teamSize', teamSize))..add(DiagnosticsProperty('selectedParams', selectedParams))..add(DiagnosticsProperty('weights', weights));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatchingConfig&&(identical(other.teamSize, teamSize) || other.teamSize == teamSize)&&const DeepCollectionEquality().equals(other.selectedParams, selectedParams)&&const DeepCollectionEquality().equals(other.weights, weights));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,teamSize,const DeepCollectionEquality().hash(selectedParams),const DeepCollectionEquality().hash(weights));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'MatchingConfig(teamSize: $teamSize, selectedParams: $selectedParams, weights: $weights)';
}


}

/// @nodoc
abstract mixin class $MatchingConfigCopyWith<$Res>  {
  factory $MatchingConfigCopyWith(MatchingConfig value, $Res Function(MatchingConfig) _then) = _$MatchingConfigCopyWithImpl;
@useResult
$Res call({
 int teamSize, List<String> selectedParams, Map<String, int> weights
});




}
/// @nodoc
class _$MatchingConfigCopyWithImpl<$Res>
    implements $MatchingConfigCopyWith<$Res> {
  _$MatchingConfigCopyWithImpl(this._self, this._then);

  final MatchingConfig _self;
  final $Res Function(MatchingConfig) _then;

/// Create a copy of MatchingConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? teamSize = null,Object? selectedParams = null,Object? weights = null,}) {
  return _then(_self.copyWith(
teamSize: null == teamSize ? _self.teamSize : teamSize // ignore: cast_nullable_to_non_nullable
as int,selectedParams: null == selectedParams ? _self.selectedParams : selectedParams // ignore: cast_nullable_to_non_nullable
as List<String>,weights: null == weights ? _self.weights : weights // ignore: cast_nullable_to_non_nullable
as Map<String, int>,
  ));
}

}


/// Adds pattern-matching-related methods to [MatchingConfig].
extension MatchingConfigPatterns on MatchingConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MatchingConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MatchingConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MatchingConfig value)  $default,){
final _that = this;
switch (_that) {
case _MatchingConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MatchingConfig value)?  $default,){
final _that = this;
switch (_that) {
case _MatchingConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int teamSize,  List<String> selectedParams,  Map<String, int> weights)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MatchingConfig() when $default != null:
return $default(_that.teamSize,_that.selectedParams,_that.weights);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int teamSize,  List<String> selectedParams,  Map<String, int> weights)  $default,) {final _that = this;
switch (_that) {
case _MatchingConfig():
return $default(_that.teamSize,_that.selectedParams,_that.weights);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int teamSize,  List<String> selectedParams,  Map<String, int> weights)?  $default,) {final _that = this;
switch (_that) {
case _MatchingConfig() when $default != null:
return $default(_that.teamSize,_that.selectedParams,_that.weights);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _MatchingConfig with DiagnosticableTreeMixin implements MatchingConfig {
  const _MatchingConfig({this.teamSize = 4, final  List<String> selectedParams = const [], final  Map<String, int> weights = const {}}): _selectedParams = selectedParams,_weights = weights;
  factory _MatchingConfig.fromJson(Map<String, dynamic> json) => _$MatchingConfigFromJson(json);

@override@JsonKey() final  int teamSize;
 final  List<String> _selectedParams;
@override@JsonKey() List<String> get selectedParams {
  if (_selectedParams is EqualUnmodifiableListView) return _selectedParams;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_selectedParams);
}

 final  Map<String, int> _weights;
@override@JsonKey() Map<String, int> get weights {
  if (_weights is EqualUnmodifiableMapView) return _weights;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_weights);
}


/// Create a copy of MatchingConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MatchingConfigCopyWith<_MatchingConfig> get copyWith => __$MatchingConfigCopyWithImpl<_MatchingConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MatchingConfigToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'MatchingConfig'))
    ..add(DiagnosticsProperty('teamSize', teamSize))..add(DiagnosticsProperty('selectedParams', selectedParams))..add(DiagnosticsProperty('weights', weights));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MatchingConfig&&(identical(other.teamSize, teamSize) || other.teamSize == teamSize)&&const DeepCollectionEquality().equals(other._selectedParams, _selectedParams)&&const DeepCollectionEquality().equals(other._weights, _weights));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,teamSize,const DeepCollectionEquality().hash(_selectedParams),const DeepCollectionEquality().hash(_weights));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'MatchingConfig(teamSize: $teamSize, selectedParams: $selectedParams, weights: $weights)';
}


}

/// @nodoc
abstract mixin class _$MatchingConfigCopyWith<$Res> implements $MatchingConfigCopyWith<$Res> {
  factory _$MatchingConfigCopyWith(_MatchingConfig value, $Res Function(_MatchingConfig) _then) = __$MatchingConfigCopyWithImpl;
@override @useResult
$Res call({
 int teamSize, List<String> selectedParams, Map<String, int> weights
});




}
/// @nodoc
class __$MatchingConfigCopyWithImpl<$Res>
    implements _$MatchingConfigCopyWith<$Res> {
  __$MatchingConfigCopyWithImpl(this._self, this._then);

  final _MatchingConfig _self;
  final $Res Function(_MatchingConfig) _then;

/// Create a copy of MatchingConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? teamSize = null,Object? selectedParams = null,Object? weights = null,}) {
  return _then(_MatchingConfig(
teamSize: null == teamSize ? _self.teamSize : teamSize // ignore: cast_nullable_to_non_nullable
as int,selectedParams: null == selectedParams ? _self._selectedParams : selectedParams // ignore: cast_nullable_to_non_nullable
as List<String>,weights: null == weights ? _self._weights : weights // ignore: cast_nullable_to_non_nullable
as Map<String, int>,
  ));
}


}

// dart format on
