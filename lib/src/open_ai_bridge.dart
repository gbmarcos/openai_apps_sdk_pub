// openai_bridge.dart
import 'dart:async';
import 'dart:convert';
import 'dart:js_interop' as js;
import 'dart:js_interop_unsafe';
import 'package:web/web.dart' as web;

// ============================================================================
// JavaScript Interop Definitions
// ============================================================================

/// External reference to the global OpenAI bridge object
@js.JS('openai')
external OpenAIBridgeJS? get _openai;

/// JavaScript interop type for the OpenAI bridge object injected by ChatGPT
extension type OpenAIBridgeJS(js.JSObject _) implements js.JSObject {
  /// Current display mode: 'light', 'dark', or 'compact'
  external js.JSString? get displayMode;

  /// Bridge version string
  external js.JSString? get version;

  /// Subscribe method (if available)
  external js.JSFunction? get subscribe;
}

// ============================================================================
// Main OpenAI Bridge Class
// ============================================================================

/// Bridge to communicate with OpenAI's ChatGPT environment
///
/// This class provides a type-safe, idiomatic Dart interface to interact with
/// the `window.openai` bridge injected by ChatGPT when your Flutter web app
/// runs inside an iframe in ChatGPT conversations.
///
/// Example:
/// ```dart
/// final bridge = OpenAIBridge();
///
/// if (bridge.isAvailable) {
///   // Listen to tool responses
///   bridge.toolResponseStream.listen((data) {
///     print('Received: ${data['city']}');
///   });
///
///   // React to theme changes
///   bridge.themeChangeStream.listen((theme) {
///     print('Theme: $theme');
///   });
///
///   // Send user action
///   bridge.notifyUserAction('button_clicked', {'id': 'refresh'});
/// }
/// ```
class OpenAIBridge {

  /// Get the singleton instance
  factory OpenAIBridge() {
    _instance ??= OpenAIBridge._internal();
    return _instance!;
  }

  OpenAIBridge._internal() {
    _setupEventListeners();
    _log('OpenAIBridge initialized');
  }

  static OpenAIBridge? _instance;

  // Stream controllers
  final _toolResponseController =
      StreamController<Map<String, dynamic>>.broadcast();
  final _themeChangeController = StreamController<String>.broadcast();

  /// Stream of tool response events from ChatGPT
  Stream<Map<String, dynamic>> get toolResponseStream =>
      _toolResponseController.stream;

  /// Stream of theme change events
  Stream<String> get themeChangeStream => _themeChangeController.stream;

  /// Check if the OpenAI bridge is available (running inside ChatGPT)
  bool get isAvailable {
    try {
      return _openai != null;
    } on Exception catch (e) {
      _log('Bridge not available: $e');
      return false;
    }
  }

  /// Get the current display mode: 'light', 'dark', or 'compact'
  String? get displayMode {
    if (!isAvailable) return null;

    try {
      final mode = _openai!.displayMode;
      return mode?.toDart;
    } on Exception catch (e) {
      _log('Error getting display mode: $e');
      return null;
    }
  }

  /// Get the bridge API version
  String? get version {
    if (!isAvailable) return null;

    try {
      final ver = _openai!.version;
      return ver?.toDart;
    } on Exception catch (e) {
      _log('Error getting version: $e');
      return null;
    }
  }

  /// Whether the current theme is dark mode
  bool get isDarkMode => displayMode == 'dark';

  /// Whether the current theme is light mode
  bool get isLightMode => displayMode == 'light';

  /// Whether the display is in compact mode
  bool get isCompactMode => displayMode == 'compact';

  // =========================================================================
  // Communication Methods
  // =========================================================================

  /// Send a structured message to the parent window (ChatGPT)
  void sendMessageToParent(Map<String, dynamic> message) {
    try {
      final jsonMessage = jsonEncode(message);
      final jsMessage = jsonMessage.toJS;

      final parent = web.window.parent;
      if (parent != null && parent != web.window) {
        parent.postMessage(jsMessage, '*'.toJS);
        _log('Message sent: ${message['type']}');
      } else {
        _log('Parent window not available');
      }
    } on Exception catch (e) {
      _log('Error sending message: $e');
    }
  }

  /// Notify ChatGPT of a user action
  ///
  /// [action] - The action type (e.g., 'button_clicked', 'refresh_requested')
  /// [data] - Optional data payload associated with the action
  void notifyUserAction(String action, [Map<String, dynamic>? data]) {
    sendMessageToParent({
      'type': 'user_action',
      'action': action,
      'data': data ?? {},
      'timestamp': DateTime.now().toIso8601String(),
    });
  }

  /// Notify ChatGPT that the widget has loaded successfully
  void notifyWidgetLoaded({Map<String, dynamic>? metadata}) {
    notifyUserAction('widget_loaded', {
      ...?metadata,
      'widget_version': version ?? 'unknown',
    });
  }

  /// Notify ChatGPT of an error
  void notifyError(String error, [Map<String, dynamic>? context]) {
    sendMessageToParent({
      'type': 'error',
      'error': error,
      'context': context ?? {},
      'timestamp': DateTime.now().toIso8601String(),
    });
  }

  /// Request data refresh from ChatGPT
  void requestRefresh([Map<String, dynamic>? params]) {
    notifyUserAction('refresh_requested', params);
  }

  // =========================================================================
  // Event Handling
  // =========================================================================

  /// Setup event listeners for bridge events
  void _setupEventListeners() {
    // Listen to tool response events
    web.window.addEventListener(
      'openai:tool_response',
      _createToolResponseListener().toJS,
    );

    // Listen to theme change events
    web.window.addEventListener(
      'openai:theme_changed',
      _createThemeChangeListener().toJS,
    );

    // Start theme polling as fallback
    _startThemePolling();

    _log('Event listeners setup complete');
  }

