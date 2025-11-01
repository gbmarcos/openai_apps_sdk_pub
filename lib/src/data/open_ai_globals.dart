/// Data models for OpenAI Apps global state and enumerations.
///
/// This library defines the core data models used throughout the OpenAI Apps SDK,
/// including partial global state representations, theme modes, display modes,
/// and device types. All models are immutable and use Freezed for code generation.
///
/// ## Models
/// - [PartialOpenAiGlobals]: Partial representation of global state (used in events)
/// - [OpenAiTheme]: Light/dark theme enumeration
/// - [OpenAiDisplayMode]: Display mode enumeration (inline/fullscreen/pip)
/// - [OpenAiDeviceType]: Device type classification (mobile/tablet/desktop)
///
/// ## Example
/// ```dart
/// final globals = PartialOpenAiGlobals(
///   theme: OpenAiTheme.dark,
///   displayMode: OpenAiDisplayMode.fullscreen,
/// );
/// ```
// ignore_for_file: invalid_annotation_target

library;

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:openai_apps_sdk/src/data/open_ai_safe_area.dart';
import 'package:openai_apps_sdk/src/data/user_agent.dart';

part 'open_ai_globals.freezed.dart';
part 'open_ai_globals.g.dart';

/// Partial representation of OpenAI global state.
///
/// This immutable model represents a subset of the global state where all
/// properties are optional. It's primarily used in change events to communicate
/// which specific properties have been updated, without requiring all properties
/// to be present.
///
/// ## Use Cases
/// - Receiving global state changes from the OpenAI Apps runtime
/// - Representing partial updates in event streams
/// - Handling incremental state updates
///
/// ## Example
/// ```dart
/// // Representing a theme change event
/// final themeUpdate = PartialOpenAiGlobals(
///   theme: OpenAiTheme.dark,
/// );
///
/// // Representing multiple property changes
/// final multiUpdate = PartialOpenAiGlobals(
///   theme: OpenAiTheme.light,
///   displayMode: OpenAiDisplayMode.fullscreen,
///   maxHeight: 800.0,
/// );
/// ```
///
/// ## JSON Serialization
/// ```dart
/// final json = globals.toJson();
/// final restored = PartialOpenAiGlobals.fromJson(json);
/// ```
@freezed
abstract class PartialOpenAiGlobals with _$PartialOpenAiGlobals {
  /// Creates a partial OpenAI globals instance.
  ///
  /// All parameters are optional, allowing you to specify only the properties
  /// that are relevant for your use case.
  ///
  /// - [theme]: The current theme (light/dark), if changed
  /// - [userAgent]: Device and capability information, if changed
  /// - [locale]: User's language preference (e.g., 'en-US'), if changed
  /// - [maxHeight]: Maximum available height in pixels, if changed
  /// - [displayMode]: Current display mode (inline/fullscreen/pip), if changed
  /// - [safeArea]: Safe area insets for proper UI positioning, if changed
  factory PartialOpenAiGlobals({
    @JsonKey(unknownEnumValue: OpenAiTheme.unknown) 
    OpenAiTheme? theme,
    UserAgent? userAgent,
    String? locale,
    double? maxHeight,
    OpenAiDisplayMode? displayMode,
    OpenAiSafeArea? safeArea,
  }) = _PartialOpenAiGlobals;

  /// Creates a [PartialOpenAiGlobals] instance from a JSON map.
  ///
  /// Handles unknown enum values gracefully by defaulting to `unknown`.
  factory PartialOpenAiGlobals.fromJson(Map<String, dynamic> json) =>
      _$PartialOpenAiGlobalsFromJson(json);
}

/// Display mode for the application within ChatGPT.
///
/// Defines how the application is presented to the user within the ChatGPT
/// interface. The display mode affects the available screen space and the
/// app's visual presentation.
///
/// ## Values
/// - [pip]: Picture-in-picture mode (floating window, coerced to fullscreen on mobile)
/// - [inline]: Embedded in the chat conversation
/// - [fullscreen]: Occupies the entire viewport
/// - [unknown]: Fallback for unrecognized modes
///
/// ## Example
/// ```dart
/// final mode = OpenAiDisplayMode.fullscreen;
/// if (mode == OpenAiDisplayMode.fullscreen) {
///   // Utilize full screen space
/// }
///
/// // String representation
/// print(mode.data); // 'fullscreen'
/// ```
@JsonEnum(valueField: 'data')
enum OpenAiDisplayMode {
  /// Picture-in-picture mode (floating, resizable window).
  ///
  /// On mobile platforms, PiP requests are automatically coerced to fullscreen
  /// due to platform constraints.
  pip('pip'),

