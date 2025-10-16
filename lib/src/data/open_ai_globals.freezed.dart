// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'open_ai_globals.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OpenAiGlobals {

@JsonKey(unknownEnumValue: OpenAiTheme.unknown) OpenAiTheme? get theme; UserAgent? get userAgent; String? get locale; double? get maxHeight; OpenAiDisplayMode? get displayMode; OpenAiSafeArea? get safeArea;
/// Create a copy of OpenAiGlobals
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OpenAiGlobalsCopyWith<OpenAiGlobals> get copyWith => _$OpenAiGlobalsCopyWithImpl<OpenAiGlobals>(this as OpenAiGlobals, _$identity);

  /// Serializes this OpenAiGlobals to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OpenAiGlobals&&(identical(other.theme, theme) || other.theme == theme)&&(identical(other.userAgent, userAgent) || other.userAgent == userAgent)&&(identical(other.locale, locale) || other.locale == locale)&&(identical(other.maxHeight, maxHeight) || other.maxHeight == maxHeight)&&(identical(other.displayMode, displayMode) || other.displayMode == displayMode)&&(identical(other.safeArea, safeArea) || other.safeArea == safeArea));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,theme,userAgent,locale,maxHeight,displayMode,safeArea);

@override
String toString() {
  return 'OpenAiGlobals(theme: $theme, userAgent: $userAgent, locale: $locale, maxHeight: $maxHeight, displayMode: $displayMode, safeArea: $safeArea)';
}


}

/// @nodoc
abstract mixin class $OpenAiGlobalsCopyWith<$Res>  {
  factory $OpenAiGlobalsCopyWith(OpenAiGlobals value, $Res Function(OpenAiGlobals) _then) = _$OpenAiGlobalsCopyWithImpl;
@useResult
$Res call({
@JsonKey(unknownEnumValue: OpenAiTheme.unknown) OpenAiTheme? theme, UserAgent? userAgent, String? locale, double? maxHeight, OpenAiDisplayMode? displayMode, OpenAiSafeArea? safeArea
});


$UserAgentCopyWith<$Res>? get userAgent;$OpenAiSafeAreaCopyWith<$Res>? get safeArea;

}
/// @nodoc
class _$OpenAiGlobalsCopyWithImpl<$Res>
    implements $OpenAiGlobalsCopyWith<$Res> {
  _$OpenAiGlobalsCopyWithImpl(this._self, this._then);

  final OpenAiGlobals _self;
  final $Res Function(OpenAiGlobals) _then;

/// Create a copy of OpenAiGlobals
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? theme = freezed,Object? userAgent = freezed,Object? locale = freezed,Object? maxHeight = freezed,Object? displayMode = freezed,Object? safeArea = freezed,}) {
  return _then(_self.copyWith(
theme: freezed == theme ? _self.theme : theme // ignore: cast_nullable_to_non_nullable
as OpenAiTheme?,userAgent: freezed == userAgent ? _self.userAgent : userAgent // ignore: cast_nullable_to_non_nullable
as UserAgent?,locale: freezed == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as String?,maxHeight: freezed == maxHeight ? _self.maxHeight : maxHeight // ignore: cast_nullable_to_non_nullable
as double?,displayMode: freezed == displayMode ? _self.displayMode : displayMode // ignore: cast_nullable_to_non_nullable
as OpenAiDisplayMode?,safeArea: freezed == safeArea ? _self.safeArea : safeArea // ignore: cast_nullable_to_non_nullable
as OpenAiSafeArea?,
  ));
}
/// Create a copy of OpenAiGlobals
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserAgentCopyWith<$Res>? get userAgent {
    if (_self.userAgent == null) {
    return null;
  }

  return $UserAgentCopyWith<$Res>(_self.userAgent!, (value) {
    return _then(_self.copyWith(userAgent: value));
  });
}/// Create a copy of OpenAiGlobals
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OpenAiSafeAreaCopyWith<$Res>? get safeArea {
    if (_self.safeArea == null) {
    return null;
  }

  return $OpenAiSafeAreaCopyWith<$Res>(_self.safeArea!, (value) {
    return _then(_self.copyWith(safeArea: value));
  });
}
}


