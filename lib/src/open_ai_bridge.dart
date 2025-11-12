/// Dart bridge for the OpenAI Apps JavaScript SDK.
///
/// This library provides a high-level Dart API that wraps the low-level
/// JavaScript interop types, offering a more idiomatic Dart interface for
/// interacting with the OpenAI Apps platform within ChatGPT.
///
/// For reference to the official TypeScript type definitions, see:
/// https://github.com/openai/openai-apps-sdk-examples/blob/main/src/types.ts
///
/// ## Key Features
/// - **Type-safe API**: Converts JavaScript types to Dart-native types
/// - **Reactive streams**: Observable streams for global state changes
/// - **Singleton pattern**: Single instance ensures consistent state
/// - **Async/await support**: Promise-based APIs converted to Dart Futures
///
/// ## Usage
/// Access the singleton instance to interact with the OpenAI Apps API:
/// ```dart
/// final bridge = OpenAiAppsSDKBridge.instance;
///
/// // Get current theme
/// final theme = bridge.theme;
///
/// // Listen to theme changes
/// bridge.themeStream.listen((newTheme) {
///   print('Theme changed to: $newTheme');
/// });
///
/// // Call a tool
/// final result = await bridge.callTool('myTool', {'param': 'value'});
///
/// // Request fullscreen mode
/// await bridge.requestDisplayMode(OpenAiDisplayMode.fullscreen);
/// ```
library;

import 'dart:js_interop';

import 'package:openai_apps_sdk/src/data/models.dart';
import 'package:openai_apps_sdk/src/open_ai_types.dart';
import 'package:web/web.dart';

/// Bridge class providing a Dart-friendly interface to the OpenAI Apps JavaScript API.
///
/// This class acts as an adapter layer between the low-level JavaScript interop
/// types and idiomatic Dart code. It provides:
/// - Type conversion from JavaScript to Dart types
/// - Reactive streams for state changes
/// - Simplified method signatures
/// - Future-based async operations
///
/// ## Singleton Pattern
/// This class uses the singleton pattern to ensure there's only one instance
/// throughout your application's lifecycle, maintaining consistent state and
/// event subscriptions.
///
/// ## Example
/// ```dart
/// final sdk = OpenAiAppsSDKBridge.instance;
///
/// // Access global properties
/// print('Current theme: ${sdk.theme}');
/// print('Device type: ${sdk.deviceType}');
///
/// // Call tools
/// final response = await sdk.callTool('getUserData', {'userId': 42});
///
/// // Listen to changes
/// sdk.displayModeStream.listen((mode) {
///   print('Display mode changed to: $mode');
/// });
/// ```
class OpenAiAppsSDKBridge {
  /// Factory constructor that returns the singleton instance.
  ///
  /// Always returns the same instance to ensure consistent state across the app.
  ///
  /// ```dart
  /// final sdk = OpenAiAppsSDKBridge.instance();
  /// ```
  factory OpenAiAppsSDKBridge() => _instance;

  /// Private constructor used internally to create the singleton instance.
  ///
  /// Takes the JavaScript `window.openai` API object as parameter.
  OpenAiAppsSDKBridge._(this._openai);

  /// The singleton instance initialized with `window.openai`.
  static final OpenAiAppsSDKBridge _instance = OpenAiAppsSDKBridge._(
    window.openai,
  );

  /// The underlying JavaScript API instance.
  final JSAPI_AND_OpenAiGlobals _openai;

  /// Initializes the inline mode size config. (experimental)
  ///
  /// This method is used to set the height of the Flutter view in inline mode.
  ///
  /// ## Parameters
  /// - [desktopHeight]: The height of the Flutter view in desktop mode.
  /// - [mobileHeight]: The height of the Flutter view in mobile mode.
  /// - [unknownDeviceHeight]: The height of the Flutter view in unknown device mode.
  /// - [tabletHeight]: The height of the Flutter view in tablet mode.
  ///
  /// ## Example
  /// ```dart
  /// sdk.initInlineModeSizeConfig(
  ///   desktopHeight: 400,
  ///   mobileHeight: 280,
  /// );

  void initInlineModeSizeConfig({
    required double desktopHeight,
    required double mobileHeight,
    double? unknownDeviceHeight,
    double? tabletHeight,
  }) {
    _desktopHeight = desktopHeight;
    _mobileHeight = mobileHeight;
    _tabletHeight = tabletHeight ?? mobileHeight;
    _unknownDeviceHeight = unknownDeviceHeight;

    _updateSize();

    displayModeStream.listen((mode) {
      if (mode == OpenAiDisplayMode.inline) {
        _updateSize();
      }
    });
  }

