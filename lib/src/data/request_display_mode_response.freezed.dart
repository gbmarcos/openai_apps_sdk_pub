// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'request_display_mode_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RequestDisplayModeResponse {

 OpenAiDisplayMode get mode;
/// Create a copy of RequestDisplayModeResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RequestDisplayModeResponseCopyWith<RequestDisplayModeResponse> get copyWith => _$RequestDisplayModeResponseCopyWithImpl<RequestDisplayModeResponse>(this as RequestDisplayModeResponse, _$identity);

  /// Serializes this RequestDisplayModeResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RequestDisplayModeResponse&&(identical(other.mode, mode) || other.mode == mode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,mode);

@override
String toString() {
  return 'RequestDisplayModeResponse(mode: $mode)';
}


}

/// @nodoc
abstract mixin class $RequestDisplayModeResponseCopyWith<$Res>  {
  factory $RequestDisplayModeResponseCopyWith(RequestDisplayModeResponse value, $Res Function(RequestDisplayModeResponse) _then) = _$RequestDisplayModeResponseCopyWithImpl;
@useResult
$Res call({
 OpenAiDisplayMode mode
});




}
/// @nodoc
class _$RequestDisplayModeResponseCopyWithImpl<$Res>
    implements $RequestDisplayModeResponseCopyWith<$Res> {
  _$RequestDisplayModeResponseCopyWithImpl(this._self, this._then);

  final RequestDisplayModeResponse _self;
  final $Res Function(RequestDisplayModeResponse) _then;

/// Create a copy of RequestDisplayModeResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? mode = null,}) {
  return _then(_self.copyWith(
mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as OpenAiDisplayMode,
  ));
}

}


