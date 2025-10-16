// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'open_ai_safe_area.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OpenAiSafeArea {

 OpenAiSafeAreaInsets get insets;
/// Create a copy of OpenAiSafeArea
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OpenAiSafeAreaCopyWith<OpenAiSafeArea> get copyWith => _$OpenAiSafeAreaCopyWithImpl<OpenAiSafeArea>(this as OpenAiSafeArea, _$identity);

  /// Serializes this OpenAiSafeArea to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OpenAiSafeArea&&(identical(other.insets, insets) || other.insets == insets));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,insets);

@override
String toString() {
  return 'OpenAiSafeArea(insets: $insets)';
}


}

/// @nodoc
abstract mixin class $OpenAiSafeAreaCopyWith<$Res>  {
  factory $OpenAiSafeAreaCopyWith(OpenAiSafeArea value, $Res Function(OpenAiSafeArea) _then) = _$OpenAiSafeAreaCopyWithImpl;
@useResult
$Res call({
 OpenAiSafeAreaInsets insets
});


$OpenAiSafeAreaInsetsCopyWith<$Res> get insets;

}
/// @nodoc
class _$OpenAiSafeAreaCopyWithImpl<$Res>
    implements $OpenAiSafeAreaCopyWith<$Res> {
  _$OpenAiSafeAreaCopyWithImpl(this._self, this._then);

  final OpenAiSafeArea _self;
  final $Res Function(OpenAiSafeArea) _then;

/// Create a copy of OpenAiSafeArea
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? insets = null,}) {
  return _then(_self.copyWith(
insets: null == insets ? _self.insets : insets // ignore: cast_nullable_to_non_nullable
as OpenAiSafeAreaInsets,
  ));
}
/// Create a copy of OpenAiSafeArea
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OpenAiSafeAreaInsetsCopyWith<$Res> get insets {
  
  return $OpenAiSafeAreaInsetsCopyWith<$Res>(_self.insets, (value) {
    return _then(_self.copyWith(insets: value));
  });
}
}


/// Adds pattern-matching-related methods to [OpenAiSafeArea].
extension OpenAiSafeAreaPatterns on OpenAiSafeArea {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OpenAiSafeArea value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OpenAiSafeArea() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OpenAiSafeArea value)  $default,){
final _that = this;
switch (_that) {
case _OpenAiSafeArea():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OpenAiSafeArea value)?  $default,){
final _that = this;
switch (_that) {
case _OpenAiSafeArea() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( OpenAiSafeAreaInsets insets)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OpenAiSafeArea() when $default != null:
return $default(_that.insets);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( OpenAiSafeAreaInsets insets)  $default,) {final _that = this;
switch (_that) {
case _OpenAiSafeArea():
return $default(_that.insets);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( OpenAiSafeAreaInsets insets)?  $default,) {final _that = this;
switch (_that) {
case _OpenAiSafeArea() when $default != null:
return $default(_that.insets);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OpenAiSafeArea implements OpenAiSafeArea {
   _OpenAiSafeArea({required this.insets});
  factory _OpenAiSafeArea.fromJson(Map<String, dynamic> json) => _$OpenAiSafeAreaFromJson(json);

@override final  OpenAiSafeAreaInsets insets;

/// Create a copy of OpenAiSafeArea
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OpenAiSafeAreaCopyWith<_OpenAiSafeArea> get copyWith => __$OpenAiSafeAreaCopyWithImpl<_OpenAiSafeArea>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OpenAiSafeAreaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OpenAiSafeArea&&(identical(other.insets, insets) || other.insets == insets));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,insets);

@override
String toString() {
  return 'OpenAiSafeArea(insets: $insets)';
}


}

/// @nodoc
abstract mixin class _$OpenAiSafeAreaCopyWith<$Res> implements $OpenAiSafeAreaCopyWith<$Res> {
  factory _$OpenAiSafeAreaCopyWith(_OpenAiSafeArea value, $Res Function(_OpenAiSafeArea) _then) = __$OpenAiSafeAreaCopyWithImpl;
@override @useResult
$Res call({
 OpenAiSafeAreaInsets insets
});


@override $OpenAiSafeAreaInsetsCopyWith<$Res> get insets;

}
/// @nodoc
class __$OpenAiSafeAreaCopyWithImpl<$Res>
    implements _$OpenAiSafeAreaCopyWith<$Res> {
  __$OpenAiSafeAreaCopyWithImpl(this._self, this._then);

  final _OpenAiSafeArea _self;
  final $Res Function(_OpenAiSafeArea) _then;

/// Create a copy of OpenAiSafeArea
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? insets = null,}) {
  return _then(_OpenAiSafeArea(
insets: null == insets ? _self.insets : insets // ignore: cast_nullable_to_non_nullable
as OpenAiSafeAreaInsets,
  ));
}

/// Create a copy of OpenAiSafeArea
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OpenAiSafeAreaInsetsCopyWith<$Res> get insets {
  
  return $OpenAiSafeAreaInsetsCopyWith<$Res>(_self.insets, (value) {
    return _then(_self.copyWith(insets: value));
  });
}
}


