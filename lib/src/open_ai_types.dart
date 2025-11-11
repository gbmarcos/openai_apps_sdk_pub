/// JavaScript interop types for the OpenAI Apps SDK.
///
/// This file provides Dart bindings to the OpenAI Apps JavaScript API,
/// enabling Flutter web applications to interact with ChatGPT's runtime environment.
/// These types facilitate communication between your Dart/Flutter application and
/// the OpenAI Apps platform through JavaScript interoperability.
///
/// For reference to the official TypeScript type definitions, see:
/// https://github.com/openai/openai-apps-sdk-examples/blob/main/src/types.ts
///
/// ## Key Features
/// - Access to theme, locale, and user agent information
/// - Display mode management (inline, fullscreen, pip)
/// - Safe area handling for proper UI layout
/// - Tool invocation through the MCP (Model Context Protocol)
/// - Widget state persistence
/// - Follow-up message triggering in ChatGPT conversations
///
/// ## Usage
/// Access the OpenAI API through the window object:
/// ```dart
/// final api = window.openai;
/// final theme = api.theme;
/// ```
///
/// Listen to global state changes:
/// ```dart
/// window.onSetOpenAIGlobals.listen((event) {
///   // Handle theme, locale, or layout changes
/// });
/// ```
library;

import 'dart:js_interop';

import 'package:web/web.dart';

/// Extension on [Window] to access the OpenAI Apps JavaScript API.
///
/// This extension provides access to the `window.openai` object, which is
/// injected by the ChatGPT runtime environment when your app is running
/// within ChatGPT.
///
/// ## Example
/// ```dart
/// final openaiAPI = window.openai;
/// final currentTheme = openaiAPI.theme;
/// final displayMode = openaiAPI.displayMode;
/// ```
extension WindowOpenAI on Window {
  /// The OpenAI Apps API instance, providing access to both global state
  /// and API methods for interacting with the ChatGPT environment.
  external JSAPI_AND_OpenAiGlobals get openai;

  /// A broadcast stream that emits events whenever global state changes.
  ///
  /// This stream fires when properties like theme, locale, displayMode,
  /// maxHeight, or safeArea are updated by the ChatGPT runtime.
  ///
  /// ## Example
  /// ```dart
  /// window.onSetOpenAIGlobals.listen((event) {
  ///   final newTheme = event.detail?.globals.theme;
  ///   if (newTheme != null) {
  ///     // Update your app's theme accordingly
  ///   }
  /// });
  /// ```
  Stream<JSSetGlobalsEvent> get onSetOpenAIGlobals =>
      const EventStreamProvider<JSSetGlobalsEvent>(
        setGlobalsEventType,
      ).forTarget(this);
}

/// Combined interface for the OpenAI JavaScript API.
///
/// This extension type combines both the [JSAPI] methods and [JSOpenAiGlobals]
/// properties into a single interface accessible via `window.openai`.
///
/// The naming convention follows the original JavaScript library for
/// compatibility reasons.
@JS()
@anonymous
// Camel case is ignored to remain as faithful as
// possible to the original library
// ignore: camel_case_types
extension type JSAPI_AND_OpenAiGlobals._(JSObject _)
    implements JSAPI, JSOpenAiGlobals {}

/// Global state and properties provided by the OpenAI Apps runtime.
///
/// This extension type encapsulates the read-only global state that ChatGPT
/// provides to your application. These values update dynamically as the user
/// interacts with ChatGPT (e.g., switching themes, resizing windows).
///
/// ## Categories
///
/// ### Visual Properties
/// - [theme]: Current UI theme (light/dark)
/// - [locale]: User's language preference
/// - [userAgent]: Device type and capabilities
///
/// ### Layout Properties
/// - [maxHeight]: Maximum available height for the app
/// - [displayMode]: Current display mode (inline/fullscreen/pip)
/// - [safeArea]: Safe area insets for proper content positioning
///
/// ### State Properties
/// - [toolInput]: Input parameters of the MCP tool that triggered the app display
/// - [toolOutput]: Output from the MCP tool that triggered the app display
/// - [toolResponseMetadata]: Metadata from the MCP tool that triggered the app display
/// - [widgetState]: Persistent state for widget mode apps
@JS()
@anonymous
extension type JSOpenAiGlobals._(JSObject _) implements JSObject {
  // Visual properties

