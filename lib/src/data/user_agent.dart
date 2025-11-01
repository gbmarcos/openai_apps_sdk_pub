/// User agent data models for device and capability information.
///
/// This library defines immutable models for representing information about
/// the user's device and its input capabilities. This information helps you
/// optimize your app's UI and behavior for different devices and interaction
/// patterns.
///
/// ## Models
/// - [UserAgent]: Complete user agent information (device + capabilities)
/// - [UserAgentDevice]: Device type classification
/// - [UserAgentCapabilities]: Available input capabilities (hover/touch)
///
/// ## Example
/// ```dart
/// final userAgent = UserAgent(
///   device: UserAgentDevice(type: OpenAiDeviceType.mobile),
///   capabilities: UserAgentCapabilities(hover: false, touch: true),
/// );
///
/// // Check capabilities
/// if (userAgent.capabilities.touch) {
///   // Enable touch gestures
/// }
/// ```
///
/// ## Use Cases
/// - Adapting UI layout for different screen sizes
/// - Enabling/disabling hover effects based on input capabilities
/// - Adjusting touch target sizes for mobile devices
/// - Optimizing interactions for specific device types
// ignore_for_file: invalid_annotation_target

library;

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:openai_apps_sdk/src/data/open_ai_globals.dart';

part 'user_agent.freezed.dart';
part 'user_agent.g.dart';

/// Complete user agent information including device and capabilities.
///
/// This immutable model encapsulates comprehensive information about the
/// user's device and its input capabilities. Use this information to create
/// adaptive UIs that work optimally across different devices and interaction
/// patterns.
///
/// ## Properties
/// - [device]: Device type classification (mobile/tablet/desktop)
/// - [capabilities]: Available input methods (hover/touch support)
///
/// ## Example
/// ```dart
/// final userAgent = UserAgent(
///   device: UserAgentDevice(
///     type: OpenAiDeviceType.mobile,
///   ),
///   capabilities: UserAgentCapabilities(
///     hover: false,
///     touch: true,
///   ),
/// );
///
/// // Conditional UI logic
/// if (userAgent.device.type == OpenAiDeviceType.mobile) {
///   // Show mobile-optimized layout
/// }
///
/// if (userAgent.capabilities.touch) {
///   // Enable touch gestures and increase button sizes
/// }
/// ```
///
/// ## Common Combinations
/// - **Desktop**: `device: desktop, hover: true, touch: false`
/// - **Mobile**: `device: mobile, hover: false, touch: true`
/// - **Touch Laptop**: `device: desktop, hover: true, touch: true`
/// - **Tablet**: `device: tablet, hover: false, touch: true`
///
/// ## JSON Serialization
/// ```dart
/// final json = userAgent.toJson();
/// final restored = UserAgent.fromJson(json);
/// ```
@freezed
abstract class UserAgent with _$UserAgent {
  /// Creates a [UserAgent] instance with device and capability information.
  ///
  /// - [device]: The device type classification
  /// - [capabilities]: The available input capabilities
  factory UserAgent({
    required UserAgentDevice device,
    required UserAgentCapabilities capabilities,
  }) = _UserAgent;

  /// Creates a [UserAgent] instance from a JSON map.
  factory UserAgent.fromJson(Map<String, dynamic> json) =>
      _$UserAgentFromJson(json);
}

