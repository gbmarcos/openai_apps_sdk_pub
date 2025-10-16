import 'dart:js_interop';

import 'package:openai_apps_sdk/src/data/models.dart';
import 'package:web/web.dart';

/// SafeAreaInsets
@JS()
@anonymous
extension type _JSSafeAreaInsets._(JSObject _) implements JSObject {
  external factory _JSSafeAreaInsets({
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
extension type _JSSafeArea._(JSObject _) implements JSObject {
  external factory _JSSafeArea({_JSSafeAreaInsets insets});
  external _JSSafeAreaInsets get insets;
}

/// UserAgentCapabilities
@JS()
@anonymous
extension type _JSUserAgentCapabilities._(JSObject _) implements JSObject {
  external factory _JSUserAgentCapabilities({
    JSBoolean hover,
    JSBoolean touch,
  });

  external JSBoolean get hover;
  external JSBoolean get touch;
}

/// UserAgentDevice
@JS()
@anonymous
extension type _JSUserAgentDevice._(JSObject _) implements JSObject {
  external factory _JSUserAgentDevice({JSString type});
  external JSString get type;
}

/// UserAgent
@JS()
@anonymous
extension type _JSUserAgent._(JSObject _) implements JSObject {
  external factory _JSUserAgent({
    _JSUserAgentDevice device,
    _JSUserAgentCapabilities capabilities,
  });

  external _JSUserAgentDevice get device;
  external _JSUserAgentCapabilities get capabilities;
}

/// CallToolResponse
@JS()
@anonymous
extension type _JSCallToolResponse._(JSObject _) implements JSObject {
  external factory _JSCallToolResponse();
  // Añade aquí las propiedades específicas de CallToolResponse según tu API
}

/// SendFollowUpMessageArgs
@JS()
@anonymous
extension type _JSSendFollowUpMessageArgs._(JSObject _) implements JSObject {
  external factory _JSSendFollowUpMessageArgs({JSString prompt});
  external JSString get prompt;
}

/// OpenExternalArgs
@JS()
@anonymous
extension type _JSOpenExternalArgs._(JSObject _) implements JSObject {
  external factory _JSOpenExternalArgs({JSString href});
  external JSString get href;
}

/// RequestDisplayModeArgs
@JS()
@anonymous
extension type _JSRequestDisplayModeArgs._(JSObject _) implements JSObject {
  external factory _JSRequestDisplayModeArgs({JSString mode});
  external JSString get mode;
}

/// RequestDisplayModeResponse
@JS()
@anonymous
extension type _JSRequestDisplayModeResponse._(JSObject _) implements JSObject {
  external JSString get mode;
}

/// OpenAI API
@JS()
@anonymous
extension type _JSOpenAiAPI._(JSObject _) implements JSObject {
  /// Calls a tool on your MCP. Returns the full response.
  external JSPromise<_JSCallToolResponse> callTool(
    JSString name,
    JSObject args,
  );

  /// Triggers a followup turn in the ChatGPT conversation
  external JSPromise<JSAny?> sendFollowUpMessage(
    _JSSendFollowUpMessageArgs args,
  );

  /// Opens an external link, redirects web page or mobile app
  external void openExternal(_JSOpenExternalArgs payload);

  /// For transitioning an app from inline to fullscreen or pip
  external JSPromise<_JSRequestDisplayModeResponse> requestDisplayMode(
    _JSRequestDisplayModeArgs args,
  );

  /// Sets the widget state
  external JSPromise<JSAny?> setWidgetState(JSObject state);
}

/// OpenAI Globals
@JS()
@anonymous
extension type _JSOpenAiGlobals._(JSObject _) implements JSObject {
  external JSString? get theme;
  external _JSUserAgent? get userAgent;
  external JSString? get locale;
  external JSNumber? get maxHeight;
  external JSString? get displayMode;
  external _JSSafeArea? get safeArea;
  external JSObject? get toolInput;
  external JSObject? get toolOutput;
  external JSObject? get toolResponseMetadata;
  external JSObject? get widgetState;
}

/// OpenAI SDK - Combina API y Globals
@JS()
@anonymous
extension type _JSOpenAiSDK._(JSObject _)
    implements _JSOpenAiAPI, _JSOpenAiGlobals {}

@JS()
@anonymous
extension type _JSSetGlobalsEventDetail._(JSObject _) implements JSObject {
  external _JSOpenAiGlobals get globals;
}

@JS()
@anonymous
extension type _JSSetGlobalsEvent._(JSObject _)
    implements CustomEvent, JSObject {
  external factory _JSSetGlobalsEvent(
    String type, [
    _JSSetGlobalsEventInit eventInitDict,
  ]);

  external void initSetGlobalsEvent(
    String type, [
    bool bubbles,
    bool cancelable,
    _JSSetGlobalsEventDetail? detail,
  ]);

  external _JSSetGlobalsEventDetail? get detail;
}

@JS()
@anonymous
extension type _JSSetGlobalsEventInit._(JSObject _)
    implements CustomEventInit, JSObject {
  external factory _JSSetGlobalsEventInit({
    bool bubbles,
    bool cancelable,
    bool composed,
    _JSSetGlobalsEventDetail? detail,
  });

  external _JSSetGlobalsEventDetail? get detail;
  external set detail(_JSSetGlobalsEventDetail? value);
}

/// Event listener para cambios globales
const setGlobalsEventType = 'openai:set_globals';

/// Window extension para acceder a window.openai
extension _WindowOpenAI on Window {
  external _JSOpenAiSDK get openai;

  /// Stream for set globals events
  Stream<_JSSetGlobalsEvent> get onSetOpenAIGlobals =>
      const EventStreamProvider<_JSSetGlobalsEvent>(
        setGlobalsEventType,
      ).forTarget(this);
}

extension _JSStringToEnum on JSString? {
  OpenAiTheme? toOpenAiTheme() {
    if (this == null) return null;
    return OpenAiTheme.values.firstWhere(
      (e) => e.data == this!.toDart,
      orElse: () => OpenAiTheme.unknown,
    );
  }

  OpenAiDisplayMode? toOpenAiDisplayMode() {
    if (this == null) return null;
    return OpenAiDisplayMode.values.firstWhere(
      (e) => e.data == this!.toDart,
      orElse: () => OpenAiDisplayMode.unknown,
    );
  }

  OpenAiDeviceType? toOpenAiDeviceType() {
    if (this == null) return null;
    return OpenAiDeviceType.values.firstWhere(
      (e) => e.data == this!.toDart,
      orElse: () => OpenAiDeviceType.unknown,
    );
  }
}

extension _JSSafeAreaInsetsToOpenAiSafeAreaInsets on _JSSafeAreaInsets {
  OpenAiSafeAreaInsets toOpenAiSafeAreaInsets() => OpenAiSafeAreaInsets(
    top: top.toDartDouble,
    bottom: bottom.toDartDouble,
    left: left.toDartDouble,
    right: right.toDartDouble,
  );
}

extension _JSSafeAreaToOpenAiSafeArea on _JSSafeArea {
  OpenAiSafeArea toOpenAiSafeArea() => OpenAiSafeArea(
    insets: insets.toOpenAiSafeAreaInsets(),
  );
}

extension _JSUserAgentToUserAgent on _JSUserAgent {
  UserAgent toUserAgent() => UserAgent(
    device: device.toUserAgentDevice(),
    capabilities: capabilities.toUserAgentCapabilities(),
  );
}

extension _JSUserAgentCapabilitiesToCapabilities on _JSUserAgentCapabilities {
  UserAgentCapabilities toUserAgentCapabilities() => UserAgentCapabilities(
    hover: hover.toDart,
    touch: touch.toDart,
  );
}

extension _JSUserAgentDeviceToUserAgentDevice on _JSUserAgentDevice {
  UserAgentDevice toUserAgentDevice() => UserAgentDevice(
    type: type.toOpenAiDeviceType()!,
  );
}

/// Clase Dart para trabajar con el SDK de manera más idiomática
class OpenAiSDK {
  OpenAiSDK._(this._sdk);

  static OpenAiSDK? _instance;

  /// Constructor factory to get the instance of the SDK
  static OpenAiSDK get instance {
    _instance ??= OpenAiSDK._(window.openai);
    return _instance!;
  }

  final _JSOpenAiSDK _sdk;

  OpenAiGlobals _globalsFromJS(_JSOpenAiGlobals globals) => OpenAiGlobals(
    theme: globals.theme.toOpenAiTheme(),
    locale: globals.locale?.toDart,
    maxHeight: globals.maxHeight?.toDartDouble,
    displayMode: globals.displayMode.toOpenAiDisplayMode(),
    safeArea: globals.safeArea?.toOpenAiSafeArea(),
    userAgent: globals.userAgent?.toUserAgent(),
  );

  /// Call a tool
  Future<_JSCallToolResponse> callTool(
    String name,
    Map<String, dynamic> args,
  ) async {
    final jsArgs = args.jsify() as JSObject;
    final promise = _sdk.callTool(name.toJS, jsArgs);
    return promise.toDart;
  }

  /// Send follow-up message
  Future<void> sendFollowUpMessage(String prompt) async {
    final args = _JSSendFollowUpMessageArgs(prompt: prompt.toJS);
    await _sdk.sendFollowUpMessage(args).toDart;
  }

  /// Open external link
  void openExternal(String href) {
    final args = _JSOpenExternalArgs(href: href.toJS);
    _sdk.openExternal(args);
  }

  /// Request display mode
  Future<OpenAiDisplayMode> requestDisplayMode(OpenAiDisplayMode mode) async {
    final args = _JSRequestDisplayModeArgs(mode: mode.data.toJS);
    final response = await _sdk.requestDisplayMode(args).toDart;
    return RequestDisplayModeResponse.fromJson(
      response.dartify()! as Map<String, dynamic>,
    ).mode;
  }

  /// Set widget state
  Future<void> setWidgetState(Map<String, dynamic> state) async {
    final jsState = state.jsify() as JSObject;
    await _sdk.setWidgetState(jsState).toDart;
  }

  Stream<OpenAiGlobals> get globalsStream => window.onSetOpenAIGlobals.map(
    (event) => _globalsFromJS(event.detail!.globals),
  );

  Stream<OpenAiTheme> get themeStream => globalsStream
      .where((globals) => globals.theme != null)
      .map((globals) => globals.theme!)
      .distinct();

  // Getters para globals
  OpenAiTheme get theme => _sdk.theme.toOpenAiTheme() ?? OpenAiTheme.unknown;

  String? get locale => _sdk.locale?.toDart;

  double? get maxHeight => _sdk.maxHeight?.toDartDouble;

  OpenAiDisplayMode? get displayMode => _sdk.displayMode.toOpenAiDisplayMode();

  OpenAiDeviceType? get deviceType =>
      _sdk.userAgent?.device.type.toOpenAiDeviceType();

  bool get hasHoverCapability =>
      _sdk.userAgent?.capabilities.hover.toDart ?? false;

  bool get hasTouchCapability =>
      _sdk.userAgent?.capabilities.touch.toDart ?? false;

  OpenAiSafeAreaInsets? get safeAreaInsets =>
      _sdk.safeArea?.insets.toOpenAiSafeAreaInsets();

  Map<String, dynamic> get toolInput =>
      _sdk.toolInput.dartify()! as Map<String, dynamic>;

  Map<String, dynamic>? get toolOutput =>
      _sdk.toolOutput.dartify() as Map<String, dynamic>?;

  Map<String, dynamic>? get toolResponseMetadata =>
      _sdk.toolResponseMetadata?.toJSBox as Map<String, dynamic>?;

  Map<String, dynamic>? get widgetState =>
      _sdk.widgetState.dartify() as Map<String, dynamic>?;
}