  /// Updates the Flutter view height based on device type and inline mode configuration.
  ///
  /// This method dynamically adjusts the height of the Flutter view element based on
  /// the current device type and the height values configured via [initInlineModeSizeConfig].
  /// It is automatically called when the app transitions to inline display mode or when
  /// the inline mode size configuration is initialized.
  ///
  /// ## Behavior
  /// - Retrieves the `<flutter-view>` HTML element (lazy initialization on first call)
  /// - Sets the element's height CSS property based on the current [deviceType]
  /// - Uses device-specific heights configured in [initInlineModeSizeConfig]
  /// - If no height is configured for the current device type, no height is set
  ///
  /// ## Device-Specific Heights
  /// The method applies heights in the following priority:
  /// - **Mobile**: Uses `_mobileHeight` if configured
  /// - **Tablet**: Uses `_tabletHeight` if configured
  /// - **Desktop**: Uses `_desktopHeight` if configured
  /// - **Unknown**: Uses `_unknownDeviceHeight` if configured
  ///
  /// ## When Called
  /// This method is invoked automatically:
  /// - After [initInlineModeSizeConfig] completes
  /// - When the display mode changes to [OpenAiDisplayMode.inline]
  /// - When [requestDisplayMode] is called with [OpenAiDisplayMode.inline]
  ///
  /// ## Example
  /// ```dart
  /// // Initialize size config first
  /// sdk.initInlineModeSizeConfig(
  ///   desktopHeight: 400,
  ///   mobileHeight: 280,
  /// );
  ///
  /// // _updateSize() is called automatically during init
  /// // and whenever display mode changes to inline
  /// ```

  void _updateSize() {
    _flutterView ??=
        document.getElementsByTagName('flutter-view').item(0) as HTMLElement?;
    if (_flutterView != null) {
      switch (deviceType) {
        case OpenAiDeviceType.mobile when _mobileHeight != null:
          _flutterView!.style.height = '${_mobileHeight}px';
        case OpenAiDeviceType.tablet when _tabletHeight != null:
          _flutterView!.style.height = '${_tabletHeight}px';
        case OpenAiDeviceType.desktop when _desktopHeight != null:
          _flutterView!.style.height = '${_desktopHeight}px';
        case OpenAiDeviceType.unknown when _unknownDeviceHeight != null:
          _flutterView!.style.height = '${_unknownDeviceHeight}px';
        // in other cases, no height set
        // ignore: no_default_cases
        default: // no height set
      }
    }
  }

  static double? _desktopHeight;
  static double? _mobileHeight;
  static double? _tabletHeight;
  static double? _unknownDeviceHeight;
  static HTMLElement? _flutterView;

  /// Internal helper to convert JavaScript globals to Dart types.
  PartialOpenAiGlobals _globalsFromJS(JSPartialOpenAiGlobals globals) =>
      PartialOpenAiGlobals(
        theme: globals.theme.toOpenAiTheme(),
        locale: globals.locale?.toDart,
        maxHeight: globals.maxHeight?.toDartDouble,
        displayMode: globals.displayMode.toOpenAiDisplayMode(),
        safeArea: globals.safeArea?.toOpenAiSafeArea(),
        userAgent: globals.userAgent?.toUserAgent(),
      );

  // ============================================================================
  // API Methods
  // ============================================================================

  /// Invokes a tool on your Model Context Protocol (MCP) server.
  ///
  /// This method calls a backend tool defined in your MCP server configuration
  /// and returns the result as a string. The tool must be registered in your
  /// MCP server and the name must match exactly.
  ///
  /// ## Parameters
  /// - [name]: The name of the tool to invoke (case-sensitive)
  /// - [args]: A map of arguments to pass to the tool, matching the tool's schema
  ///
  /// ## Returns
  /// A [Future] that resolves to the tool's result as a string. Typically this
  /// will be a JSON-encoded string that you'll need to parse.
  ///
  /// ## Example
  /// ```dart
  /// final result = await sdk.callTool(
  ///   'getUserData',
  ///   {'userId': 42, 'includeProfile': true},
  /// );
  /// final data = jsonDecode(result);
  /// print('User name: ${data['name']}');
  /// ```
  ///
  /// ## Throws
  /// - May throw if the tool doesn't exist or if the arguments are invalid
  /// - May throw if the MCP server is unreachable or returns an error
  Future<String> callTool(
    String name,
    Json args,
  ) async {
    final jsArgs = args.jsify()! as JSUnknownObject;
    final promise = _openai.callTool(name.toJS, jsArgs);

    final response = await promise.toDart;
    return response.result.toDart;
  }