/// @nodoc
mixin _$OpenAiSafeAreaInsets {

 double get top; double get bottom; double get left; double get right;
/// Create a copy of OpenAiSafeAreaInsets
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OpenAiSafeAreaInsetsCopyWith<OpenAiSafeAreaInsets> get copyWith => _$OpenAiSafeAreaInsetsCopyWithImpl<OpenAiSafeAreaInsets>(this as OpenAiSafeAreaInsets, _$identity);

  /// Serializes this OpenAiSafeAreaInsets to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OpenAiSafeAreaInsets&&(identical(other.top, top) || other.top == top)&&(identical(other.bottom, bottom) || other.bottom == bottom)&&(identical(other.left, left) || other.left == left)&&(identical(other.right, right) || other.right == right));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,top,bottom,left,right);

@override
String toString() {
  return 'OpenAiSafeAreaInsets(top: $top, bottom: $bottom, left: $left, right: $right)';
}


}

/// @nodoc
abstract mixin class $OpenAiSafeAreaInsetsCopyWith<$Res>  {
  factory $OpenAiSafeAreaInsetsCopyWith(OpenAiSafeAreaInsets value, $Res Function(OpenAiSafeAreaInsets) _then) = _$OpenAiSafeAreaInsetsCopyWithImpl;
@useResult
$Res call({
 double top, double bottom, double left, double right
});




}
/// @nodoc
class _$OpenAiSafeAreaInsetsCopyWithImpl<$Res>
    implements $OpenAiSafeAreaInsetsCopyWith<$Res> {
  _$OpenAiSafeAreaInsetsCopyWithImpl(this._self, this._then);

  final OpenAiSafeAreaInsets _self;
  final $Res Function(OpenAiSafeAreaInsets) _then;

/// Create a copy of OpenAiSafeAreaInsets
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? top = null,Object? bottom = null,Object? left = null,Object? right = null,}) {
  return _then(_self.copyWith(
top: null == top ? _self.top : top // ignore: cast_nullable_to_non_nullable
as double,bottom: null == bottom ? _self.bottom : bottom // ignore: cast_nullable_to_non_nullable
as double,left: null == left ? _self.left : left // ignore: cast_nullable_to_non_nullable
as double,right: null == right ? _self.right : right // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [OpenAiSafeAreaInsets].
extension OpenAiSafeAreaInsetsPatterns on OpenAiSafeAreaInsets {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OpenAiSafeAreaInsets value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OpenAiSafeAreaInsets() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OpenAiSafeAreaInsets value)  $default,){
final _that = this;
switch (_that) {
case _OpenAiSafeAreaInsets():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OpenAiSafeAreaInsets value)?  $default,){
final _that = this;
switch (_that) {
case _OpenAiSafeAreaInsets() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double top,  double bottom,  double left,  double right)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OpenAiSafeAreaInsets() when $default != null:
return $default(_that.top,_that.bottom,_that.left,_that.right);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double top,  double bottom,  double left,  double right)  $default,) {final _that = this;
switch (_that) {
case _OpenAiSafeAreaInsets():
return $default(_that.top,_that.bottom,_that.left,_that.right);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double top,  double bottom,  double left,  double right)?  $default,) {final _that = this;
switch (_that) {
case _OpenAiSafeAreaInsets() when $default != null:
return $default(_that.top,_that.bottom,_that.left,_that.right);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OpenAiSafeAreaInsets implements OpenAiSafeAreaInsets {
   _OpenAiSafeAreaInsets({required this.top, required this.bottom, required this.left, required this.right});
  factory _OpenAiSafeAreaInsets.fromJson(Map<String, dynamic> json) => _$OpenAiSafeAreaInsetsFromJson(json);

@override final  double top;
@override final  double bottom;
@override final  double left;
@override final  double right;

/// Create a copy of OpenAiSafeAreaInsets
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OpenAiSafeAreaInsetsCopyWith<_OpenAiSafeAreaInsets> get copyWith => __$OpenAiSafeAreaInsetsCopyWithImpl<_OpenAiSafeAreaInsets>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OpenAiSafeAreaInsetsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OpenAiSafeAreaInsets&&(identical(other.top, top) || other.top == top)&&(identical(other.bottom, bottom) || other.bottom == bottom)&&(identical(other.left, left) || other.left == left)&&(identical(other.right, right) || other.right == right));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,top,bottom,left,right);

@override
String toString() {
  return 'OpenAiSafeAreaInsets(top: $top, bottom: $bottom, left: $left, right: $right)';
}


}

/// @nodoc
abstract mixin class _$OpenAiSafeAreaInsetsCopyWith<$Res> implements $OpenAiSafeAreaInsetsCopyWith<$Res> {
  factory _$OpenAiSafeAreaInsetsCopyWith(_OpenAiSafeAreaInsets value, $Res Function(_OpenAiSafeAreaInsets) _then) = __$OpenAiSafeAreaInsetsCopyWithImpl;
@override @useResult
$Res call({
 double top, double bottom, double left, double right
});




}
/// @nodoc
class __$OpenAiSafeAreaInsetsCopyWithImpl<$Res>
    implements _$OpenAiSafeAreaInsetsCopyWith<$Res> {
  __$OpenAiSafeAreaInsetsCopyWithImpl(this._self, this._then);

  final _OpenAiSafeAreaInsets _self;
  final $Res Function(_OpenAiSafeAreaInsets) _then;

/// Create a copy of OpenAiSafeAreaInsets
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? top = null,Object? bottom = null,Object? left = null,Object? right = null,}) {
  return _then(_OpenAiSafeAreaInsets(
top: null == top ? _self.top : top // ignore: cast_nullable_to_non_nullable
as double,bottom: null == bottom ? _self.bottom : bottom // ignore: cast_nullable_to_non_nullable
as double,left: null == left ? _self.left : left // ignore: cast_nullable_to_non_nullable
as double,right: null == right ? _self.right : right // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