  /// The current theme of the ChatGPT interface.
  ///
  /// Your app should respect this theme to maintain visual consistency
  /// with the ChatGPT environment. Possible values are 'light' and 'dark'.
  external JSTheme get theme;

  /// Information about the user's device and its capabilities.
  ///
  /// Use this to adapt your UI based on device type (mobile/tablet/desktop)
  /// and input capabilities (hover/touch support).
  external JSUserAgent get userAgent;

  /// The user's preferred locale (e.g., 'en-US', 'es-ES').
  ///
  /// Use this to localize your app's content. May be null if not available.
  external JSString? get locale;

  // Layout properties

  /// Maximum height available for your app in pixels.
  ///
  /// Your app should not exceed this height to ensure proper display
  /// within the ChatGPT interface. This value may change dynamically.
  external JSNumber? get maxHeight;

  /// The current display mode of your app.
  ///
  /// Possible values:
  /// - 'inline': App is embedded in the chat conversation
  /// - 'fullscreen': App takes up the full screen
  /// - 'pip': Picture-in-picture mode (may be coerced to fullscreen on mobile)
  external JSDisplayMode get displayMode;

  /// Safe area insets to avoid overlapping with system UI elements.
  ///
  /// Use these insets to position critical UI elements away from areas
  /// that might be obscured by the device's notch, status bar, or navigation bar.
  external JSSafeArea get safeArea;

  // State properties

  /// Input parameters of the MCP tool that triggered the app to be displayed.
  ///
  /// Your MCP server may have multiple tools, but only certain tools trigger
  /// the app to be shown in ChatGPT. This property contains the arguments
  /// that were passed to that specific tool when it was invoked.
  ///
  /// This allows your app to know why it was launched and what context
  /// was provided by the user or the AI.
  external JSUnknownObject get toolInput;

  /// Output from the MCP tool that triggered the app to be displayed.
  ///
  /// This contains the result returned by the specific MCP tool that
  /// caused ChatGPT to show your app. Use this data to render the
  /// appropriate content in your application.
  ///
  /// Note: Only the tool that triggered the app display will have its
  /// output available here, not outputs from other tools in your MCP server.
  external JSUnknownObject? get toolOutput;

  /// Metadata from the MCP tool that triggered the app to be displayed.
  ///
  /// Contains additional information about the execution of the specific
  /// MCP tool that caused ChatGPT to show your app. This may include
  /// execution details, timing information, or other contextual data
  /// relevant to that tool invocation.
  external JSUnknownObject? get toolResponseMetadata;

  /// Persistent state for widget mode applications.
  ///
  /// In widget mode, you can use this to persist state across sessions.
  /// Use [JSAPI.setWidgetState] to update this value.
  external JSUnknownObject? get widgetState;
}

/// JavaScript API methods for interacting with the OpenAI Apps runtime.
///
/// This extension type provides methods to invoke tools, navigate display modes,
/// trigger ChatGPT interactions, and manage application state. These methods
/// enable bidirectional communication between your app and ChatGPT.
@JS()
@anonymous
extension type JSAPI._(JSObject _) implements JSObject {
  /// Invokes a tool on your Model Context Protocol (MCP) server.
  ///
  /// This method allows your frontend app to call backend tools defined
  /// in your MCP server. The tool must be registered in your MCP configuration.
  ///
  /// ## Parameters
  /// - [name]: The name of the tool to invoke (must match your MCP tool definition)
  /// - [args]: A JavaScript object containing the tool's input parameters
  ///
  /// ## Returns
  /// A [JSPromise] that resolves to a [JSCallToolResponse] containing the
  /// tool's execution result.
  ///
  /// ## Example
  /// ```dart
  /// final response = await window.openai.callTool(
  ///   'getUserData'.toJS,
  ///   {'userId': 123}.jsify()! as JSUnknownObject,
  /// ).toDart;
  /// ```
  external JSPromise<JSCallToolResponse> callTool(
    JSString name,
    JSUnknownObject args,
  );

