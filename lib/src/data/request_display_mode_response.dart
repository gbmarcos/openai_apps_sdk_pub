/// Data models for display mode change requests and responses.
///
/// This library defines immutable models used when requesting transitions
/// between different display modes (inline, fullscreen, pip) in the ChatGPT
/// interface. The request may be granted, denied, or modified by the runtime
/// based on platform constraints.
///
/// ## Models
/// - [RequestDisplayModeArgs]: Arguments for requesting a display mode change
/// - [RequestDisplayModeResponse]: Response indicating the granted display mode
///
/// ## Example
/// ```dart
/// // Create a request to go fullscreen
/// final args = RequestDisplayModeArgs(
///   mode: OpenAiDisplayMode.fullscreen,
/// );
///
/// // Assuming we have a response
/// final response = RequestDisplayModeResponse(
///   mode: OpenAiDisplayMode.fullscreen,
/// );
/// ```
///
/// ## Usage with SDK
/// ```dart
/// final bridge = OpenAiAppsSDKBridge.instance;
/// final grantedMode = await bridge.requestDisplayMode(
///   OpenAiDisplayMode.fullscreen,
/// );
/// ```
// ignore_for_file: invalid_annotation_target

library;

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:openai_apps_sdk/src/data/open_ai_globals.dart';

part 'request_display_mode_response.freezed.dart';
part 'request_display_mode_response.g.dart';

/// Response from a display mode change request.
///
/// This immutable model represents the response from the ChatGPT runtime
/// after requesting a display mode change. The granted mode may differ from
/// the requested mode if the runtime denied or modified the request due to
/// platform constraints or user preferences.
///
/// ## Properties
/// - [mode]: The display mode that was actually granted
///
/// ## Common Scenarios
/// - **Request Granted**: Requested and granted modes match
/// - **Request Denied**: Runtime returns the current mode unchanged
/// - **Request Modified**: PiP requested on mobile → fullscreen granted
///
/// ## Example
/// ```dart
/// final response = RequestDisplayModeResponse(
///   mode: OpenAiDisplayMode.fullscreen,
/// );
///
/// if (response.mode == OpenAiDisplayMode.fullscreen) {
///   print('Successfully entered fullscreen');
/// } else {
///   print('Request was denied or modified: ${response.mode}');
/// }
/// ```
///
/// ## Platform Behavior
/// - **Mobile**: PiP requests are always coerced to fullscreen
/// - **Desktop**: All modes are typically supported
/// - **Web**: Depends on browser capabilities
///
/// ## JSON Serialization
/// ```dart
/// final json = response.toJson();
/// final restored = RequestDisplayModeResponse.fromJson(json);
/// ```
@freezed
abstract class RequestDisplayModeResponse with _$RequestDisplayModeResponse {
  /// Creates a [RequestDisplayModeResponse] with the granted display mode.
  ///
  /// - [mode]: The display mode that was actually granted by the runtime
  factory RequestDisplayModeResponse({
    required OpenAiDisplayMode mode,
  }) = _RequestDisplayModeResponse;

  /// Creates a [RequestDisplayModeResponse] instance from a JSON map.
  factory RequestDisplayModeResponse.fromJson(Map<String, dynamic> json) =>
      _$RequestDisplayModeResponseFromJson(json);
}

/// Arguments for requesting a display mode change.
///
/// This immutable model represents the parameters for requesting a transition
/// between display modes. The request is sent to the ChatGPT runtime, which
/// will evaluate it based on platform constraints and return a response.
///
/// ## Properties
/// - [mode]: The desired display mode to transition to
///
/// ## Display Modes
/// - **inline**: Embedded in the conversation (limited vertical space)
/// - **fullscreen**: Takes over the entire viewport (maximum space)
/// - **pip**: Picture-in-picture floating window (coerced to fullscreen on mobile)
///
/// ## Example
/// ```dart
/// // Request fullscreen mode
/// final fullscreenArgs = RequestDisplayModeArgs(
///   mode: OpenAiDisplayMode.fullscreen,
/// );
///
/// // Request inline mode
/// final inlineArgs = RequestDisplayModeArgs(
///   mode: OpenAiDisplayMode.inline,
/// );
///
/// // Request picture-in-picture
/// final pipArgs = RequestDisplayModeArgs(
///   mode: OpenAiDisplayMode.pip,
/// );
/// ```
///
/// ## Platform Considerations
/// - On mobile, PiP is automatically converted to fullscreen
/// - Some modes may not be available in all contexts
/// - The runtime may deny requests that violate user preferences
///
/// ## JSON Serialization
/// ```dart
/// final json = args.toJson();
/// final restored = RequestDisplayModeArgs.fromJson(json);
/// ```
///
/// ## Unknown Enum Values
/// If an unrecognized mode value is encountered during deserialization,
/// it defaults to [OpenAiDisplayMode.unknown].
@freezed
abstract class RequestDisplayModeArgs with _$RequestDisplayModeArgs {
  /// Creates a [RequestDisplayModeArgs] with the desired display mode.
  ///
  /// - [mode]: The display mode to request (inline, fullscreen, or pip)
  factory RequestDisplayModeArgs({
    @JsonKey(unknownEnumValue: OpenAiDisplayMode.unknown) required OpenAiDisplayMode mode,
  }) = _RequestDisplayModeArgs;

  /// Creates a [RequestDisplayModeArgs] instance from a JSON map.
  ///
  /// Unknown enum values are handled gracefully by defaulting to
  /// [OpenAiDisplayMode.unknown].
  factory RequestDisplayModeArgs.fromJson(Map<String, dynamic> json) =>
      _$RequestDisplayModeArgsFromJson(json);
}