/// Adds pattern-matching-related methods to [OpenAiGlobals].
extension OpenAiGlobalsPatterns on OpenAiGlobals {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OpenAiGlobals value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OpenAiGlobals() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OpenAiGlobals value)  $default,){
final _that = this;
switch (_that) {
case _OpenAiGlobals():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OpenAiGlobals value)?  $default,){
final _that = this;
switch (_that) {
case _OpenAiGlobals() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(unknownEnumValue: OpenAiTheme.unknown)  OpenAiTheme? theme,  UserAgent? userAgent,  String? locale,  double? maxHeight,  OpenAiDisplayMode? displayMode,  OpenAiSafeArea? safeArea)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OpenAiGlobals() when $default != null:
return $default(_that.theme,_that.userAgent,_that.locale,_that.maxHeight,_that.displayMode,_that.safeArea);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(unknownEnumValue: OpenAiTheme.unknown)  OpenAiTheme? theme,  UserAgent? userAgent,  String? locale,  double? maxHeight,  OpenAiDisplayMode? displayMode,  OpenAiSafeArea? safeArea)  $default,) {final _that = this;
switch (_that) {
case _OpenAiGlobals():
return $default(_that.theme,_that.userAgent,_that.locale,_that.maxHeight,_that.displayMode,_that.safeArea);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(unknownEnumValue: OpenAiTheme.unknown)  OpenAiTheme? theme,  UserAgent? userAgent,  String? locale,  double? maxHeight,  OpenAiDisplayMode? displayMode,  OpenAiSafeArea? safeArea)?  $default,) {final _that = this;
switch (_that) {
case _OpenAiGlobals() when $default != null:
return $default(_that.theme,_that.userAgent,_that.locale,_that.maxHeight,_that.displayMode,_that.safeArea);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OpenAiGlobals implements OpenAiGlobals {
   _OpenAiGlobals({@JsonKey(unknownEnumValue: OpenAiTheme.unknown) this.theme, this.userAgent, this.locale, this.maxHeight, this.displayMode, this.safeArea});
  factory _OpenAiGlobals.fromJson(Map<String, dynamic> json) => _$OpenAiGlobalsFromJson(json);

@override@JsonKey(unknownEnumValue: OpenAiTheme.unknown) final  OpenAiTheme? theme;
@override final  UserAgent? userAgent;
@override final  String? locale;
@override final  double? maxHeight;
@override final  OpenAiDisplayMode? displayMode;
@override final  OpenAiSafeArea? safeArea;

/// Create a copy of OpenAiGlobals
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OpenAiGlobalsCopyWith<_OpenAiGlobals> get copyWith => __$OpenAiGlobalsCopyWithImpl<_OpenAiGlobals>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OpenAiGlobalsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OpenAiGlobals&&(identical(other.theme, theme) || other.theme == theme)&&(identical(other.userAgent, userAgent) || other.userAgent == userAgent)&&(identical(other.locale, locale) || other.locale == locale)&&(identical(other.maxHeight, maxHeight) || other.maxHeight == maxHeight)&&(identical(other.displayMode, displayMode) || other.displayMode == displayMode)&&(identical(other.safeArea, safeArea) || other.safeArea == safeArea));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,theme,userAgent,locale,maxHeight,displayMode,safeArea);

@override
String toString() {
  return 'OpenAiGlobals(theme: $theme, userAgent: $userAgent, locale: $locale, maxHeight: $maxHeight, displayMode: $displayMode, safeArea: $safeArea)';
}


}

/// @nodoc
abstract mixin class _$OpenAiGlobalsCopyWith<$Res> implements $OpenAiGlobalsCopyWith<$Res> {
  factory _$OpenAiGlobalsCopyWith(_OpenAiGlobals value, $Res Function(_OpenAiGlobals) _then) = __$OpenAiGlobalsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(unknownEnumValue: OpenAiTheme.unknown) OpenAiTheme? theme, UserAgent? userAgent, String? locale, double? maxHeight, OpenAiDisplayMode? displayMode, OpenAiSafeArea? safeArea
});


@override $UserAgentCopyWith<$Res>? get userAgent;@override $OpenAiSafeAreaCopyWith<$Res>? get safeArea;

}
/// @nodoc
class __$OpenAiGlobalsCopyWithImpl<$Res>
    implements _$OpenAiGlobalsCopyWith<$Res> {
  __$OpenAiGlobalsCopyWithImpl(this._self, this._then);

  final _OpenAiGlobals _self;
  final $Res Function(_OpenAiGlobals) _then;

/// Create a copy of OpenAiGlobals
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? theme = freezed,Object? userAgent = freezed,Object? locale = freezed,Object? maxHeight = freezed,Object? displayMode = freezed,Object? safeArea = freezed,}) {
  return _then(_OpenAiGlobals(
theme: freezed == theme ? _self.theme : theme // ignore: cast_nullable_to_non_nullable
as OpenAiTheme?,userAgent: freezed == userAgent ? _self.userAgent : userAgent // ignore: cast_nullable_to_non_nullable
as UserAgent?,locale: freezed == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as String?,maxHeight: freezed == maxHeight ? _self.maxHeight : maxHeight // ignore: cast_nullable_to_non_nullable
as double?,displayMode: freezed == displayMode ? _self.displayMode : displayMode // ignore: cast_nullable_to_non_nullable
as OpenAiDisplayMode?,safeArea: freezed == safeArea ? _self.safeArea : safeArea // ignore: cast_nullable_to_non_nullable
as OpenAiSafeArea?,
  ));
}

/// Create a copy of OpenAiGlobals
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserAgentCopyWith<$Res>? get userAgent {
    if (_self.userAgent == null) {
    return null;
  }

  return $UserAgentCopyWith<$Res>(_self.userAgent!, (value) {
    return _then(_self.copyWith(userAgent: value));
  });
}/// Create a copy of OpenAiGlobals
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OpenAiSafeAreaCopyWith<$Res>? get safeArea {
    if (_self.safeArea == null) {
    return null;
  }

  return $OpenAiSafeAreaCopyWith<$Res>(_self.safeArea!, (value) {
    return _then(_self.copyWith(safeArea: value));
  });
}
}

// dart format on