  /// Triggers a follow-up turn in the ChatGPT conversation.
  ///
  /// Use this method to programmatically send a message to ChatGPT on behalf
  /// of the user. This can be used to guide the conversation flow or request
  /// additional information from the AI.
  ///
  /// ## Parameters
  /// - [args]: A [JSSendFollowUpMessageArgs] object containing the prompt text
  ///
  /// ## Returns
  /// A [JSPromise] that resolves when the message has been sent.
  ///
  /// ## Example
  /// ```dart
  /// await window.openai.sendFollowUpMessage(
  ///   JSSendFollowUpMessageArgs(
  ///     prompt: 'Show me more details about this item'.toJS,
  ///   ),
  /// ).toDart;
  /// ```
  external JSPromise<JSAny?> sendFollowUpMessage(
    JSSendFollowUpMessageArgs args,
  );

  /// Opens an external URL in a new browser tab or mobile app.
  ///
  /// This method allows your app to navigate users to external resources
  /// while maintaining the current ChatGPT session. The behavior may vary
  /// between web and mobile platforms.
  ///
  /// ## Parameters
  /// - [payload]: A [JSOpenExternalArgs] object containing the URL to open
  ///
  /// ## Example
  /// ```dart
  /// window.openai.openExternal(
  ///   JSOpenExternalArgs(href: 'https://example.com'.toJS),
  /// );
  /// ```
  ///
  /// ## Platform Behavior
  /// - **Web**: Opens in a new browser tab
  /// - **Mobile**: May open in an in-app browser or external browser app
  external void openExternal(JSOpenExternalArgs payload);

  /// Requests a transition between display modes.
  ///
  /// This method allows your app to request a change in how it's displayed
  /// within ChatGPT. The request may be denied or modified by the runtime
  /// based on platform constraints and user preferences.
  ///
  /// ## Parameters
  /// - [args]: A [JSRequestDisplayModeArgs] object specifying the desired display mode
  ///
  /// ## Returns
  /// A [JSPromise] that resolves to a [JSRequestDisplayModeResponse] containing
  /// the actually granted display mode (which may differ from the requested mode).
  ///
  /// ## Example
  /// ```dart
  /// final response = await window.openai.requestDisplayMode(
  ///   JSRequestDisplayModeArgs(mode: JSDisplayMode.fullscreen),
  /// ).toDart;
  /// print('Granted mode: ${response.mode}');
  /// ```
  ///
  /// ## Notes
  /// - On mobile, PiP requests are always coerced to fullscreen
  /// - The runtime may reject the request if it violates platform constraints
  external JSPromise<JSRequestDisplayModeResponse> requestDisplayMode(
    JSRequestDisplayModeArgs args,
  );

  /// Updates the persistent widget state.
  ///
  /// In widget mode, this method allows you to persist state that survives
  /// across sessions. The state is stored by ChatGPT and can be retrieved
  /// via [JSOpenAiGlobals.widgetState].
  ///
  /// ## Parameters
  /// - [state]: A JavaScript object containing the state to persist
  ///
  /// ## Returns
  /// A [JSPromise] that resolves when the state has been saved.
  ///
  /// ## Example
  /// ```dart
  /// await window.openai
  ///       .setWidgetState(
  ///         {'counter': 42,
  ///               'lastUpdated': DateTime.now().toIso8601String(),
  ///             }.jsify()!
  ///             as JSUnknownObject,
  ///       )
  ///       .toDart;
  /// ```
  ///
  /// ## Notes
  /// - Only available in widget mode
  /// - State should be serializable to JSON
  /// - Consider size limitations for stored data
  external JSPromise<JSAny?> setWidgetState(JSUnknownObject state);
}

/// Event type name for global state change notifications.
///
/// This constant represents the custom event name ('openai:set_globals')
/// that is dispatched by the ChatGPT runtime whenever global state changes.
const setGlobalsEventType = 'openai:set_globals';