  /// Triggers a follow-up message in the ChatGPT conversation.
  ///
  /// This method programmatically sends a message to ChatGPT on behalf of
  /// the user, allowing your app to guide the conversation flow or request
  /// additional information from the AI.
  ///
  /// ## Parameters
  /// - [prompt]: The message text to send to ChatGPT
  ///
  /// ## Returns
  /// A [Future] that completes when the message has been sent.
  ///
  /// ## Example
  /// ```dart
  /// await sdk.sendFollowUpMessage(
  ///   'Can you explain this data in more detail?'
  /// );
  /// ```
  ///
  /// ## Use Cases
  /// - Requesting clarification or additional details
  /// - Guiding the user through a multi-step workflow
  /// - Automatically asking follow-up questions based on user actions
  Future<void> sendFollowUpMessage(String prompt) async {
    final args = JSSendFollowUpMessageArgs(prompt: prompt.toJS);
    await _openai.sendFollowUpMessage(args).toDart;
  }

  /// Opens an external URL in a new browser tab or application.
  ///
  /// This method navigates the user to an external resource while keeping
  /// the ChatGPT session active. The behavior varies by platform.
  ///
  /// ## Parameters
  /// - [href]: The URL to open (must be a valid HTTP or HTTPS URL)
  ///
  /// ## Example
  /// ```dart
  /// sdk.openExternal('https://docs.example.com/api');
  /// ```
  ///
  /// ## Platform Behavior
  /// - **Web**: Opens the URL in a new browser tab
  /// - **Mobile**: May open in an in-app browser or external browser app
  /// - **Desktop**: Opens in the user's default web browser
  ///
  /// ## Security
  /// Only HTTPS URLs are recommended for security. Some platforms may
  /// block non-HTTPS URLs or show security warnings.
  void openExternal(String href) {
    final args = JSOpenExternalArgs(href: href.toJS);
    _openai.openExternal(args);
  }

  /// Requests a change in the app's display mode.
  ///
  /// This method attempts to transition the app between different display
  /// modes (inline, fullscreen, or picture-in-picture). The request may be
  /// denied or modified by the ChatGPT runtime based on platform constraints.
  ///
  /// ## Parameters
  /// - [mode]: The desired display mode to transition to
  ///
  /// ## Returns
  /// A [Future] that resolves to the actually granted display mode, which
  /// may differ from the requested mode if the runtime denied or modified
  /// the request.
  ///
  /// ## Example
  /// ```dart
  /// final grantedMode = await sdk.requestDisplayMode(
  ///   OpenAiDisplayMode.fullscreen,
  /// );
  ///
  /// if (grantedMode == OpenAiDisplayMode.fullscreen) {
  ///   // Successfully transitioned to fullscreen
  ///   print('Now in fullscreen mode');
  /// } else {
  ///   // Request was denied or modified
  ///   print('Could not enter fullscreen, got: $grantedMode');
  /// }
  /// ```
  ///
  /// ## Platform Notes
  /// - On mobile, PiP requests are always coerced to fullscreen
  /// - Some platforms may not support all display modes
  /// - User preferences or system policies may prevent certain transitions
  Future<OpenAiDisplayMode> requestDisplayMode(OpenAiDisplayMode mode) async {
    if (mode == OpenAiDisplayMode.inline) {
      _updateSize();
    }
    final args = JSRequestDisplayModeArgs(
      mode: switch (mode) {
        OpenAiDisplayMode.pip => JSDisplayMode.pip,
        OpenAiDisplayMode.inline => JSDisplayMode.inline,
        OpenAiDisplayMode.fullscreen => JSDisplayMode.fullscreen,
        OpenAiDisplayMode.unknown => JSDisplayMode.inline,
      },
    );
    final response = await _openai.requestDisplayMode(args).toDart;
    return response.mode.toOpenAiDisplayMode()!;
  }

  /// Updates the persistent widget state.
  ///
  /// In widget mode, this method allows you to persist state that survives
  /// across sessions. The state is stored by ChatGPT and can be retrieved
  /// via the [widgetState] getter.
  ///
  /// ## Parameters
  /// - [state]: A map containing the state to persist (must be JSON-serializable)
  ///
  /// ## Returns
  /// A [Future] that completes when the state has been saved.
  ///
  /// ## Example
  /// ```dart
  /// await sdk.setWidgetState({
  ///   'counter': 42,
  ///   'lastUpdated': DateTime.now().toIso8601String(),
  ///   'preferences': {
  ///     'theme': 'dark',
  ///     'notifications': true,
  ///   },
  /// });
  ///
  /// // Later, retrieve the state
  /// final state = sdk.widgetState;
  /// print('Counter value: ${state?['counter']}');
  /// ```
  ///
  /// ## Constraints
  /// - Only available in widget mode
  /// - State must be JSON-serializable (no functions, symbols, etc.)
  /// - Consider size limitations - keep state reasonably small
  /// - State persists across sessions but may be cleared by ChatGPT
  Future<void> setWidgetState(Json state) async {
    final jsState = state.jsify()! as JSUnknownObject;
    await _openai.setWidgetState(jsState).toDart;
  }

