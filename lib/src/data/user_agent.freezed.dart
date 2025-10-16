// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_agent.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserAgent {

 UserAgentDevice get device; UserAgentCapabilities get capabilities;
/// Create a copy of UserAgent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserAgentCopyWith<UserAgent> get copyWith => _$UserAgentCopyWithImpl<UserAgent>(this as UserAgent, _$identity);

  /// Serializes this UserAgent to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserAgent&&(identical(other.device, device) || other.device == device)&&(identical(other.capabilities, capabilities) || other.capabilities == capabilities));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,device,capabilities);

@override
String toString() {
  return 'UserAgent(device: $device, capabilities: $capabilities)';
}


}

/// @nodoc
abstract mixin class $UserAgentCopyWith<$Res>  {
  factory $UserAgentCopyWith(UserAgent value, $Res Function(UserAgent) _then) = _$UserAgentCopyWithImpl;
@useResult
$Res call({
 UserAgentDevice device, UserAgentCapabilities capabilities
});


$UserAgentDeviceCopyWith<$Res> get device;$UserAgentCapabilitiesCopyWith<$Res> get capabilities;

}
/// @nodoc
class _$UserAgentCopyWithImpl<$Res>
    implements $UserAgentCopyWith<$Res> {
  _$UserAgentCopyWithImpl(this._self, this._then);

  final UserAgent _self;
  final $Res Function(UserAgent) _then;

/// Create a copy of UserAgent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? device = null,Object? capabilities = null,}) {
  return _then(_self.copyWith(
device: null == device ? _self.device : device // ignore: cast_nullable_to_non_nullable
as UserAgentDevice,capabilities: null == capabilities ? _self.capabilities : capabilities // ignore: cast_nullable_to_non_nullable
as UserAgentCapabilities,
  ));
}
/// Create a copy of UserAgent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserAgentDeviceCopyWith<$Res> get device {
  
  return $UserAgentDeviceCopyWith<$Res>(_self.device, (value) {
    return _then(_self.copyWith(device: value));
  });
}/// Create a copy of UserAgent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserAgentCapabilitiesCopyWith<$Res> get capabilities {
  
  return $UserAgentCapabilitiesCopyWith<$Res>(_self.capabilities, (value) {
    return _then(_self.copyWith(capabilities: value));
  });
}
}


/// Adds pattern-matching-related methods to [UserAgent].
extension UserAgentPatterns on UserAgent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserAgent value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserAgent() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserAgent value)  $default,){
final _that = this;
switch (_that) {
case _UserAgent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserAgent value)?  $default,){
final _that = this;
switch (_that) {
case _UserAgent() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( UserAgentDevice device,  UserAgentCapabilities capabilities)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserAgent() when $default != null:
return $default(_that.device,_that.capabilities);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( UserAgentDevice device,  UserAgentCapabilities capabilities)  $default,) {final _that = this;
switch (_that) {
case _UserAgent():
return $default(_that.device,_that.capabilities);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( UserAgentDevice device,  UserAgentCapabilities capabilities)?  $default,) {final _that = this;
switch (_that) {
case _UserAgent() when $default != null:
return $default(_that.device,_that.capabilities);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserAgent implements UserAgent {
   _UserAgent({required this.device, required this.capabilities});
  factory _UserAgent.fromJson(Map<String, dynamic> json) => _$UserAgentFromJson(json);

@override final  UserAgentDevice device;
@override final  UserAgentCapabilities capabilities;

/// Create a copy of UserAgent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserAgentCopyWith<_UserAgent> get copyWith => __$UserAgentCopyWithImpl<_UserAgent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserAgentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserAgent&&(identical(other.device, device) || other.device == device)&&(identical(other.capabilities, capabilities) || other.capabilities == capabilities));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,device,capabilities);

@override
String toString() {
  return 'UserAgent(device: $device, capabilities: $capabilities)';
}


}

/// @nodoc
abstract mixin class _$UserAgentCopyWith<$Res> implements $UserAgentCopyWith<$Res> {
  factory _$UserAgentCopyWith(_UserAgent value, $Res Function(_UserAgent) _then) = __$UserAgentCopyWithImpl;
@override @useResult
$Res call({
 UserAgentDevice device, UserAgentCapabilities capabilities
});


@override $UserAgentDeviceCopyWith<$Res> get device;@override $UserAgentCapabilitiesCopyWith<$Res> get capabilities;

}
/// @nodoc
class __$UserAgentCopyWithImpl<$Res>
    implements _$UserAgentCopyWith<$Res> {
  __$UserAgentCopyWithImpl(this._self, this._then);

  final _UserAgent _self;
  final $Res Function(_UserAgent) _then;

/// Create a copy of UserAgent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? device = null,Object? capabilities = null,}) {
  return _then(_UserAgent(
device: null == device ? _self.device : device // ignore: cast_nullable_to_non_nullable
as UserAgentDevice,capabilities: null == capabilities ? _self.capabilities : capabilities // ignore: cast_nullable_to_non_nullable
as UserAgentCapabilities,
  ));
}

/// Create a copy of UserAgent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserAgentDeviceCopyWith<$Res> get device {
  
  return $UserAgentDeviceCopyWith<$Res>(_self.device, (value) {
    return _then(_self.copyWith(device: value));
  });
}/// Create a copy of UserAgent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserAgentCapabilitiesCopyWith<$Res> get capabilities {
  
  return $UserAgentCapabilitiesCopyWith<$Res>(_self.capabilities, (value) {
    return _then(_self.copyWith(capabilities: value));
  });
}
}


/// @nodoc
mixin _$UserAgentDevice {

@JsonKey(unknownEnumValue: OpenAiDeviceType.unknown) OpenAiDeviceType get type;
/// Create a copy of UserAgentDevice
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserAgentDeviceCopyWith<UserAgentDevice> get copyWith => _$UserAgentDeviceCopyWithImpl<UserAgentDevice>(this as UserAgentDevice, _$identity);

  /// Serializes this UserAgentDevice to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserAgentDevice&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type);

@override
String toString() {
  return 'UserAgentDevice(type: $type)';
}


}

/// @nodoc
abstract mixin class $UserAgentDeviceCopyWith<$Res>  {
  factory $UserAgentDeviceCopyWith(UserAgentDevice value, $Res Function(UserAgentDevice) _then) = _$UserAgentDeviceCopyWithImpl;
@useResult
$Res call({
@JsonKey(unknownEnumValue: OpenAiDeviceType.unknown) OpenAiDeviceType type
});




}
/// @nodoc
class _$UserAgentDeviceCopyWithImpl<$Res>
    implements $UserAgentDeviceCopyWith<$Res> {
  _$UserAgentDeviceCopyWithImpl(this._self, this._then);

  final UserAgentDevice _self;
  final $Res Function(UserAgentDevice) _then;

/// Create a copy of UserAgentDevice
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as OpenAiDeviceType,
  ));
}

}