/// Custom event dispatched when OpenAI global state changes.
///
/// This event is fired whenever properties like theme, locale, displayMode,
/// maxHeight, or safeArea are updated by the ChatGPT runtime. Listen to this
/// event via [WindowOpenAI.onSetOpenAIGlobals].
///
/// ## Example
/// ```dart
/// window.onSetOpenAIGlobals.listen((event) {
///   final globals = event.detail?.globals;
///   if (globals?.theme != null) {
///     print('Theme changed to: ${globals!.theme}');
///   }
/// });
/// ```
@JS()
@anonymous
extension type JSSetGlobalsEvent._(JSObject _)
    implements CustomEvent, JSObject {
  /// The event detail containing the updated global properties.
  ///
  /// May be null if no detail is provided with the event.
  external JSSetGlobalsEventDetail? get detail;

  /// The event type identifier ('openai:set_globals').
  JSString get type => setGlobalsEventType.toJS;
}

/// Detail object for the [JSSetGlobalsEvent].
///
/// Contains the actual global state changes that triggered the event.
@JS()
@anonymous
extension type JSSetGlobalsEventDetail._(JSObject _) implements JSObject {
  /// The partial globals object containing only the properties that changed.
  external JSPartialOpenAiGlobals get globals;
}

/// Partial representation of OpenAI global state.
///
/// This type represents a subset of [JSOpenAiGlobals] where all properties
/// are optional. It's used in events to communicate which global properties
/// have changed, without requiring all properties to be present.
///
/// Only the properties that have changed will be non-null in this object.
@JS()
@anonymous
extension type JSPartialOpenAiGlobals._(JSObject _) implements JSObject {
  /// The updated theme, if it changed.
  external JSTheme? get theme;

  /// The updated user agent, if it changed.
  external JSUserAgent? get userAgent;

  /// The updated locale, if it changed.
  external JSString? get locale;

  /// The updated maximum height, if it changed.
  external JSNumber? get maxHeight;

  /// The updated display mode, if it changed.
  external JSDisplayMode? get displayMode;

  /// The updated safe area, if it changed.
  external JSSafeArea? get safeArea;

  /// The updated tool input, if it changed.
  ///
  /// Contains the input parameters of the MCP tool that triggered the app display.
  external JSUnknownObject? get toolInput;

  /// The updated tool output, if it changed.
  ///
  /// Contains the output from the MCP tool that triggered the app to be displayed.
  /// This represents the new content that should be rendered in your application.
  external JSUnknownObject? get toolOutput;

  /// The updated tool response metadata, if it changed.
  ///
  /// Contains metadata from the MCP tool that triggered the app display.
  external JSUnknownObject? get toolResponseMetadata;

  /// The updated widget state, if it changed.
  external JSUnknownObject? get widgetState;
}

@JS('Object.keys')
external JSArray<JSString> _getKeysOfObject(JSAny? obj);

/// Represents a JavaScript object with unknown structure.
///
/// This type is the Dart equivalent of TypeScript's `Record<string, unknown>`,
/// representing a dynamic JavaScript object where keys are strings and values
/// can be of any type. It provides a flexible way to work with arbitrary
/// JavaScript objects without requiring a predefined structure.
///
/// ## JavaScript Type Mapping
/// ```typescript
/// export type UnknownObject = Record<string, unknown>;
/// ```
///
/// ## Features
/// - **Dynamic property access**: Read and write properties using the `[]` operator
/// - **Key enumeration**: Access all object keys via the [keys] getter
/// - **Conversion to Dart**: Convert to a Dart `Map<String, dynamic>` using [toMap]
///
/// ## Usage Examples
///
/// ### Reading properties
/// ```dart
/// JSUnknownObject obj = ...; // from OpenAI API
/// final value = obj['propertyName'.toJS];
/// final dartValue = value?.dartify(); // Convert to Dart type
/// ```
///
/// ### Writing properties
/// ```dart
/// JSUnknownObject obj = JSObject() as JSUnknownObject;
/// obj['name'.toJS] = 'John Doe'.toJS;
/// obj['age'.toJS] = 30.toJS;
/// ```
///
/// ### Iterating over keys
/// ```dart
/// JSUnknownObject obj = ...;
/// for (int i = 0; i < obj.keys.length; i++) {
///   final key = obj.keys[i];
///   final value = obj[key];
///   print('${key.toDart}: ${value?.dartify()}');
/// }
/// ```
///
/// ### Converting to Dart Map
/// ```dart
/// JSUnknownObject obj = window.openai.toolInput;
/// Map<String, dynamic> dartMap = obj.toMap();
/// // Now you can use standard Dart map operations
/// final userId = dartMap['userId'];
/// ```
///
/// ## Common Use Cases
/// This type is used throughout the OpenAI Apps SDK for:
/// - [JSOpenAiGlobals.toolInput]: Parameters passed to MCP tools
/// - [JSOpenAiGlobals.toolOutput]: Results returned from MCP tools
/// - [JSOpenAiGlobals.toolResponseMetadata]: Additional tool execution metadata
/// - [JSOpenAiGlobals.widgetState]: Persistent widget state storage
@JS()
@anonymous
extension type JSUnknownObject._(JSObject _) implements JSObject {
  /// Accesses a property value by key.
  ///
  /// Returns `null` if the property doesn't exist.
  external JSAny? operator [](JSString key);