  // ============================================================================
  // Reactive Streams
  // ============================================================================

  /// A broadcast stream of all global state changes.
  ///
  /// This stream emits a [PartialOpenAiGlobals] object whenever any global
  /// property changes (theme, locale, displayMode, maxHeight, safeArea, etc.).
  /// Only the properties that changed will be non-null in the emitted object.
  ///
  /// ## Example
  /// ```dart
  /// sdk.globalsStream.listen((globals) {
  ///   if (globals.theme != null) {
  ///     print('Theme changed to: ${globals.theme}');
  ///   }
  ///   if (globals.displayMode != null) {
  ///     print('Display mode changed to: ${globals.displayMode}');
  ///   }
  ///   if (globals.maxHeight != null) {
  ///     print('Max height changed to: ${globals.maxHeight}');
  ///   }
  /// });
  /// ```
  ///
  /// ## Use Cases
  /// - Responding to multiple types of state changes with a single subscription
  /// - Debugging to see all state changes
  /// - Implementing complex state synchronization logic
  ///
  /// For listening to specific properties, consider using [themeStream] or
  /// [displayModeStream] instead for more focused subscriptions.
  Stream<PartialOpenAiGlobals> get globalsStream =>
      window.onSetOpenAIGlobals.map(
        (event) => _globalsFromJS(event.detail!.globals),
      );

  /// A broadcast stream of theme changes.
  ///
  /// This stream emits whenever the ChatGPT theme changes between light and
  /// dark modes. The stream automatically filters out non-theme changes and
  /// deduplicates consecutive identical values.
  ///
  /// ## Example
  /// ```dart
  /// sdk.themeStream.listen((theme) {
  ///   switch (theme) {
  ///     case OpenAiTheme.light:
  ///       // Apply light theme to your app
  ///       break;
  ///     case OpenAiTheme.dark:
  ///       // Apply dark theme to your app
  ///       break;
  ///     case OpenAiTheme.unknown:
  ///       // Fallback to default theme
  ///       break;
  ///   }
  /// });
  /// ```
  ///
  /// ## Usage with Flutter
  /// ```dart
  /// StreamBuilder<OpenAiTheme>(
  ///   stream: sdk.themeStream,
  ///   initialData: sdk.theme,
  ///   builder: (context, snapshot) {
  ///     final isDark = snapshot.data == OpenAiTheme.dark;
  ///     return MaterialApp(
  ///       theme: isDark ? darkTheme : lightTheme,
  ///       // ...
  ///     );
  ///   },
  /// )
  /// ```
  Stream<OpenAiTheme> get themeStream => globalsStream
      .where((globals) => globals.theme != null)
      .map((globals) => globals.theme!)
      .distinct();

  /// A broadcast stream of display mode changes.
  ///
  /// This stream emits whenever the app's display mode changes (e.g., from
  /// inline to fullscreen). The stream automatically filters out non-display
  /// mode changes and deduplicates consecutive identical values.
  ///
  /// ## Example
  /// ```dart
  /// sdk.displayModeStream.listen((mode) {
  ///   switch (mode) {
  ///     case OpenAiDisplayMode.inline:
  ///       // Optimize UI for inline display (limited space)
  ///       break;
  ///     case OpenAiDisplayMode.fullscreen:
  ///       // Expand UI to use full screen
  ///       break;
  ///     case OpenAiDisplayMode.pip:
  ///       // Minimize UI for picture-in-picture
  ///       break;
  ///     case OpenAiDisplayMode.unknown:
  ///       // Use default layout
  ///       break;
  ///   }
  /// });
  /// ```
  ///
  /// ## Use Cases
  /// - Adjusting layout based on available space
  /// - Showing/hiding UI elements based on display mode
  /// - Responding to user-initiated or system-initiated mode changes
  Stream<OpenAiDisplayMode> get displayModeStream => globalsStream
      .where((globals) => globals.displayMode != null)
      .map((globals) => globals.displayMode!)
      .distinct();

