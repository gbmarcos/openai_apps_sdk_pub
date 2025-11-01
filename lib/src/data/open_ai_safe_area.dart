/// Safe area data models for proper UI positioning.
///
/// This library defines immutable models for representing safe area information,
/// which is essential for avoiding overlaps with system UI elements like notches,
/// rounded corners, status bars, and navigation bars.
///
/// ## Models
/// - [OpenAiSafeArea]: Container for safe area information
/// - [OpenAiSafeAreaInsets]: Inset values for all four sides
///
/// ## Example
/// ```dart
/// final safeArea = OpenAiSafeArea(
///   insets: OpenAiSafeAreaInsets(
///     top: 44.0,
///     bottom: 34.0,
///     left: 0.0,
///     right: 0.0,
///   ),
/// );
/// ```
///
/// ## Flutter Integration
/// ```dart
/// Padding(
///   padding: EdgeInsets.only(
///     top: safeArea.insets.top,
///     bottom: safeArea.insets.bottom,
///     left: safeArea.insets.left,
///     right: safeArea.insets.right,
///   ),
///   child: yourContent,
/// )
/// ```
library;

import 'package:freezed_annotation/freezed_annotation.dart';

part 'open_ai_safe_area.freezed.dart';
part 'open_ai_safe_area.g.dart';

/// Safe area information for proper content positioning.
///
/// This immutable model encapsulates the safe area boundaries provided by
/// the ChatGPT runtime. The safe area defines the region where your app's
/// content should be displayed to avoid being obscured by device-specific
/// UI elements.
///
/// ## Use Cases
/// - Positioning content away from device notches
/// - Avoiding status bar overlaps
/// - Respecting rounded corners on modern devices
/// - Handling on-screen navigation controls
///
/// ## Example
/// ```dart
/// final safeArea = OpenAiSafeArea(
///   insets: OpenAiSafeAreaInsets(
///     top: 44.0,    // Status bar / notch
///     bottom: 34.0, // Home indicator
///     left: 0.0,    // No left inset
///     right: 0.0,   // No right inset
///   ),
/// );
///
/// // Access insets
/// final topInset = safeArea.insets.top;
/// ```
///
/// ## JSON Serialization
/// ```dart
/// final json = safeArea.toJson();
/// final restored = OpenAiSafeArea.fromJson(json);
/// ```
@freezed
abstract class OpenAiSafeArea with _$OpenAiSafeArea {
  /// Creates an [OpenAiSafeArea] instance with the given insets.
  ///
  /// - [insets]: The inset values for all four sides
  factory OpenAiSafeArea({
    required OpenAiSafeAreaInsets insets,
  }) = _OpenAiSafeArea;

  /// Creates an [OpenAiSafeArea] instance from a JSON map.
  factory OpenAiSafeArea.fromJson(Map<String, dynamic> json) =>
      _$OpenAiSafeAreaFromJson(json);
}

/// Inset values defining safe area boundaries on all sides.
///
/// This immutable model represents the padding needed on each edge of your
/// app to avoid overlapping with system UI elements. All values are in pixels
/// and represent distances from the respective edge.
///
/// ## Properties
/// - [top]: Top inset (status bar, notch)
/// - [bottom]: Bottom inset (home indicator, navigation bar)
/// - [left]: Left inset (rounded corners, side notches)
/// - [right]: Right inset (rounded corners, side notches)
///
/// ## Example
/// ```dart
/// final insets = OpenAiSafeAreaInsets(
///   top: 44.0,
///   bottom: 34.0,
///   left: 0.0,
///   right: 0.0,
/// );
///
/// // Use in calculations
/// final availableHeight = screenHeight - insets.top - insets.bottom;
/// ```
///
/// ## Flutter Usage
/// ```dart
/// // Convert to EdgeInsets
/// final edgeInsets = EdgeInsets.only(
///   top: insets.top,
///   bottom: insets.bottom,
///   left: insets.left,
///   right: insets.right,
/// );
///
/// // Apply to a widget
/// Padding(
///   padding: edgeInsets,
///   child: yourContent,
/// )
/// ```
///
/// ## Device Examples
/// - **iPhone with notch**: `top: 44, bottom: 34`
/// - **Android with status bar**: `top: 24, bottom: 0`
/// - **Desktop browser**: `top: 0, bottom: 0, left: 0, right: 0`
///
/// ## JSON Serialization
/// ```dart
/// final json = insets.toJson();
/// final restored = OpenAiSafeAreaInsets.fromJson(json);
/// ```
@freezed
abstract class OpenAiSafeAreaInsets with _$OpenAiSafeAreaInsets {
  /// Creates an [OpenAiSafeAreaInsets] instance with the given values.
  ///
  /// All parameters are required and represent distances in pixels from
  /// the respective edge of the screen.
  ///
  /// - [top]: Top inset in pixels (e.g., status bar height)
  /// - [bottom]: Bottom inset in pixels (e.g., home indicator height)
  /// - [left]: Left inset in pixels (e.g., rounded corner compensation)
  /// - [right]: Right inset in pixels (e.g., rounded corner compensation)
  factory OpenAiSafeAreaInsets({
    required double top,
    required double bottom,
    required double left,
    required double right,
  }) = _OpenAiSafeAreaInsets;

  /// Creates an [OpenAiSafeAreaInsets] instance from a JSON map.
  factory OpenAiSafeAreaInsets.fromJson(Map<String, dynamic> json) =>
      _$OpenAiSafeAreaInsetsFromJson(json);
}