  /// Sets a property value by key.
  ///
  /// Creates the property if it doesn't exist, or updates it if it does.
  external void operator []=(JSString key, JSAny? value);

  /// Returns an array of all enumerable property names in this object.
  ///
  /// This is equivalent to calling `Object.keys()` in JavaScript.
  JSArray<JSString> get keys => _getKeysOfObject(this);

  /// Converts this JavaScript object to a Dart Map.
  ///
  /// All values are converted to their Dart equivalents using [dartify()].
  /// This allows you to work with the object data using familiar Dart APIs.
  ///
  /// ## Example
  /// ```dart
  /// JSUnknownObject jsObj = ...;
  /// Map<String, dynamic> dartMap = jsObj.toMap();
  /// ```
  Map<String, dynamic> toMap() {
    return {
      for (int i = 0; i < keys.length; i++)
        keys[i].toDart: this[keys[i]].dartify(),
    };
  }
}

/// Represents the current theme of the ChatGPT interface.
///
/// Your application should adapt its visual appearance to match the user's
/// theme preference for a seamless integration with ChatGPT.
///
/// ## Values
/// - [light]: Light theme with bright backgrounds and dark text
/// - [dark]: Dark theme with dark backgrounds and light text
///
/// ## Example
/// ```dart
/// final currentTheme = window.openai.theme;
/// if (currentTheme.toDart == 'dark') {
///   // Apply dark theme to your app
/// }
/// ```
@JS()
@anonymous
extension type JSTheme(JSString _) implements JSString {
  /// Light theme mode.
  static JSTheme light = JSTheme('light'.toJS);

  /// Dark theme mode.
  static JSTheme dark = JSTheme('dark'.toJS);
}

/// Insets defining the safe area boundaries on all sides.
///
/// These values represent the padding (in pixels) needed on each side of your
/// app to avoid overlapping with system UI elements like notches, rounded
/// corners, status bars, and navigation bars.
///
/// ## Example
/// ```dart
/// final insets = window.openai.safeArea?.insets;
/// if (insets != null) {
///   final topPadding = insets.top.toDartDouble;
///   final bottomPadding = insets.bottom.toDartDouble;
/// }
/// ```
@JS()
@anonymous
extension type JSSafeAreaInsets._(JSObject _) implements JSObject {
  /// Top inset in pixels (e.g., for status bar or notch).
  external JSNumber get top;

  /// Bottom inset in pixels (e.g., for home indicator or navigation bar).
  external JSNumber get bottom;

  /// Left inset in pixels (e.g., for rounded corners or side notches).
  external JSNumber get left;

  /// Right inset in pixels (e.g., for rounded corners or side notches).
  external JSNumber get right;
}

/// Safe area information for proper content positioning.
///
/// The safe area defines the region where your app's content should be
/// displayed to avoid being obscured by device-specific UI elements.
/// This is especially important for devices with notches, rounded corners,
/// or on-screen navigation controls.
///
/// ## Example
/// ```dart
/// final safeArea = window.openai.safeArea;
/// if (safeArea != null) {
///   final insets = safeArea.insets;
///   // Apply padding to your app's layout
///   return Padding(
///     padding: EdgeInsets.only(
///       top: insets.top.toDartDouble,
///       bottom: insets.bottom.toDartDouble,
///       left: insets.left.toDartDouble,
///       right: insets.right.toDartDouble,
///     ),
///     child: yourContent,
///   );
/// }
/// ```
@JS()
@anonymous
extension type JSSafeArea._(JSObject _) implements JSObject {
  /// The insets for all four sides of the safe area.
  external JSSafeAreaInsets get insets;
}

