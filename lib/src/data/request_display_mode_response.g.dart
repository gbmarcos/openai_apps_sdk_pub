// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_display_mode_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RequestDisplayModeResponse _$RequestDisplayModeResponseFromJson(
  Map<String, dynamic> json,
) => _RequestDisplayModeResponse(
  mode: $enumDecode(_$OpenAiDisplayModeEnumMap, json['mode']),
);

Map<String, dynamic> _$RequestDisplayModeResponseToJson(
  _RequestDisplayModeResponse instance,
) => <String, dynamic>{'mode': _$OpenAiDisplayModeEnumMap[instance.mode]!};

const _$OpenAiDisplayModeEnumMap = {
  OpenAiDisplayMode.pip: 'pip',
  OpenAiDisplayMode.inline: 'inline',
  OpenAiDisplayMode.fullscreen: 'fullscreen',
  OpenAiDisplayMode.unknown: 'unknown',
};

_RequestDisplayModeArgs _$RequestDisplayModeArgsFromJson(
  Map<String, dynamic> json,
) => _RequestDisplayModeArgs(
  mode: $enumDecode(
    _$OpenAiDisplayModeEnumMap,
    json['mode'],
    unknownValue: OpenAiDisplayMode.unknown,
  ),
);

Map<String, dynamic> _$RequestDisplayModeArgsToJson(
  _RequestDisplayModeArgs instance,
) => <String, dynamic>{'mode': _$OpenAiDisplayModeEnumMap[instance.mode]!};
