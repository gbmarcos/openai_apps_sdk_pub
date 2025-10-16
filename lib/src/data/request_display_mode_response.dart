import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:openai_apps_sdk/src/data/open_ai_globals.dart';

part 'request_display_mode_response.freezed.dart';
part 'request_display_mode_response.g.dart';

@freezed
abstract class RequestDisplayModeResponse with _$RequestDisplayModeResponse {
  factory RequestDisplayModeResponse({
    required OpenAiDisplayMode mode,
  }) = _RequestDisplayModeResponse;

  factory RequestDisplayModeResponse.fromJson(Map<String, dynamic> json) =>
      _$RequestDisplayModeResponseFromJson(json);
}

@freezed
abstract class RequestDisplayModeArgs with _$RequestDisplayModeArgs {
  factory RequestDisplayModeArgs({
    @JsonKey(unknownEnumValue: OpenAiDisplayMode.unknown)
    required OpenAiDisplayMode mode,
  }) = _RequestDisplayModeArgs;

  factory RequestDisplayModeArgs.fromJson(Map<String, dynamic> json) =>
      _$RequestDisplayModeArgsFromJson(json);
}