/// The type of device running the application.
///
/// Use this information to optimize your UI for different screen sizes and
/// interaction patterns. For example, showing touch-optimized controls on
/// mobile devices or hover effects on desktop.
///
/// ## Values
/// - [mobile]: Smartphones and small handheld devices
/// - [tablet]: Tablets and medium-sized touch devices
/// - [desktop]: Desktop computers and laptops
/// - [unknown]: Device type could not be determined
///
/// ## Example
/// ```dart
/// final deviceType = window.openai.userAgent.device.type;
/// if (deviceType.toDart == 'mobile') {
///   // Show mobile-optimized UI
/// }
/// ```
@JS()
@anonymous
extension type JSDeviceType(JSString _) implements JSString {
  /// Mobile device (smartphone).
  static JSDeviceType mobile = JSDeviceType('mobile'.toJS);

  /// Tablet device.
  static JSDeviceType tablet = JSDeviceType('tablet'.toJS);

  /// Desktop computer or laptop.
  static JSDeviceType desktop = JSDeviceType('desktop'.toJS);

  /// Unknown or unrecognized device type.
  static JSDeviceType unknown = JSDeviceType('unknown'.toJS);
}

/// User agent information including device type and capabilities.
///
/// Provides context about the user's device and its interaction capabilities,
/// allowing you to adapt your app's behavior and UI accordingly.
///
/// ## Example
/// ```dart
/// final userAgent = window.openai.userAgent;
/// final isMobile = userAgent.device.type.toDart == 'mobile';
/// final supportsHover = userAgent.capabilities.hover.toDart;
/// final supportsTouch = userAgent.capabilities.touch.toDart;
/// ```
@JS()
@anonymous
extension type JSUserAgent._(JSObject _) implements JSObject {
  /// Information about the user's device.
  external JSUserAgentDevice get device;

  /// The input capabilities available on this device.
  external JSUserAgentCapabilities get capabilities;
}

/// Input capabilities supported by the user's device.
///
/// Use these flags to determine which interaction patterns are available
/// and optimize your UI accordingly.
///
/// ## Example
/// ```dart
/// final capabilities = window.openai.userAgent.capabilities;
/// if (capabilities.hover.toDart) {
///   // Show hover effects and tooltips
/// }
/// if (capabilities.touch.toDart) {
///   // Enable touch gestures and increase touch target sizes
/// }
/// ```
@JS()
@anonymous
extension type JSUserAgentCapabilities._(JSObject _) implements JSObject {
  /// Whether the device supports hover interactions (typically via mouse).
  ///
  /// `true` for devices with mouse or trackpad input, `false` for
  /// touch-only devices.
  external JSBoolean get hover;

  /// Whether the device supports touch input.
  ///
  /// `true` for touchscreen devices, `false` for devices with only
  /// mouse/keyboard input.
  external JSBoolean get touch;
}

/// Device-specific information.
///
/// Currently provides the device type classification.
@JS()
@anonymous
extension type JSUserAgentDevice._(JSObject _) implements JSObject {
  /// The type of device (mobile, tablet, desktop, or unknown).
  external JSDeviceType get type;
}

/// Display mode for the application within ChatGPT.
///
/// The display mode determines how your app is presented to the user.
/// You can request mode changes via [JSAPI.requestDisplayMode], but the
/// runtime may deny or modify the request based on platform constraints.
///
/// ## Values
/// - [inline]: Embedded within the chat conversation
/// - [fullscreen]: Takes up the entire screen
/// - [pip]: Picture-in-picture mode (coerced to fullscreen on mobile)
///
/// ## Example
/// ```dart
/// final currentMode = window.openai.displayMode;
/// if (currentMode?.toDart == 'inline') {
///   // Adjust UI for inline display
/// }
/// ```
@JS()
@anonymous
extension type JSDisplayMode(JSString _) implements JSString {
  /// Picture-in-picture mode (floating window).
  ///
  /// Note: On mobile platforms, this is automatically coerced to fullscreen.
  static JSDisplayMode pip = JSDisplayMode('pip'.toJS);