/// Adds pattern-matching-related methods to [UserAgentDevice].
extension UserAgentDevicePatterns on UserAgentDevice {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserAgentDevice value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserAgentDevice() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserAgentDevice value)  $default,){
final _that = this;
switch (_that) {
case _UserAgentDevice():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserAgentDevice value)?  $default,){
final _that = this;
switch (_that) {
case _UserAgentDevice() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(unknownEnumValue: OpenAiDeviceType.unknown)  OpenAiDeviceType type)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserAgentDevice() when $default != null:
return $default(_that.type);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(unknownEnumValue: OpenAiDeviceType.unknown)  OpenAiDeviceType type)  $default,) {final _that = this;
switch (_that) {
case _UserAgentDevice():
return $default(_that.type);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(unknownEnumValue: OpenAiDeviceType.unknown)  OpenAiDeviceType type)?  $default,) {final _that = this;
switch (_that) {
case _UserAgentDevice() when $default != null:
return $default(_that.type);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserAgentDevice implements UserAgentDevice {
   _UserAgentDevice({@JsonKey(unknownEnumValue: OpenAiDeviceType.unknown) required this.type});
  factory _UserAgentDevice.fromJson(Map<String, dynamic> json) => _$UserAgentDeviceFromJson(json);

@override@JsonKey(unknownEnumValue: OpenAiDeviceType.unknown) final  OpenAiDeviceType type;

/// Create a copy of UserAgentDevice
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserAgentDeviceCopyWith<_UserAgentDevice> get copyWith => __$UserAgentDeviceCopyWithImpl<_UserAgentDevice>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserAgentDeviceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserAgentDevice&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type);

@override
String toString() {
  return 'UserAgentDevice(type: $type)';
}


}

/// @nodoc
abstract mixin class _$UserAgentDeviceCopyWith<$Res> implements $UserAgentDeviceCopyWith<$Res> {
  factory _$UserAgentDeviceCopyWith(_UserAgentDevice value, $Res Function(_UserAgentDevice) _then) = __$UserAgentDeviceCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(unknownEnumValue: OpenAiDeviceType.unknown) OpenAiDeviceType type
});




}
/// @nodoc
class __$UserAgentDeviceCopyWithImpl<$Res>
    implements _$UserAgentDeviceCopyWith<$Res> {
  __$UserAgentDeviceCopyWithImpl(this._self, this._then);

  final _UserAgentDevice _self;
  final $Res Function(_UserAgentDevice) _then;

/// Create a copy of UserAgentDevice
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,}) {
  return _then(_UserAgentDevice(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as OpenAiDeviceType,
  ));
}


}


