// dart format off
// coverage:ignore-file
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es')
  ];

  /// Text shown in the AppBar of the Counter Page
  ///
  /// In en, this message translates to:
  /// **'Counter'**
  String get counterAppBarTitle;

  /// Text shown in the AppBar of the Home Page
  ///
  /// In en, this message translates to:
  /// **'OpenAI Apps SDK Demo'**
  String get homeAppBarTitle;

  /// Title for the display mode section
  ///
  /// In en, this message translates to:
  /// **'Display Mode'**
  String get displayModeTitle;

  /// Label for inline display mode
  ///
  /// In en, this message translates to:
  /// **'Inline'**
  String get displayModeInline;

  /// Label for fullscreen display mode
  ///
  /// In en, this message translates to:
  /// **'Fullscreen'**
  String get displayModeFullscreen;

  /// Label for picture-in-picture display mode
  ///
  /// In en, this message translates to:
  /// **'PiP'**
  String get displayModePip;

  /// Shows the current display mode
  ///
  /// In en, this message translates to:
  /// **'Current: {mode}'**
  String displayModeCurrent(String mode);

  /// Title for the actions section
  ///
  /// In en, this message translates to:
  /// **'Actions'**
  String get actionsTitle;

  /// Label for send follow-up message button
  ///
  /// In en, this message translates to:
  /// **'Send Follow-up Message(Ask chatgpt for the time)'**
  String get sendFollowUpMessage;

  /// Label for call MCP tool button
  ///
  /// In en, this message translates to:
  /// **'Call MCP Tool(Get a random number)'**
  String get callMcpTool;

  /// Label for tool result section
  ///
  /// In en, this message translates to:
  /// **'Tool Result:'**
  String get toolResult;

  /// Label for open external link button
  ///
  /// In en, this message translates to:
  /// **'Open External Link (Open flutter official website)'**
  String get openExternalLink;

  /// Label for update widget state button
  ///
  /// In en, this message translates to:
  /// **'Update Widget State (Save the current time in the widget state)'**
  String get updateWidgetState;

  /// Label for current widget state section
  ///
  /// In en, this message translates to:
  /// **'Current Widget State:'**
  String get currentWidgetState;

  /// Success message when widget state is updated
  ///
  /// In en, this message translates to:
  /// **'Widget state updated!'**
  String get widgetStateUpdated;

  /// Error message template
  ///
  /// In en, this message translates to:
  /// **'Error: {error}'**
  String errorMessage(String error);

  /// Title for the OpenAI globals section
  ///
  /// In en, this message translates to:
  /// **'OpenAI Globals'**
  String get openAiGlobalsTitle;

  /// Label for theme global
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get globalTheme;

  /// Label for locale global
  ///
  /// In en, this message translates to:
  /// **'Locale'**
  String get globalLocale;

  /// Label for device type global
  ///
  /// In en, this message translates to:
  /// **'Device Type'**
  String get globalDeviceType;

  /// Label for display mode global
  ///
  /// In en, this message translates to:
  /// **'Display Mode'**
  String get globalDisplayMode;

  /// Label for max height global
  ///
  /// In en, this message translates to:
  /// **'Max Height'**
  String get globalMaxHeight;

  /// Label for hover capability global
  ///
  /// In en, this message translates to:
  /// **'Hover Capability'**
  String get globalHoverCapability;

  /// Label for touch capability global
  ///
  /// In en, this message translates to:
  /// **'Touch Capability'**
  String get globalTouchCapability;

  /// Label for safe area top global
  ///
  /// In en, this message translates to:
  /// **'Safe Area Top'**
  String get globalSafeAreaTop;

  /// Label for safe area bottom global
  ///
  /// In en, this message translates to:
  /// **'Safe Area Bottom'**
  String get globalSafeAreaBottom;

  /// Label for safe area left global
  ///
  /// In en, this message translates to:
  /// **'Safe Area Left'**
  String get globalSafeAreaLeft;

  /// Label for safe area right global
  ///
  /// In en, this message translates to:
  /// **'Safe Area Right'**
  String get globalSafeAreaRight;

  /// Label for widget state global
  ///
  /// In en, this message translates to:
  /// **'Widget State'**
  String get globalWidgetState;

  /// Label for tool input global
  ///
  /// In en, this message translates to:
  /// **'Tool Input'**
  String get globalToolInput;

  /// Label for tool output global
  ///
  /// In en, this message translates to:
  /// **'Tool Output'**
  String get globalToolOutput;

  /// Initial message when no tool has been called
  ///
  /// In en, this message translates to:
  /// **'No tool called yet'**
  String get noToolCalledYet;

  /// Text shown when a value is not available
  ///
  /// In en, this message translates to:
  /// **'N/A'**
  String get notAvailable;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'es': return AppLocalizationsEs();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