/// Device type information for the user's device.
///
/// This immutable model represents the classification of the user's device
/// into one of the standard categories: mobile, tablet, desktop, or unknown.
/// Use this to optimize your UI layout and interaction patterns for different
/// form factors.
///
/// ## Properties
/// - [type]: The device type classification
///
/// ## Example
/// ```dart
/// final device = UserAgentDevice(
///   type: OpenAiDeviceType.mobile,
/// );
///
/// // Conditional rendering
/// Widget buildLayout() {
///   switch (device.type) {
///     case OpenAiDeviceType.mobile:
///       return MobileLayout();
///     case OpenAiDeviceType.tablet:
///       return TabletLayout();
///     case OpenAiDeviceType.desktop:
///       return DesktopLayout();
///     case OpenAiDeviceType.unknown:
///       return ResponsiveLayout();
///   }
/// }
/// ```
///
/// ## Device Characteristics
/// - **Mobile**: Small screen, portrait, touch-only
/// - **Tablet**: Medium screen, variable orientation, touch-primary
/// - **Desktop**: Large screen, landscape, mouse/keyboard primary
///
/// ## JSON Serialization
/// ```dart
/// final json = device.toJson();
/// final restored = UserAgentDevice.fromJson(json);
/// ```
///
/// ## Unknown Enum Values
/// If an unrecognized device type is encountered during deserialization,
/// it defaults to [OpenAiDeviceType.unknown].
@freezed
abstract class UserAgentDevice with _$UserAgentDevice {
  /// Creates a [UserAgentDevice] with the given device type.
  ///
  /// - [type]: The device type classification (mobile/tablet/desktop/unknown)
  factory UserAgentDevice({
    @JsonKey(unknownEnumValue: OpenAiDeviceType.unknown)
    required OpenAiDeviceType type,
  }) = _UserAgentDevice;

  /// Creates a [UserAgentDevice] instance from a JSON map.
  ///
  /// Unknown enum values are handled gracefully by defaulting to
  /// [OpenAiDeviceType.unknown].
  factory UserAgentDevice.fromJson(Map<String, dynamic> json) =>
      _$UserAgentDeviceFromJson(json);
}

/// Input capabilities supported by the user's device.
///
/// This immutable model represents the available input methods on the user's
/// device. Use these flags to conditionally enable or disable features based
/// on the input capabilities.
///
/// ## Properties
/// - [hover]: Whether the device supports hover interactions (mouse/trackpad)
/// - [touch]: Whether the device supports touch input (touchscreen)
///
/// ## Example
/// ```dart
/// final capabilities = UserAgentCapabilities(
///   hover: false,
///   touch: true,
/// );
///
/// // Conditional feature enablement
/// if (capabilities.hover) {
///   // Show tooltips and hover effects
///   enableTooltips();
/// }
///
/// if (capabilities.touch) {
///   // Enable touch gestures
///   enableSwipeGestures();
///   // Increase touch target sizes
///   buttonSize = 48.0; // Minimum 48x48 dp for touch
/// }
///
/// if (capabilities.hover && capabilities.touch) {
///   // Hybrid device (e.g., touch-enabled laptop)
///   // Support both interaction patterns
/// }
/// ```
///
/// ## Common Capability Combinations
/// - **Desktop**: `hover: true, touch: false`
/// - **Mobile**: `hover: false, touch: true`
/// - **Touch Laptop**: `hover: true, touch: true`
/// - **Legacy Device**: `hover: false, touch: false` (rare)
///
/// ## Design Recommendations
/// - **Touch-only devices**: Larger touch targets (48x48 dp minimum)
/// - **Hover-capable devices**: Smaller controls acceptable, use hover states
/// - **Hybrid devices**: Support both paradigms simultaneously
///
/// ## JSON Serialization
/// ```dart
/// final json = capabilities.toJson();
/// final restored = UserAgentCapabilities.fromJson(json);
/// ```
@freezed
abstract class UserAgentCapabilities with _$UserAgentCapabilities {
  /// Creates a [UserAgentCapabilities] with the given capability flags.
  ///
  /// - [hover]: `true` if the device supports hover interactions (mouse/trackpad)
  /// - [touch]: `true` if the device supports touch input (touchscreen)
  factory UserAgentCapabilities({
    required bool hover,
    required bool touch,
  }) = _UserAgentCapabilities;

  /// Creates a [UserAgentCapabilities] instance from a JSON map.
  factory UserAgentCapabilities.fromJson(Map<String, dynamic> json) =>
      _$UserAgentCapabilitiesFromJson(json);
}
