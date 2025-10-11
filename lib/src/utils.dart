import 'dart:js_interop';

import 'package:web/web.dart';

/// Enums y tipos
enum DisplayMode {
  pip,
  inline,
  fullscreen;

  String toJS() => name;

  static DisplayMode fromString(String value) {
    return DisplayMode.values.firstWhere(
      (e) => e.name == value,
      orElse: () => DisplayMode.inline,
    );
  }
}

enum Theme {
  light,
  dark;

  String toJS() => name;

  static Theme fromString(String value) {
    return Theme.values.firstWhere(
      (e) => e.name == value,
      orElse: () => Theme.light,
    );
  }
}

enum DeviceType {
  mobile,
  tablet,
  desktop,
  unknown;

  String toJS() => name;

  static DeviceType fromString(String value) {
    return DeviceType.values.firstWhere(
      (e) => e.name == value,
      orElse: () => DeviceType.unknown,
    );
  }
}

/// SafeAreaInsets
@JS()
@anonymous
extension type SafeAreaInsets._(JSObject _) implements JSObject {
  external factory SafeAreaInsets({
    JSNumber top,
    JSNumber bottom,
    JSNumber left,
    JSNumber right,
  });

  external JSNumber get top;
  external JSNumber get bottom;
  external JSNumber get left;
  external JSNumber get right;
}

/// SafeArea
@JS()
@anonymous
extension type SafeArea._(JSObject _) implements JSObject {
  external factory SafeArea({SafeAreaInsets insets});
  external SafeAreaInsets get insets;
}

/// UserAgentCapabilities
@JS()
@anonymous
extension type UserAgentCapabilities._(JSObject _) implements JSObject {
  external factory UserAgentCapabilities({
    JSBoolean hover,
    JSBoolean touch,
  });

  external JSBoolean get hover;
  external JSBoolean get touch;
}

/// UserAgentDevice
@JS()
@anonymous
extension type UserAgentDevice._(JSObject _) implements JSObject {
  external factory UserAgentDevice({JSString type});
  external JSString get type;
}

/// UserAgent
@JS()
@anonymous
extension type UserAgent._(JSObject _) implements JSObject {
  external factory UserAgent({
    UserAgentDevice device,
    UserAgentCapabilities capabilities,
  });

  external UserAgentDevice get device;
  external UserAgentCapabilities get capabilities;
}

/// CallToolResponse
@JS()
@anonymous
extension type CallToolResponse._(JSObject _) implements JSObject {
  external factory CallToolResponse();
  // Añade aquí las propiedades específicas de CallToolResponse según tu API
}

/// SendFollowUpMessageArgs
@JS()
@anonymous
extension type SendFollowUpMessageArgs._(JSObject _) implements JSObject {
  external factory SendFollowUpMessageArgs({JSString prompt});
  external JSString get prompt;
}

/// OpenExternalArgs
@JS()
@anonymous
extension type OpenExternalArgs._(JSObject _) implements JSObject {
  external factory OpenExternalArgs({JSString href});
  external JSString get href;
}

/// RequestDisplayModeArgs
@JS()
@anonymous
extension type RequestDisplayModeArgs._(JSObject _) implements JSObject {
  external factory RequestDisplayModeArgs({JSString mode});
  external JSString get mode;
}

/// RequestDisplayModeResponse
@JS()
@anonymous
extension type RequestDisplayModeResponse._(JSObject _) implements JSObject {
  external JSString get mode;
}

/// OpenAI API
@JS()
@anonymous
extension type OpenAiAPI._(JSObject _) implements JSObject {
  /// Calls a tool on your MCP. Returns the full response.
  external JSPromise<CallToolResponse> callTool(
    JSString name,
    JSObject args,
  );

  /// Triggers a followup turn in the ChatGPT conversation
  external JSPromise<JSAny?> sendFollowUpMessage(
    SendFollowUpMessageArgs args,
  );

  /// Opens an external link, redirects web page or mobile app
  external void openExternal(OpenExternalArgs payload);

  /// For transitioning an app from inline to fullscreen or pip
  external JSPromise<RequestDisplayModeResponse> requestDisplayMode(
    RequestDisplayModeArgs args,
  );

  /// Sets the widget state
  external JSPromise<JSAny?> setWidgetState(JSObject state);
}

/// OpenAI Globals
@JS()
@anonymous
extension type OpenAiGlobals._(JSObject _) implements JSObject {
  external JSString get theme;
  external UserAgent get userAgent;
  external JSString get locale;
  external JSNumber get maxHeight;
  external JSString get displayMode;
  external SafeArea get safeArea;
  external JSObject get toolInput;
  external JSObject? get toolOutput;
  external JSObject? get toolResponseMetadata;
  external JSObject? get widgetState;
}

