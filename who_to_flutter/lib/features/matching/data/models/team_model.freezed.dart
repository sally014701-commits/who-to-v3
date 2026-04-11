// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'team_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TeamIdentity implements DiagnosticableTreeMixin {

 String get id; String get name;
/// Create a copy of TeamIdentity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TeamIdentityCopyWith<TeamIdentity> get copyWith => _$TeamIdentityCopyWithImpl<TeamIdentity>(this as TeamIdentity, _$identity);

  /// Serializes this TeamIdentity to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'TeamIdentity'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('name', name));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TeamIdentity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'TeamIdentity(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class $TeamIdentityCopyWith<$Res>  {
  factory $TeamIdentityCopyWith(TeamIdentity value, $Res Function(TeamIdentity) _then) = _$TeamIdentityCopyWithImpl;
@useResult
$Res call({
 String id, String name
});




}
/// @nodoc
class _$TeamIdentityCopyWithImpl<$Res>
    implements $TeamIdentityCopyWith<$Res> {
  _$TeamIdentityCopyWithImpl(this._self, this._then);

  final TeamIdentity _self;
  final $Res Function(TeamIdentity) _then;

/// Create a copy of TeamIdentity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TeamIdentity].
extension TeamIdentityPatterns on TeamIdentity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TeamIdentity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TeamIdentity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TeamIdentity value)  $default,){
final _that = this;
switch (_that) {
case _TeamIdentity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TeamIdentity value)?  $default,){
final _that = this;
switch (_that) {
case _TeamIdentity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TeamIdentity() when $default != null:
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name)  $default,) {final _that = this;
switch (_that) {
case _TeamIdentity():
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name)?  $default,) {final _that = this;
switch (_that) {
case _TeamIdentity() when $default != null:
return $default(_that.id,_that.name);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _TeamIdentity with DiagnosticableTreeMixin implements TeamIdentity {
  const _TeamIdentity({required this.id, required this.name});
  factory _TeamIdentity.fromJson(Map<String, dynamic> json) => _$TeamIdentityFromJson(json);

@override final  String id;
@override final  String name;

/// Create a copy of TeamIdentity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TeamIdentityCopyWith<_TeamIdentity> get copyWith => __$TeamIdentityCopyWithImpl<_TeamIdentity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TeamIdentityToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'TeamIdentity'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('name', name));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TeamIdentity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'TeamIdentity(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$TeamIdentityCopyWith<$Res> implements $TeamIdentityCopyWith<$Res> {
  factory _$TeamIdentityCopyWith(_TeamIdentity value, $Res Function(_TeamIdentity) _then) = __$TeamIdentityCopyWithImpl;
@override @useResult
$Res call({
 String id, String name
});




}
/// @nodoc
class __$TeamIdentityCopyWithImpl<$Res>
    implements _$TeamIdentityCopyWith<$Res> {
  __$TeamIdentityCopyWithImpl(this._self, this._then);

  final _TeamIdentity _self;
  final $Res Function(_TeamIdentity) _then;

/// Create a copy of TeamIdentity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,}) {
  return _then(_TeamIdentity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$MatchingResults implements DiagnosticableTreeMixin {

 double get cohesionScore; List<String> get memberIds;
/// Create a copy of MatchingResults
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MatchingResultsCopyWith<MatchingResults> get copyWith => _$MatchingResultsCopyWithImpl<MatchingResults>(this as MatchingResults, _$identity);

  /// Serializes this MatchingResults to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'MatchingResults'))
    ..add(DiagnosticsProperty('cohesionScore', cohesionScore))..add(DiagnosticsProperty('memberIds', memberIds));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatchingResults&&(identical(other.cohesionScore, cohesionScore) || other.cohesionScore == cohesionScore)&&const DeepCollectionEquality().equals(other.memberIds, memberIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,cohesionScore,const DeepCollectionEquality().hash(memberIds));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'MatchingResults(cohesionScore: $cohesionScore, memberIds: $memberIds)';
}


}

/// @nodoc
abstract mixin class $MatchingResultsCopyWith<$Res>  {
  factory $MatchingResultsCopyWith(MatchingResults value, $Res Function(MatchingResults) _then) = _$MatchingResultsCopyWithImpl;
@useResult
$Res call({
 double cohesionScore, List<String> memberIds
});




}
/// @nodoc
class _$MatchingResultsCopyWithImpl<$Res>
    implements $MatchingResultsCopyWith<$Res> {
  _$MatchingResultsCopyWithImpl(this._self, this._then);

  final MatchingResults _self;
  final $Res Function(MatchingResults) _then;

/// Create a copy of MatchingResults
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cohesionScore = null,Object? memberIds = null,}) {
  return _then(_self.copyWith(
cohesionScore: null == cohesionScore ? _self.cohesionScore : cohesionScore // ignore: cast_nullable_to_non_nullable
as double,memberIds: null == memberIds ? _self.memberIds : memberIds // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [MatchingResults].
extension MatchingResultsPatterns on MatchingResults {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MatchingResults value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MatchingResults() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MatchingResults value)  $default,){
final _that = this;
switch (_that) {
case _MatchingResults():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MatchingResults value)?  $default,){
final _that = this;
switch (_that) {
case _MatchingResults() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double cohesionScore,  List<String> memberIds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MatchingResults() when $default != null:
return $default(_that.cohesionScore,_that.memberIds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double cohesionScore,  List<String> memberIds)  $default,) {final _that = this;
switch (_that) {
case _MatchingResults():
return $default(_that.cohesionScore,_that.memberIds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double cohesionScore,  List<String> memberIds)?  $default,) {final _that = this;
switch (_that) {
case _MatchingResults() when $default != null:
return $default(_that.cohesionScore,_that.memberIds);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _MatchingResults with DiagnosticableTreeMixin implements MatchingResults {
  const _MatchingResults({this.cohesionScore = 0.0, final  List<String> memberIds = const []}): _memberIds = memberIds;
  factory _MatchingResults.fromJson(Map<String, dynamic> json) => _$MatchingResultsFromJson(json);

@override@JsonKey() final  double cohesionScore;
 final  List<String> _memberIds;
@override@JsonKey() List<String> get memberIds {
  if (_memberIds is EqualUnmodifiableListView) return _memberIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_memberIds);
}


/// Create a copy of MatchingResults
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MatchingResultsCopyWith<_MatchingResults> get copyWith => __$MatchingResultsCopyWithImpl<_MatchingResults>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MatchingResultsToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'MatchingResults'))
    ..add(DiagnosticsProperty('cohesionScore', cohesionScore))..add(DiagnosticsProperty('memberIds', memberIds));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MatchingResults&&(identical(other.cohesionScore, cohesionScore) || other.cohesionScore == cohesionScore)&&const DeepCollectionEquality().equals(other._memberIds, _memberIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,cohesionScore,const DeepCollectionEquality().hash(_memberIds));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'MatchingResults(cohesionScore: $cohesionScore, memberIds: $memberIds)';
}


}

/// @nodoc
abstract mixin class _$MatchingResultsCopyWith<$Res> implements $MatchingResultsCopyWith<$Res> {
  factory _$MatchingResultsCopyWith(_MatchingResults value, $Res Function(_MatchingResults) _then) = __$MatchingResultsCopyWithImpl;
@override @useResult
$Res call({
 double cohesionScore, List<String> memberIds
});




}
/// @nodoc
class __$MatchingResultsCopyWithImpl<$Res>
    implements _$MatchingResultsCopyWith<$Res> {
  __$MatchingResultsCopyWithImpl(this._self, this._then);

  final _MatchingResults _self;
  final $Res Function(_MatchingResults) _then;

/// Create a copy of MatchingResults
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cohesionScore = null,Object? memberIds = null,}) {
  return _then(_MatchingResults(
cohesionScore: null == cohesionScore ? _self.cohesionScore : cohesionScore // ignore: cast_nullable_to_non_nullable
as double,memberIds: null == memberIds ? _self._memberIds : memberIds // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}


/// @nodoc
mixin _$TeamModel implements DiagnosticableTreeMixin {

 TeamIdentity get identity; MatchingResults get results;
/// Create a copy of TeamModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TeamModelCopyWith<TeamModel> get copyWith => _$TeamModelCopyWithImpl<TeamModel>(this as TeamModel, _$identity);

  /// Serializes this TeamModel to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'TeamModel'))
    ..add(DiagnosticsProperty('identity', identity))..add(DiagnosticsProperty('results', results));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TeamModel&&(identical(other.identity, identity) || other.identity == identity)&&(identical(other.results, results) || other.results == results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,identity,results);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'TeamModel(identity: $identity, results: $results)';
}


}

/// @nodoc
abstract mixin class $TeamModelCopyWith<$Res>  {
  factory $TeamModelCopyWith(TeamModel value, $Res Function(TeamModel) _then) = _$TeamModelCopyWithImpl;
@useResult
$Res call({
 TeamIdentity identity, MatchingResults results
});


$TeamIdentityCopyWith<$Res> get identity;$MatchingResultsCopyWith<$Res> get results;

}
/// @nodoc
class _$TeamModelCopyWithImpl<$Res>
    implements $TeamModelCopyWith<$Res> {
  _$TeamModelCopyWithImpl(this._self, this._then);

  final TeamModel _self;
  final $Res Function(TeamModel) _then;

/// Create a copy of TeamModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? identity = null,Object? results = null,}) {
  return _then(_self.copyWith(
identity: null == identity ? _self.identity : identity // ignore: cast_nullable_to_non_nullable
as TeamIdentity,results: null == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as MatchingResults,
  ));
}
/// Create a copy of TeamModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TeamIdentityCopyWith<$Res> get identity {
  
  return $TeamIdentityCopyWith<$Res>(_self.identity, (value) {
    return _then(_self.copyWith(identity: value));
  });
}/// Create a copy of TeamModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MatchingResultsCopyWith<$Res> get results {
  
  return $MatchingResultsCopyWith<$Res>(_self.results, (value) {
    return _then(_self.copyWith(results: value));
  });
}
}


/// Adds pattern-matching-related methods to [TeamModel].
extension TeamModelPatterns on TeamModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TeamModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TeamModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TeamModel value)  $default,){
final _that = this;
switch (_that) {
case _TeamModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TeamModel value)?  $default,){
final _that = this;
switch (_that) {
case _TeamModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TeamIdentity identity,  MatchingResults results)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TeamModel() when $default != null:
return $default(_that.identity,_that.results);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TeamIdentity identity,  MatchingResults results)  $default,) {final _that = this;
switch (_that) {
case _TeamModel():
return $default(_that.identity,_that.results);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TeamIdentity identity,  MatchingResults results)?  $default,) {final _that = this;
switch (_that) {
case _TeamModel() when $default != null:
return $default(_that.identity,_that.results);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _TeamModel with DiagnosticableTreeMixin implements TeamModel {
  const _TeamModel({required this.identity, required this.results});
  factory _TeamModel.fromJson(Map<String, dynamic> json) => _$TeamModelFromJson(json);

@override final  TeamIdentity identity;
@override final  MatchingResults results;

/// Create a copy of TeamModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TeamModelCopyWith<_TeamModel> get copyWith => __$TeamModelCopyWithImpl<_TeamModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TeamModelToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'TeamModel'))
    ..add(DiagnosticsProperty('identity', identity))..add(DiagnosticsProperty('results', results));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TeamModel&&(identical(other.identity, identity) || other.identity == identity)&&(identical(other.results, results) || other.results == results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,identity,results);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'TeamModel(identity: $identity, results: $results)';
}


}

/// @nodoc
abstract mixin class _$TeamModelCopyWith<$Res> implements $TeamModelCopyWith<$Res> {
  factory _$TeamModelCopyWith(_TeamModel value, $Res Function(_TeamModel) _then) = __$TeamModelCopyWithImpl;
@override @useResult
$Res call({
 TeamIdentity identity, MatchingResults results
});


@override $TeamIdentityCopyWith<$Res> get identity;@override $MatchingResultsCopyWith<$Res> get results;

}
/// @nodoc
class __$TeamModelCopyWithImpl<$Res>
    implements _$TeamModelCopyWith<$Res> {
  __$TeamModelCopyWithImpl(this._self, this._then);

  final _TeamModel _self;
  final $Res Function(_TeamModel) _then;

/// Create a copy of TeamModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? identity = null,Object? results = null,}) {
  return _then(_TeamModel(
identity: null == identity ? _self.identity : identity // ignore: cast_nullable_to_non_nullable
as TeamIdentity,results: null == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as MatchingResults,
  ));
}

/// Create a copy of TeamModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TeamIdentityCopyWith<$Res> get identity {
  
  return $TeamIdentityCopyWith<$Res>(_self.identity, (value) {
    return _then(_self.copyWith(identity: value));
  });
}/// Create a copy of TeamModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MatchingResultsCopyWith<$Res> get results {
  
  return $MatchingResultsCopyWith<$Res>(_self.results, (value) {
    return _then(_self.copyWith(results: value));
  });
}
}

// dart format on
