// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'open_ai_globals.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OpenAiGlobals _$OpenAiGlobalsFromJson(Map<String, dynamic> json) =>
    _OpenAiGlobals(
      theme: $enumDecodeNullable(
        _$OpenAiThemeEnumMap,
        json['theme'],
        unknownValue: OpenAiTheme.unknown,
      ),
      userAgent: json['userAgent'] == null
          ? null
          : UserAgent.fromJson(json['userAgent'] as Map<String, dynamic>),
      locale: json['locale'] as String?,
      maxHeight: (json['maxHeight'] as num?)?.toDouble(),
      displayMode: $enumDecodeNullable(
        _$OpenAiDisplayModeEnumMap,
        json['displayMode'],
      ),
      safeArea: json['safeArea'] == null
          ? null
          : OpenAiSafeArea.fromJson(json['safeArea'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OpenAiGlobalsToJson(_OpenAiGlobals instance) =>
    <String, dynamic>{
      'theme': ?_$OpenAiThemeEnumMap[instance.theme],
      'userAgent': ?instance.userAgent?.toJson(),
      'locale': ?instance.locale,
      'maxHeight': ?instance.maxHeight,
      'displayMode': ?_$OpenAiDisplayModeEnumMap[instance.displayMode],
      'safeArea': ?instance.safeArea?.toJson(),
    };

const _$OpenAiThemeEnumMap = {
  OpenAiTheme.light: 'light',
  OpenAiTheme.dark: 'dark',
  OpenAiTheme.unknown: 'unknown',
};

const _$OpenAiDisplayModeEnumMap = {
  OpenAiDisplayMode.pip: 'pip',
  OpenAiDisplayMode.inline: 'inline',
  OpenAiDisplayMode.fullscreen: 'fullscreen',
  OpenAiDisplayMode.unknown: 'unknown',
};