/// @nodoc
mixin _$UserAgentCapabilities {

 bool get hover; bool get touch;
/// Create a copy of UserAgentCapabilities
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserAgentCapabilitiesCopyWith<UserAgentCapabilities> get copyWith => _$UserAgentCapabilitiesCopyWithImpl<UserAgentCapabilities>(this as UserAgentCapabilities, _$identity);

  /// Serializes this UserAgentCapabilities to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserAgentCapabilities&&(identical(other.hover, hover) || other.hover == hover)&&(identical(other.touch, touch) || other.touch == touch));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,hover,touch);

@override
String toString() {
  return 'UserAgentCapabilities(hover: $hover, touch: $touch)';
}


}

/// @nodoc
abstract mixin class $UserAgentCapabilitiesCopyWith<$Res>  {
  factory $UserAgentCapabilitiesCopyWith(UserAgentCapabilities value, $Res Function(UserAgentCapabilities) _then) = _$UserAgentCapabilitiesCopyWithImpl;
@useResult
$Res call({
 bool hover, bool touch
});




}
/// @nodoc
class _$UserAgentCapabilitiesCopyWithImpl<$Res>
    implements $UserAgentCapabilitiesCopyWith<$Res> {
  _$UserAgentCapabilitiesCopyWithImpl(this._self, this._then);

  final UserAgentCapabilities _self;
  final $Res Function(UserAgentCapabilities) _then;

/// Create a copy of UserAgentCapabilities
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? hover = null,Object? touch = null,}) {
  return _then(_self.copyWith(
hover: null == hover ? _self.hover : hover // ignore: cast_nullable_to_non_nullable
as bool,touch: null == touch ? _self.touch : touch // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [UserAgentCapabilities].
extension UserAgentCapabilitiesPatterns on UserAgentCapabilities {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserAgentCapabilities value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserAgentCapabilities() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserAgentCapabilities value)  $default,){
final _that = this;
switch (_that) {
case _UserAgentCapabilities():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserAgentCapabilities value)?  $default,){
final _that = this;
switch (_that) {
case _UserAgentCapabilities() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool hover,  bool touch)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserAgentCapabilities() when $default != null:
return $default(_that.hover,_that.touch);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool hover,  bool touch)  $default,) {final _that = this;
switch (_that) {
case _UserAgentCapabilities():
return $default(_that.hover,_that.touch);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool hover,  bool touch)?  $default,) {final _that = this;
switch (_that) {
case _UserAgentCapabilities() when $default != null:
return $default(_that.hover,_that.touch);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserAgentCapabilities implements UserAgentCapabilities {
   _UserAgentCapabilities({required this.hover, required this.touch});
  factory _UserAgentCapabilities.fromJson(Map<String, dynamic> json) => _$UserAgentCapabilitiesFromJson(json);

@override final  bool hover;
@override final  bool touch;

/// Create a copy of UserAgentCapabilities
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserAgentCapabilitiesCopyWith<_UserAgentCapabilities> get copyWith => __$UserAgentCapabilitiesCopyWithImpl<_UserAgentCapabilities>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserAgentCapabilitiesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserAgentCapabilities&&(identical(other.hover, hover) || other.hover == hover)&&(identical(other.touch, touch) || other.touch == touch));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,hover,touch);

@override
String toString() {
  return 'UserAgentCapabilities(hover: $hover, touch: $touch)';
}


}

/// @nodoc
abstract mixin class _$UserAgentCapabilitiesCopyWith<$Res> implements $UserAgentCapabilitiesCopyWith<$Res> {
  factory _$UserAgentCapabilitiesCopyWith(_UserAgentCapabilities value, $Res Function(_UserAgentCapabilities) _then) = __$UserAgentCapabilitiesCopyWithImpl;
@override @useResult
$Res call({
 bool hover, bool touch
});




}
/// @nodoc
class __$UserAgentCapabilitiesCopyWithImpl<$Res>
    implements _$UserAgentCapabilitiesCopyWith<$Res> {
  __$UserAgentCapabilitiesCopyWithImpl(this._self, this._then);

  final _UserAgentCapabilities _self;
  final $Res Function(_UserAgentCapabilities) _then;

/// Create a copy of UserAgentCapabilities
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? hover = null,Object? touch = null,}) {
  return _then(_UserAgentCapabilities(
hover: null == hover ? _self.hover : hover // ignore: cast_nullable_to_non_nullable
as bool,touch: null == touch ? _self.touch : touch // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
