import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:openai_apps_sdk/src/data/open_ai_globals.dart';

part 'user_agent.freezed.dart';
part 'user_agent.g.dart';

@freezed
abstract class UserAgent with _$UserAgent {
  factory UserAgent({
    required UserAgentDevice device,
    required UserAgentCapabilities capabilities,
  }) = _UserAgent;

  factory UserAgent.fromJson(Map<String, dynamic> json) =>
      _$UserAgentFromJson(json);
}

@freezed
abstract class UserAgentDevice with _$UserAgentDevice {
  factory UserAgentDevice({
    @JsonKey(unknownEnumValue: OpenAiDeviceType.unknown)
    required OpenAiDeviceType type,
  }) = _UserAgentDevice;

  factory UserAgentDevice.fromJson(Map<String, dynamic> json) =>
      _$UserAgentDeviceFromJson(json);
}

@freezed
abstract class UserAgentCapabilities with _$UserAgentCapabilities {
  factory UserAgentCapabilities({
    required bool hover,
    required bool touch,
  }) = _UserAgentCapabilities;

  factory UserAgentCapabilities.fromJson(Map<String, dynamic> json) =>
      _$UserAgentCapabilitiesFromJson(json);
}