  /// A broadcast stream of safe area changes.
  ///
  /// This stream emits whenever the safe area insets change due to device
  /// orientation changes, keyboard appearance/dismissal, or system UI updates.
  /// The stream automatically filters out non-safe area changes and
  /// deduplicates consecutive identical values.
  ///
  /// Safe area insets define the padding needed to avoid overlapping with
  /// system UI elements like notches, rounded corners, status bars, and
  /// navigation bars.
  ///
  /// ## Example
  /// ```dart
  /// sdk.safeAreaStream.listen((safeArea) {
  ///   final insets = safeArea.insets;
  ///   print('Top: ${insets.top}');
  ///   print('Bottom: ${insets.bottom}');
  ///   print('Left: ${insets.left}');
  ///   print('Right: ${insets.right}');
  /// });
  /// ```
  ///
  /// ## Usage with Flutter
  /// ```dart
  /// StreamBuilder<OpenAiSafeArea>(
  ///   stream: sdk.safeAreaStream,
  ///   initialData: sdk.safeAreaInsets != null
  ///       ? OpenAiSafeArea(insets: sdk.safeAreaInsets!)
  ///       : null,
  ///   builder: (context, snapshot) {
  ///     if (!snapshot.hasData) return yourContent;
  ///
  ///     final insets = snapshot.data!.insets;
  ///     return SafeArea(
  ///       minimum: EdgeInsets.only(
  ///         top: insets.top,
  ///         bottom: insets.bottom,
  ///         left: insets.left,
  ///         right: insets.right,
  ///       ),
  ///       child: yourContent,
  ///     );
  ///   },
  /// )
  /// ```
  ///
  /// ## Common Triggers
  /// - Device rotation (portrait ↔ landscape)
  /// - Keyboard appearance or dismissal
  /// - Status bar visibility changes
  /// - Navigation bar changes
  /// - Display mode transitions (inline → fullscreen)
  ///
  /// ## Use Cases
  /// - Dynamically adjusting content padding for system UI
  /// - Repositioning floating action buttons away from notches
  /// - Ensuring text fields remain visible above the keyboard
  /// - Adapting layouts for different device orientations
  Stream<OpenAiSafeArea> get safeAreaStream => globalsStream
      .where((globals) => globals.safeArea != null)
      .map((globals) => globals.safeArea!)
      .distinct();

  /// A broadcast stream of locale changes.
  ///
  /// This stream emits whenever the user's locale preference changes, allowing
  /// your app to dynamically update its localization. The stream automatically
  /// filters out non-locale changes and deduplicates consecutive identical values.
  ///
  /// The locale is typically in the format 'language-Country' (e.g., 'en-US',
  /// 'es-ES', 'fr-FR', 'ja-JP').
  ///
  /// ## Example
  /// ```dart
  /// sdk.localeStream.listen((locale) {
  ///   print('Locale changed to: $locale');
  ///   // Reload app translations
  ///   loadTranslations(locale);
  /// });
  /// ```
  ///
  /// ## Usage with Flutter
  /// ```dart
  /// StreamBuilder<String>(
  ///   stream: sdk.localeStream,
  ///   initialData: sdk.locale,
  ///   builder: (context, snapshot) {
  ///     if (!snapshot.hasData) return yourContent;
  ///
  ///     final locale = snapshot.data!;
  ///     final parts = locale.split('-');
  ///     final languageCode = parts[0];
  ///     final countryCode = parts.length > 1 ? parts[1] : null;
  ///
  ///     return MaterialApp(
  ///       locale: Locale(languageCode, countryCode),
  ///       localizationsDelegates: [...],
  ///       supportedLocales: [...],
  ///       // ...
  ///     );
  ///   },
  /// )
  /// ```
  ///
  /// ## Use Cases
  /// - Dynamically updating app language based on user preference
  /// - Loading locale-specific translations and content
  /// - Formatting dates, numbers, and currencies according to locale
  /// - Adapting UI text direction (LTR/RTL) for languages like Arabic or Hebrew
  Stream<String> get localeStream => globalsStream
      .where((globals) => globals.locale != null)
      .map((globals) => globals.locale!)
      .distinct();

  // ============================================================================
  // Global State Getters
  // ============================================================================

  /// The current theme of the ChatGPT interface.
  ///
  /// Your app should adapt its visual appearance to match this theme for a
  /// seamless integration with ChatGPT. This getter provides immediate access
  /// to the current theme without needing to subscribe to a stream.
  ///
  /// ## Example
  /// ```dart
  /// final theme = sdk.theme;
  /// final isDarkMode = theme == OpenAiTheme.dark;
  /// ```
  ///
  /// For reactive updates, use [themeStream] instead.
  OpenAiTheme get theme => _openai.theme.toOpenAiTheme()!;