  /// Create tool response event listener
  void Function(web.Event) _createToolResponseListener() {
    return (web.Event event) {
      try {
        if (event.isA<web.CustomEvent>()) {
          final customEvent = event as web.CustomEvent;
          final detail = customEvent.detail;

          final dartData = _convertJSObjectToMap(detail);
          _toolResponseController.add(dartData);
          _log('Tool response received: ${dartData.keys.join(", ")}');
        }
      } on Exception catch (e) {
        _log('Error processing tool response: $e');
        _toolResponseController.addError(e);
      }
    };
  }

  /// Create theme change event listener
  void Function(web.Event) _createThemeChangeListener() {
    return (web.Event event) {
      try {
        if (event.isA<web.CustomEvent>()) {
          final customEvent = event as web.CustomEvent;
          final detail = customEvent.detail;

          final theme = _convertJSValueToString(detail);
          if (theme != null && theme.isNotEmpty) {
            _themeChangeController.add(theme);
            _log('Theme changed: $theme');
          }
        }
      } on Exception catch (e) {
        _log('Error processing theme change: $e');
      }
    };
  }

  /// Poll for theme changes (fallback mechanism)
  String? _lastTheme;
  void _startThemePolling() {
    _lastTheme = displayMode;

    Future.delayed(const Duration(seconds: 1), () {
      if (_toolResponseController.isClosed) return;

      final currentMode = displayMode;
      if (currentMode != null &&
          currentMode.isNotEmpty &&
          currentMode != _lastTheme) {
        _themeChangeController.add(currentMode);
        _lastTheme = currentMode;
        _log('Theme detected via polling: $currentMode');
      }

      _startThemePolling();
    });
  }

  // =========================================================================
  // JS Conversion Utilities
  // =========================================================================

  /// Convert a JS object/value to a Dart Map
  Map<String, dynamic> _convertJSObjectToMap(js.JSAny? jsValue) {
    if (jsValue == null) return {};

    try {
      // Use JSON stringify/parse for reliable conversion
      final json = js.globalContext['JSON'] as js.JSObject?;
      final stringify = json?['stringify'] as js.JSFunction?;

      if (stringify != null) {
        final jsonString = stringify.callAsFunction(json, jsValue);
        if (jsonString != null && jsonString.isA<js.JSString>()) {
          final dartString = (jsonString as js.JSString).toDart;
          final decoded = jsonDecode(dartString);

          if (decoded is Map) {
            return Map<String, dynamic>.from(decoded);
          }
        }
      }

      // Fallback: try direct conversion
      if (jsValue.isA<js.JSObject>()) {
        return _jsObjectToMapFallback(jsValue as js.JSObject);
      }

      return {};
    } on Exception catch (e) {
      _log('Error converting JS to Map: $e');
      return {};
    }
  }

  /// Fallback method to convert JSObject to Map
  Map<String, dynamic> _jsObjectToMapFallback(js.JSObject obj) {
    final result = <String, dynamic>{};

    try {
      final keys = js.globalContext.callMethod(
        'Object'.toJS,
        'keys'.toJS,
        obj,
      );

      if (keys != null && keys.isA<js.JSArray>()) {
        final jsArray = keys as js.JSArray;
        final length = jsArray.getProperty('length'.toJS) as js.JSNumber?;

        final lengthInt = length?.toDartInt ?? 0;

        for (var i = 0; i < lengthInt; i++) {
          final key = jsArray[i];
          if (key != null && key.isA<js.JSString>()) {
            final dartKey = (key as js.JSString).toDart;
            final value = obj.getProperty(key);
            result[dartKey] = _convertJSValueToDart(value);
          }
        }
      }
    } on Exception catch (e) {
      _log('Error in fallback conversion: $e');
    }

    return result;
  }

  /// Convert JS value to appropriate Dart type
  dynamic _convertJSValueToDart(js.JSAny? value) {
    if (value == null) return null;

    try {
      if (value.isA<js.JSString>()) {
        return (value as js.JSString).toDart;
      } else if (value.isA<js.JSNumber>()) {
        return (value as js.JSNumber).toDartDouble;
      } else if (value.isA<js.JSBoolean>()) {
        return (value as js.JSBoolean).toDart;
      } else if (value.isA<js.JSArray>()) {
        final array = value as js.JSArray;
        final length = array.getProperty('length'.toJS) as js.JSNumber?;

        final lengthInt = length?.toDartInt ?? 0;
        return List.generate(
          lengthInt,
          (i) => _convertJSValueToDart(array[i]),
        );
      } else if (value.isA<js.JSObject>()) {
        return _jsObjectToMapFallback(value as js.JSObject);
      }
    } on Exception catch (e) {
      _log('Error converting JS value: $e');
    }

    return null;
  }

  /// Convert JS value to String
  String? _convertJSValueToString(js.JSAny? value) {
    if (value == null) return null;

    try {
      if (value.isA<js.JSString>()) {
        return (value as js.JSString).toDart;
      }
      // Try to convert to string
      return value.toString();
    } on Exception catch (e) {
      _log('Error converting to string: $e');
      return null;
    }
  }

  // =========================================================================
  // Utilities
  // =========================================================================

  /// Log message to browser console
  void _log(String message) {
    web.console.log('[OpenAIBridge] $message'.toJS);
  }

  /// Dispose and cleanup resources
  Future<void> dispose() async {
    await _toolResponseController.close();
    await _themeChangeController.close();
    _log('Bridge disposed');
  }
}