/// OpenAI SDK - Combina API y Globals
@JS()
@anonymous
extension type OpenAiSDK._(JSObject _) implements OpenAiAPI, OpenAiGlobals {}

/// Window extension para acceder a window.openai
extension WindowOpenAI on Window {
  external OpenAiSDK get openai;
}

/// Clase Dart para trabajar con el SDK de manera más idiomática
class OpenAiClient {
  final OpenAiSDK _sdk;

  OpenAiClient(this._sdk);

  /// Constructor factory que obtiene el SDK desde window
  factory OpenAiClient.fromWindow() {
    return OpenAiClient(window.openai);
  }

  /// Call a tool
  Future<CallToolResponse> callTool(
    String name,
    Map<String, dynamic> args,
  ) async {
    final jsArgs = args.jsify() as JSObject;
    final promise = _sdk.callTool(name.toJS, jsArgs);
    return promise.toDart;
  }

  /// Send follow-up message
  Future<void> sendFollowUpMessage(String prompt) async {
    final args = SendFollowUpMessageArgs(prompt: prompt.toJS);
    await _sdk.sendFollowUpMessage(args).toDart;
  }

  /// Open external link
  void openExternal(String href) {
    final args = OpenExternalArgs(href: href.toJS);
    _sdk.openExternal(args);
  }

  /// Request display mode
  Future<DisplayMode> requestDisplayMode(DisplayMode mode) async {
    final args = RequestDisplayModeArgs(mode: mode.toJS().toJS);
    final response = await _sdk.requestDisplayMode(args).toDart;
    return DisplayMode.fromString(response.mode.toDart);
  }

  /// Set widget state
  Future<void> setWidgetState(Map<String, dynamic> state) async {
    final jsState = state.jsify() as JSObject;
    await _sdk.setWidgetState(jsState).toDart;
  }

  // Getters para globals
  Theme get theme => Theme.fromString(_sdk.theme.toDart);

  String get locale => _sdk.locale.toDart;

  double get maxHeight => _sdk.maxHeight.toDartDouble;

  DisplayMode get displayMode =>
      DisplayMode.fromString(_sdk.displayMode.toDart);

  DeviceType get deviceType =>
      DeviceType.fromString(_sdk.userAgent.device.type.toDart);

  bool get hasHoverCapability => _sdk.userAgent.capabilities.hover.toDart;

  bool get hasTouchCapability => _sdk.userAgent.capabilities.touch.toDart;

  Map<String, double> get safeAreaInsets {
    final insets = _sdk.safeArea.insets;
    return {
      'top': insets.top.toDartDouble,
      'bottom': insets.bottom.toDartDouble,
      'left': insets.left.toDartDouble,
      'right': insets.right.toDartDouble,
    };
  }

  Map<String, dynamic> get toolInput =>
      _sdk.toolInput.dartify()! as Map<String, dynamic>;

  Map<String, dynamic>? get toolOutput =>
      _sdk.toolOutput.dartify() as Map<String, dynamic>?;

  Map<String, dynamic>? get toolResponseMetadata =>
      _sdk.toolResponseMetadata.dartify() as Map<String, dynamic>?;

  Map<String, dynamic>? get widgetState =>
      _sdk.widgetState.dartify() as Map<String, dynamic>?;
}

/// Event listener para cambios globales
const setGlobalsEventType = 'openai:set_globals';

@JS()
@anonymous
extension type SetGlobalsEventDetail._(JSObject _) implements JSObject {
  external JSObject get globals;
}

/// Helper para escuchar eventos de cambio de globals
void addGlobalsChangeListener(
  void Function(Map<String, dynamic>? globals) callback,
) {
  window.addEventListener(
    setGlobalsEventType,
    (Event event) {
      final customEvent = event as CustomEvent;
      final detail = customEvent.detail as SetGlobalsEventDetail?;
      final globals = detail?.globals.dartify() as Map<String, dynamic>?;
      callback(globals);
    }.toJS,
  );
}

/// Ejemplo de uso
void main() {
  final client = OpenAiClient.fromWindow();

  client.sendFollowUpMessage('Hello from Dart!');

  // Acceder a propiedades
  print('Theme: ${client.theme}');
  print('Device: ${client.deviceType}');
  print('Max Height: ${client.maxHeight}');

  // Llamar a un tool
  client.callTool('myTool', {'param': 'value'}).then((response) {
    print('Tool called successfully');
  });

  // Enviar mensaje de seguimiento
  client.sendFollowUpMessage('Hello from Dart!');

  // Cambiar display mode
  client.requestDisplayMode(DisplayMode.fullscreen).then((mode) {
    print('Display mode changed to: $mode');
  });

  // Escuchar cambios en globals
  addGlobalsChangeListener((globals) {
    print('Globals changed: $globals');
  });
}