  /// Inline mode (embedded in conversation).
  ///
  /// The app appears as a card within the chat conversation flow.
  static JSDisplayMode inline = JSDisplayMode('inline'.toJS);

  /// Fullscreen mode (takes over entire viewport).
  ///
  /// The app occupies the entire screen, providing maximum space.
  static JSDisplayMode fullscreen = JSDisplayMode('fullscreen'.toJS);
}

/// Arguments for requesting a display mode change.
///
/// Used with [JSAPI.requestDisplayMode] to request a transition between
/// display modes.
///
/// ## Example
/// ```dart
/// final args = JSRequestDisplayModeArgs(mode: JSDisplayMode.fullscreen);
/// final response = await window.openai.requestDisplayMode(args).toDart;
/// ```
@JS()
@anonymous
extension type JSRequestDisplayModeArgs._(JSObject _) implements JSObject {
  /// Creates a new display mode request.
  ///
  /// [mode] - The desired display mode to transition to.
  external factory JSRequestDisplayModeArgs({JSDisplayMode mode});

  /// The requested display mode.
  external JSDisplayMode get mode;
}

/// Response from a display mode change request.
///
/// Contains the actual display mode that was granted, which may differ
/// from the requested mode if the runtime denied or modified the request.
///
/// ## Example
/// ```dart
/// final response = await window.openai.requestDisplayMode(
///   JSRequestDisplayModeArgs(mode: JSDisplayMode.pip),
/// ).toDart;
///
/// if (response.mode.toDart == 'fullscreen') {
///   print('PiP was coerced to fullscreen (likely on mobile)');
/// }
/// ```
@JS()
@anonymous
extension type JSRequestDisplayModeResponse._(JSObject _) implements JSObject {
  /// The display mode that was actually granted.
  ///
  /// This may differ from the requested mode if:
  /// - The runtime rejected the request due to platform constraints
  /// - PiP was requested on mobile (always coerced to fullscreen)
  /// - The request violated user preferences or system policies
  external JSDisplayMode get mode;
}

/// Response from calling a tool via [JSAPI.callTool].
///
/// Contains the result returned by your MCP server when a tool is invoked.
///
  /// ## Example
  /// ```dart
  /// final response = await window.openai.callTool(
  ///   'fetchUserData'.toJS,
  ///   {'userId': 42}.jsify()! as JSUnknownObject,
  /// ).toDart;
  ///
  /// final result = response.result.toDart;
  /// print('Tool returned: $result');
  /// ```
@JS()
@anonymous
extension type JSCallToolResponse._(JSObject _) implements JSObject {
  /// The result returned by the tool execution.
  ///
  /// This is typically a JSON string containing the tool's output.
  external JSString get result;
}

/// Arguments for sending a follow-up message to ChatGPT.
///
/// Used with [JSAPI.sendFollowUpMessage] to programmatically add a message
/// to the conversation on behalf of the user.
///
/// ## Example
/// ```dart
/// await window.openai.sendFollowUpMessage(
///   JSSendFollowUpMessageArgs(
///     prompt: 'Show me the details for item #123'.toJS,
///   ),
/// ).toDart;
/// ```
@JS()
@anonymous
extension type JSSendFollowUpMessageArgs._(JSObject _) implements JSObject {
  /// Creates a new follow-up message request.
  ///
  /// [prompt] - The message text to send to ChatGPT.
  external factory JSSendFollowUpMessageArgs({JSString prompt});

  /// The prompt text to send to the ChatGPT conversation.
  external JSString get prompt;
}

/// Arguments for opening an external URL.
///
/// Used with [JSAPI.openExternal] to navigate the user to an external
/// resource in a new tab or browser window.
///
/// ## Example
/// ```dart
/// window.openai.openExternal(
///   JSOpenExternalArgs(href: 'https://docs.example.com'.toJS),
/// );
/// ```
@JS()
@anonymous
extension type JSOpenExternalArgs._(JSObject _) implements JSObject {
  /// Creates a new external link request.
  ///
  /// [href] - The URL to open (must be a valid HTTP/HTTPS URL).
  external factory JSOpenExternalArgs({JSString href});

  /// The URL to open externally.
  external JSString get href;
}