  /// The user's preferred locale (e.g., 'en-US', 'es-ES', 'fr-FR').
  ///
  /// Use this to localize your app's content to match the user's language
  /// preference. Returns null if the locale is not available.
  ///
  /// ## Example
  /// ```dart
  /// final locale = sdk.locale;
  /// if (locale != null) {
  ///   print('User locale: $locale');
  ///   // Load appropriate translations
  /// }
  /// ```
  ///
  /// ## Flutter Integration
  /// ```dart
  /// MaterialApp(
  ///   locale: sdk.locale != null ? Locale(sdk.locale!) : null,
  ///   localizationsDelegates: [...],
  ///   // ...
  /// )
  /// ```
  String? get locale => _openai.locale?.toDart;

  /// The maximum height available for your app in pixels.
  ///
  /// Your app should not exceed this height to ensure proper display within
  /// the ChatGPT interface. This value may change dynamically as the user
  /// resizes their window or changes display modes.
  ///
  /// Returns null if no height constraint is set.
  ///
  /// ## Example
  /// ```dart
  /// final maxHeight = sdk.maxHeight;
  /// if (maxHeight != null) {
  ///   print('Max available height: $maxHeight pixels');
  /// }
  /// ```
  ///
  /// ## Flutter Integration
  /// ```dart
  /// Container(
  ///   constraints: BoxConstraints(
  ///     maxHeight: sdk.maxHeight ?? double.infinity,
  ///   ),
  ///   child: yourContent,
  /// )
  /// ```
  double? get maxHeight => _openai.maxHeight?.toDartDouble;

  /// The current display mode of your app.
  ///
  /// Indicates how your app is currently being displayed within ChatGPT.
  /// Possible values are inline, fullscreen, pip, or unknown.
  ///
  /// ## Example
  /// ```dart
  /// final mode = sdk.displayMode;
  /// if (mode == OpenAiDisplayMode.fullscreen) {
  ///   // App is in fullscreen, can use more space
  /// }
  /// ```
  ///
  /// To request a display mode change, use [requestDisplayMode].
  /// For reactive updates, use [displayModeStream].
  OpenAiDisplayMode get displayMode =>
      _openai.displayMode.toOpenAiDisplayMode()!;

  /// The type of device the app is running on.
  ///
  /// Returns the device classification: mobile, tablet, desktop, or unknown.
  /// Use this to optimize your UI for different screen sizes and form factors.
  ///
  /// ## Example
  /// ```dart
  /// final deviceType = sdk.deviceType;
  /// switch (deviceType) {
  ///   case OpenAiDeviceType.mobile:
  ///     // Show mobile-optimized UI
  ///     break;
  ///   case OpenAiDeviceType.tablet:
  ///     // Show tablet-optimized UI
  ///     break;
  ///   case OpenAiDeviceType.desktop:
  ///     // Show desktop-optimized UI
  ///     break;
  ///   default:
  ///     // Fallback to responsive design
  ///     break;
  /// }
  /// ```
  OpenAiDeviceType? get deviceType =>
      _openai.userAgent.device.type.toOpenAiDeviceType();

  /// Whether the device supports hover interactions.
  ///
  /// Returns `true` for devices with mouse or trackpad input (typically
  /// desktop and laptop computers), `false` for touch-only devices.
  ///
  /// Use this to conditionally enable hover effects, tooltips, and other
  /// mouse-specific interactions.
  ///
  /// ## Example
  /// ```dart
  /// if (sdk.hasHoverCapability) {
  ///   // Show hover tooltips and effects
  /// } else {
  ///   // Use tap-based alternatives
  /// }
  /// ```
  bool get hasHoverCapability => _openai.userAgent.capabilities.hover.toDart;

  /// Whether the device supports touch input.
  ///
  /// Returns `true` for touchscreen devices (phones, tablets, touch-enabled
  /// laptops), `false` for devices with only mouse/keyboard input.
  ///
  /// Use this to enable touch gestures and adjust touch target sizes.
  ///
  /// ## Example
  /// ```dart
  /// if (sdk.hasTouchCapability) {
  ///   // Enable touch gestures (swipe, pinch, etc.)
  ///   // Increase touch target sizes (minimum 48x48 dp)
  /// }
  /// ```
  bool get hasTouchCapability => _openai.userAgent.capabilities.touch.toDart;

