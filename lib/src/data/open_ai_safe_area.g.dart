// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'open_ai_safe_area.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OpenAiSafeArea _$OpenAiSafeAreaFromJson(Map<String, dynamic> json) =>
    _OpenAiSafeArea(
      insets: OpenAiSafeAreaInsets.fromJson(
        json['insets'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$OpenAiSafeAreaToJson(_OpenAiSafeArea instance) =>
    <String, dynamic>{'insets': instance.insets.toJson()};

_OpenAiSafeAreaInsets _$OpenAiSafeAreaInsetsFromJson(
  Map<String, dynamic> json,
) => _OpenAiSafeAreaInsets(
  top: (json['top'] as num).toDouble(),
  bottom: (json['bottom'] as num).toDouble(),
  left: (json['left'] as num).toDouble(),
  right: (json['right'] as num).toDouble(),
);

Map<String, dynamic> _$OpenAiSafeAreaInsetsToJson(
  _OpenAiSafeAreaInsets instance,
) => <String, dynamic>{
  'top': instance.top,
  'bottom': instance.bottom,
  'left': instance.left,
  'right': instance.right,
};