  /// Inline mode (embedded in the conversation).
  ///
  /// The app appears as a card within the chat conversation flow, with
  /// limited vertical space.
  inline('inline'),

  /// Fullscreen mode (occupies entire viewport).
  ///
  /// The app takes over the full screen, providing maximum space for content.
  fullscreen('fullscreen'),

  /// Unknown or unrecognized display mode.
  ///
  /// Used as a fallback when the runtime provides an unrecognized mode value.
  unknown('unknown');

  /// Creates an [OpenAiDisplayMode] with the given string value.
  const OpenAiDisplayMode(this.data);

  /// The string representation of this display mode.
  final String data;
}

/// Theme mode for the ChatGPT interface.
///
/// Represents the current visual theme (light or dark) of the ChatGPT
/// environment. Your application should adapt its appearance to match this
/// theme for a seamless user experience.
///
/// ## Values
/// - [light]: Light theme with bright backgrounds
/// - [dark]: Dark theme with dark backgrounds
/// - [unknown]: Fallback for unrecognized themes
///
/// ## Example
/// ```dart
/// final theme = OpenAiTheme.dark;
/// final isDark = theme == OpenAiTheme.dark;
///
/// // Use in conditional logic
/// final backgroundColor = theme == OpenAiTheme.dark
///     ? Colors.black
///     : Colors.white;
///
/// // String representation
/// print(theme.data); // 'dark'
/// ```
@JsonEnum(valueField: 'data')
enum OpenAiTheme {
  /// Light theme mode.
  ///
  /// Characterized by bright backgrounds and dark text.
  light('light'),

  /// Dark theme mode.
  ///
  /// Characterized by dark backgrounds and light text.
  dark('dark'),

  /// Unknown or unrecognized theme.
  ///
  /// Used as a fallback when the runtime provides an unrecognized theme value.
  unknown('unknown');

  /// Creates an [OpenAiTheme] with the given string value.
  const OpenAiTheme(this.data);

  /// The string representation of this theme.
  final String data;
}

/// Device type classification for the user's device.
///
/// Categorizes the user's device into broad types to help you optimize your
/// UI for different form factors and screen sizes.
///
/// ## Values
/// - [mobile]: Smartphones and small handheld devices
/// - [tablet]: Tablets and medium-sized touch devices
/// - [desktop]: Desktop computers and laptops
/// - [unknown]: Fallback for unrecognized device types
///
/// ## Example
/// ```dart
/// final deviceType = OpenAiDeviceType.mobile;
///
/// // Conditional UI rendering
/// switch (deviceType) {
///   case OpenAiDeviceType.mobile:
///     return CompactMobileLayout();
///   case OpenAiDeviceType.tablet:
///     return TabletLayout();
///   case OpenAiDeviceType.desktop:
///     return ExpandedDesktopLayout();
///   case OpenAiDeviceType.unknown:
///     return ResponsiveLayout();
/// }
///
/// // String representation
/// print(deviceType.data); // 'mobile'
/// ```
@JsonEnum(valueField: 'data')
enum OpenAiDeviceType {
  /// Mobile device (smartphone).
  ///
  /// Small screen, typically portrait orientation, touch-only input.
  mobile('mobile'),

  /// Tablet device.
  ///
  /// Medium screen, variable orientation, touch-primary input.
  tablet('tablet'),

  /// Desktop computer or laptop.
  ///
  /// Large screen, landscape orientation, mouse and keyboard input.
  desktop('desktop'),

  /// Unknown or unrecognized device type.
  ///
  /// Used as a fallback when the device type cannot be determined.
  unknown('unknown');

  /// Creates an [OpenAiDeviceType] with the given string value.
  const OpenAiDeviceType(this.data);

  /// The string representation of this device type.
  final String data;
}
