// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_agent.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserAgent _$UserAgentFromJson(Map<String, dynamic> json) => _UserAgent(
  device: UserAgentDevice.fromJson(json['device'] as Map<String, dynamic>),
  capabilities: UserAgentCapabilities.fromJson(
    json['capabilities'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$UserAgentToJson(_UserAgent instance) =>
    <String, dynamic>{
      'device': instance.device.toJson(),
      'capabilities': instance.capabilities.toJson(),
    };

_UserAgentDevice _$UserAgentDeviceFromJson(Map<String, dynamic> json) =>
    _UserAgentDevice(
      type: $enumDecode(
        _$OpenAiDeviceTypeEnumMap,
        json['type'],
        unknownValue: OpenAiDeviceType.unknown,
      ),
    );

Map<String, dynamic> _$UserAgentDeviceToJson(_UserAgentDevice instance) =>
    <String, dynamic>{'type': _$OpenAiDeviceTypeEnumMap[instance.type]!};

const _$OpenAiDeviceTypeEnumMap = {
  OpenAiDeviceType.mobile: 'mobile',
  OpenAiDeviceType.tablet: 'tablet',
  OpenAiDeviceType.desktop: 'desktop',
  OpenAiDeviceType.unknown: 'unknown',
};

_UserAgentCapabilities _$UserAgentCapabilitiesFromJson(
  Map<String, dynamic> json,
) => _UserAgentCapabilities(
  hover: json['hover'] as bool,
  touch: json['touch'] as bool,
);

Map<String, dynamic> _$UserAgentCapabilitiesToJson(
  _UserAgentCapabilities instance,
) => <String, dynamic>{'hover': instance.hover, 'touch': instance.touch};