  /// The safe area insets for proper content positioning.
  ///
  /// Returns the padding needed on each side of your app to avoid overlapping
  /// with system UI elements like notches, rounded corners, status bars, and
  /// navigation bars.
  ///
  /// Returns null if safe area information is not available.
  ///
  /// ## Example
  /// ```dart
  /// final insets = sdk.safeAreaInsets;
  /// if (insets != null) {
  ///   print('Top inset: ${insets.top} pixels');
  ///   print('Bottom inset: ${insets.bottom} pixels');
  /// }
  /// ```
  ///
  /// ## Flutter Integration
  /// ```dart
  /// final insets = sdk.safeAreaInsets;
  /// if (insets != null) {
  ///   return Padding(
  ///     padding: EdgeInsets.only(
  ///       top: insets.top,
  ///       bottom: insets.bottom,
  ///       left: insets.left,
  ///       right: insets.right,
  ///     ),
  ///     child: yourContent,
  ///   );
  /// }
  /// ```
  OpenAiSafeAreaInsets get safeAreaInsets =>
      _openai.safeArea.insets.toOpenAiSafeAreaInsets();

  /// The input parameters passed to your tool when it was invoked.
  ///
  /// This map contains the arguments specified in your tool's schema when
  /// ChatGPT called your tool. Use this to access the parameters that
  /// triggered your app's display.
  ///
  /// ## Example
  /// ```dart
  /// final input = sdk.toolInput;
  /// final userId = input['userId'];
  /// final options = input['options'] as Map<String, dynamic>?;
  /// print('Tool invoked with user ID: $userId');
  /// ```
  ///
  /// ## Tool Schema Example
  /// If your MCP tool is defined as:
  /// ```json
  /// {
  ///   "name": "showUserProfile",
  ///   "parameters": {
  ///     "userId": { "type": "number" },
  ///     "includeDetails": { "type": "boolean" }
  ///   }
  /// }
  /// ```
  ///
  /// Then `toolInput` might contain:
  /// ```dart
  /// {'userId': 42, 'includeDetails': true}
  /// ```
  Json get toolInput => _openai.toolInput.toMap();

  /// Output from the MCP tool that triggered the app to be displayed.
  ///
  /// This map contains the result returned by the specific MCP tool that
  /// caused ChatGPT to show your app. Use this data to render the
  /// appropriate content in your application.
  ///
  /// Returns null if the tool hasn't produced output yet.
  ///
  /// Note: Only the tool that triggered the app display will have its
  /// output available here, not outputs from other tools in your MCP server.
  ///
  /// ## Example
  /// ```dart
  /// final output = sdk.toolOutput;
  /// if (output != null) {
  ///   final result = output['result'];
  ///   print('Tool output: $result');
  /// }
  /// ```
  Json? get toolOutput => _openai.toolOutput?.toMap();

  /// Metadata associated with the tool response.
  ///
  /// Contains additional information about how the tool execution was
  /// processed, including timing, errors, or other contextual data.
  ///
  /// Returns null if no metadata is available.
  ///
  /// ## Example
  /// ```dart
  /// final metadata = sdk.toolResponseMetadata;
  /// if (metadata != null) {
  ///   final executionTime = metadata['executionTime'];
  ///   print('Tool took $executionTime ms to execute');
  /// }
  /// ```
  Json? get toolResponseMetadata => _openai.toolResponseMetadata?.toMap();

  /// The persistent widget state.
  ///
  /// In widget mode, this contains state that persists across sessions.
  /// Use [setWidgetState] to update this value.
  ///
  /// Returns null if:
  /// - The app is not in widget mode
  /// - No state has been set yet
  /// - The state was cleared by ChatGPT
  ///
  /// ## Example
  /// ```dart
  /// // Restore state on app start
  /// final state = sdk.widgetState;
  /// if (state != null) {
  ///   final counter = state['counter'] ?? 0;
  ///   final lastUpdated = state['lastUpdated'];
  ///   print('Restored counter: $counter');
  /// }
  ///
  /// // Update state
  /// await sdk.setWidgetState({
  ///   'counter': counter + 1,
  ///   'lastUpdated': DateTime.now().toIso8601String(),
  /// });
  /// ```
  ///
  /// ## Best Practices
  /// - Keep state small and focused
  /// - Always handle null case (state may be cleared)
  /// - Use JSON-serializable types only
  /// - Consider state versioning for schema changes
  Json? get widgetState => _openai.widgetState?.toMap();
}

// ============================================================================
// Type Aliases
// ============================================================================

/// Type alias for JSON-serializable maps.
///
/// Used throughout the SDK to represent JSON data structures that can be
/// passed between Dart and JavaScript.
typedef Json = Map<String, dynamic>;

