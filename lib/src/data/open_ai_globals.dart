import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:openai_apps_sdk/src/data/open_ai_safe_area.dart';
import 'package:openai_apps_sdk/src/data/user_agent.dart';

part 'open_ai_globals.freezed.dart';
part 'open_ai_globals.g.dart';

@freezed
abstract class OpenAiGlobals with _$OpenAiGlobals {
  factory OpenAiGlobals({
    @JsonKey(unknownEnumValue: OpenAiTheme.unknown)
    OpenAiTheme? theme,
    UserAgent? userAgent,
    String? locale,
    double? maxHeight,
    OpenAiDisplayMode? displayMode,
    OpenAiSafeArea? safeArea,
  }) = _OpenAiGlobals;

  factory OpenAiGlobals.fromJson(Map<String, dynamic> json) =>
      _$OpenAiGlobalsFromJson(json);
}

@JsonEnum(valueField: 'data')
enum OpenAiDisplayMode {
  pip('pip'),
  inline('inline'),
  fullscreen('fullscreen'),
  unknown('unknown');

  const OpenAiDisplayMode(this.data);
  final String data;
}

@JsonEnum(valueField: 'data')
enum OpenAiTheme {
  light('light'),
  dark('dark'),
  unknown('unknown');

  const OpenAiTheme(this.data);
  final String data;
}

@JsonEnum(valueField: 'data')
enum OpenAiDeviceType {
  mobile('mobile'),
  tablet('tablet'),
  desktop('desktop'),
  unknown('unknown');

  const OpenAiDeviceType(this.data);
  final String data;
}