/// Adds pattern-matching-related methods to [RequestDisplayModeResponse].
extension RequestDisplayModeResponsePatterns on RequestDisplayModeResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RequestDisplayModeResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RequestDisplayModeResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RequestDisplayModeResponse value)  $default,){
final _that = this;
switch (_that) {
case _RequestDisplayModeResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RequestDisplayModeResponse value)?  $default,){
final _that = this;
switch (_that) {
case _RequestDisplayModeResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( OpenAiDisplayMode mode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RequestDisplayModeResponse() when $default != null:
return $default(_that.mode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( OpenAiDisplayMode mode)  $default,) {final _that = this;
switch (_that) {
case _RequestDisplayModeResponse():
return $default(_that.mode);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( OpenAiDisplayMode mode)?  $default,) {final _that = this;
switch (_that) {
case _RequestDisplayModeResponse() when $default != null:
return $default(_that.mode);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RequestDisplayModeResponse implements RequestDisplayModeResponse {
   _RequestDisplayModeResponse({required this.mode});
  factory _RequestDisplayModeResponse.fromJson(Map<String, dynamic> json) => _$RequestDisplayModeResponseFromJson(json);

@override final  OpenAiDisplayMode mode;

/// Create a copy of RequestDisplayModeResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RequestDisplayModeResponseCopyWith<_RequestDisplayModeResponse> get copyWith => __$RequestDisplayModeResponseCopyWithImpl<_RequestDisplayModeResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RequestDisplayModeResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RequestDisplayModeResponse&&(identical(other.mode, mode) || other.mode == mode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,mode);

@override
String toString() {
  return 'RequestDisplayModeResponse(mode: $mode)';
}


}

/// @nodoc
abstract mixin class _$RequestDisplayModeResponseCopyWith<$Res> implements $RequestDisplayModeResponseCopyWith<$Res> {
  factory _$RequestDisplayModeResponseCopyWith(_RequestDisplayModeResponse value, $Res Function(_RequestDisplayModeResponse) _then) = __$RequestDisplayModeResponseCopyWithImpl;
@override @useResult
$Res call({
 OpenAiDisplayMode mode
});




}
/// @nodoc
class __$RequestDisplayModeResponseCopyWithImpl<$Res>
    implements _$RequestDisplayModeResponseCopyWith<$Res> {
  __$RequestDisplayModeResponseCopyWithImpl(this._self, this._then);

  final _RequestDisplayModeResponse _self;
  final $Res Function(_RequestDisplayModeResponse) _then;

/// Create a copy of RequestDisplayModeResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? mode = null,}) {
  return _then(_RequestDisplayModeResponse(
mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as OpenAiDisplayMode,
  ));
}


}


/// @nodoc
mixin _$RequestDisplayModeArgs {

@JsonKey(unknownEnumValue: OpenAiDisplayMode.unknown) OpenAiDisplayMode get mode;
/// Create a copy of RequestDisplayModeArgs
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RequestDisplayModeArgsCopyWith<RequestDisplayModeArgs> get copyWith => _$RequestDisplayModeArgsCopyWithImpl<RequestDisplayModeArgs>(this as RequestDisplayModeArgs, _$identity);

  /// Serializes this RequestDisplayModeArgs to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RequestDisplayModeArgs&&(identical(other.mode, mode) || other.mode == mode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,mode);

@override
String toString() {
  return 'RequestDisplayModeArgs(mode: $mode)';
}


}

/// @nodoc
abstract mixin class $RequestDisplayModeArgsCopyWith<$Res>  {
  factory $RequestDisplayModeArgsCopyWith(RequestDisplayModeArgs value, $Res Function(RequestDisplayModeArgs) _then) = _$RequestDisplayModeArgsCopyWithImpl;
@useResult
$Res call({
@JsonKey(unknownEnumValue: OpenAiDisplayMode.unknown) OpenAiDisplayMode mode
});




}
/// @nodoc
class _$RequestDisplayModeArgsCopyWithImpl<$Res>
    implements $RequestDisplayModeArgsCopyWith<$Res> {
  _$RequestDisplayModeArgsCopyWithImpl(this._self, this._then);

  final RequestDisplayModeArgs _self;
  final $Res Function(RequestDisplayModeArgs) _then;

/// Create a copy of RequestDisplayModeArgs
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? mode = null,}) {
  return _then(_self.copyWith(
mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as OpenAiDisplayMode,
  ));
}

}


/// Adds pattern-matching-related methods to [RequestDisplayModeArgs].
extension RequestDisplayModeArgsPatterns on RequestDisplayModeArgs {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RequestDisplayModeArgs value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RequestDisplayModeArgs() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RequestDisplayModeArgs value)  $default,){
final _that = this;
switch (_that) {
case _RequestDisplayModeArgs():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RequestDisplayModeArgs value)?  $default,){
final _that = this;
switch (_that) {
case _RequestDisplayModeArgs() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(unknownEnumValue: OpenAiDisplayMode.unknown)  OpenAiDisplayMode mode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RequestDisplayModeArgs() when $default != null:
return $default(_that.mode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(unknownEnumValue: OpenAiDisplayMode.unknown)  OpenAiDisplayMode mode)  $default,) {final _that = this;
switch (_that) {
case _RequestDisplayModeArgs():
return $default(_that.mode);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(unknownEnumValue: OpenAiDisplayMode.unknown)  OpenAiDisplayMode mode)?  $default,) {final _that = this;
switch (_that) {
case _RequestDisplayModeArgs() when $default != null:
return $default(_that.mode);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RequestDisplayModeArgs implements RequestDisplayModeArgs {
   _RequestDisplayModeArgs({@JsonKey(unknownEnumValue: OpenAiDisplayMode.unknown) required this.mode});
  factory _RequestDisplayModeArgs.fromJson(Map<String, dynamic> json) => _$RequestDisplayModeArgsFromJson(json);

@override@JsonKey(unknownEnumValue: OpenAiDisplayMode.unknown) final  OpenAiDisplayMode mode;

/// Create a copy of RequestDisplayModeArgs
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RequestDisplayModeArgsCopyWith<_RequestDisplayModeArgs> get copyWith => __$RequestDisplayModeArgsCopyWithImpl<_RequestDisplayModeArgs>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RequestDisplayModeArgsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RequestDisplayModeArgs&&(identical(other.mode, mode) || other.mode == mode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,mode);

@override
String toString() {
  return 'RequestDisplayModeArgs(mode: $mode)';
}


}

/// @nodoc
abstract mixin class _$RequestDisplayModeArgsCopyWith<$Res> implements $RequestDisplayModeArgsCopyWith<$Res> {
  factory _$RequestDisplayModeArgsCopyWith(_RequestDisplayModeArgs value, $Res Function(_RequestDisplayModeArgs) _then) = __$RequestDisplayModeArgsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(unknownEnumValue: OpenAiDisplayMode.unknown) OpenAiDisplayMode mode
});




}
/// @nodoc
class __$RequestDisplayModeArgsCopyWithImpl<$Res>
    implements _$RequestDisplayModeArgsCopyWith<$Res> {
  __$RequestDisplayModeArgsCopyWithImpl(this._self, this._then);

  final _RequestDisplayModeArgs _self;
  final $Res Function(_RequestDisplayModeArgs) _then;

/// Create a copy of RequestDisplayModeArgs
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? mode = null,}) {
  return _then(_RequestDisplayModeArgs(
mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as OpenAiDisplayMode,
  ));
}


}

// dart format on