// ============================================================================
// Internal Type Conversion Extensions
// ============================================================================

/// Extension to convert JavaScript theme values to Dart [OpenAiTheme] enum.
extension _JSThemeToOpenAiTheme on JSTheme? {
  /// Converts a [JSTheme] to [OpenAiTheme].
  ///
  /// Returns [OpenAiTheme.unknown] if the theme value is not recognized.
  /// Returns null if this is null.
  OpenAiTheme? toOpenAiTheme() {
    if (this == null) return null;
    return OpenAiTheme.values.firstWhere(
      (e) => e.data == this!.toDart,
      orElse: () => OpenAiTheme.unknown,
    );
  }
}

/// Extension to convert JavaScript display mode to Dart [OpenAiDisplayMode] enum.
extension _JSDisplayModeToOpenAiDisplayMode on JSDisplayMode? {
  /// Converts a [JSDisplayMode] to [OpenAiDisplayMode].
  ///
  /// Returns [OpenAiDisplayMode.unknown] if the mode is not recognized.
  /// Returns null if this is null.
  OpenAiDisplayMode? toOpenAiDisplayMode() {
    if (this == null) return null;
    return OpenAiDisplayMode.values.firstWhere(
      (e) => e.data == this!.toDart,
      orElse: () => OpenAiDisplayMode.unknown,
    );
  }
}

/// Extension to convert JavaScript device type to Dart [OpenAiDeviceType] enum.
extension _JSDeviceTypeToOpenAiDeviceType on JSDeviceType? {
  /// Converts a [JSDeviceType] to [OpenAiDeviceType].
  ///
  /// Returns [OpenAiDeviceType.unknown] if the device type is not recognized.
  /// Returns null if this is null.
  OpenAiDeviceType? toOpenAiDeviceType() {
    if (this == null) return null;
    return OpenAiDeviceType.values.firstWhere(
      (e) => e.data == this!.toDart,
      orElse: () => OpenAiDeviceType.unknown,
    );
  }
}

/// Extension to convert JavaScript safe area insets to Dart [OpenAiSafeAreaInsets].
extension _JSSafeAreaInsetsToOpenAiSafeAreaInsets on JSSafeAreaInsets {
  /// Converts [JSSafeAreaInsets] to [OpenAiSafeAreaInsets].
  ///
  /// Extracts the numeric inset values from JavaScript and converts them
  /// to Dart doubles.
  OpenAiSafeAreaInsets toOpenAiSafeAreaInsets() => OpenAiSafeAreaInsets(
    top: top.toDartDouble,
    bottom: bottom.toDartDouble,
    left: left.toDartDouble,
    right: right.toDartDouble,
  );
}

/// Extension to convert JavaScript safe area to Dart [OpenAiSafeArea].
extension _JSSafeAreaToOpenAiSafeArea on JSSafeArea {
  /// Converts [JSSafeArea] to [OpenAiSafeArea].
  ///
  /// Recursively converts the nested insets object.
  OpenAiSafeArea toOpenAiSafeArea() => OpenAiSafeArea(
    insets: insets.toOpenAiSafeAreaInsets(),
  );
}

/// Extension to convert JavaScript user agent to Dart [UserAgent].
extension _JSUserAgentToUserAgent on JSUserAgent {
  /// Converts [JSUserAgent] to [UserAgent].
  ///
  /// Recursively converts the nested device and capabilities objects.
  UserAgent toUserAgent() => UserAgent(
    device: device.toUserAgentDevice(),
    capabilities: capabilities.toUserAgentCapabilities(),
  );
}

/// Extension to convert JavaScript user agent capabilities to Dart [UserAgentCapabilities].
extension _JSUserAgentCapabilitiesToCapabilities on JSUserAgentCapabilities {
  /// Converts [JSUserAgentCapabilities] to [UserAgentCapabilities].
  ///
  /// Extracts boolean capability flags from JavaScript.
  UserAgentCapabilities toUserAgentCapabilities() => UserAgentCapabilities(
    hover: hover.toDart,
    touch: touch.toDart,
  );
}

/// Extension to convert JavaScript user agent device to Dart [UserAgentDevice].
extension _JSUserAgentDeviceToUserAgentDevice on JSUserAgentDevice {
  /// Converts [JSUserAgentDevice] to [UserAgentDevice].
  ///
  /// Converts the device type enum to its Dart equivalent.
  UserAgentDevice toUserAgentDevice() => UserAgentDevice(
    type: type.toOpenAiDeviceType()!,
  );
}
