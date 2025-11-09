// dart format off
// coverage:ignore-file

// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get counterAppBarTitle => 'Counter';

  @override
  String get homeAppBarTitle => 'OpenAI Apps SDK Demo';

  @override
  String get displayModeTitle => 'Display Mode';

  @override
  String get displayModeInline => 'Inline';

  @override
  String get displayModeFullscreen => 'Fullscreen';

  @override
  String get displayModePip => 'PiP';

  @override
  String displayModeCurrent(String mode) {
    return 'Current: $mode';
  }

  @override
  String get actionsTitle => 'Actions';

  @override
  String get sendFollowUpMessage => 'Send Follow-up Message(Ask chatgpt for the time)';

  @override
  String get callMcpTool => 'Call MCP Tool(Get a random number)';

  @override
  String get toolResult => 'Tool Result:';

  @override
  String get openExternalLink => 'Open External Link (Open flutter official website)';

  @override
  String get updateWidgetState => 'Update Widget State (Save the current time in the widget state)';

  @override
  String get currentWidgetState => 'Current Widget State:';

  @override
  String get widgetStateUpdated => 'Widget state updated!';

  @override
  String errorMessage(String error) {
    return 'Error: $error';
  }

  @override
  String get openAiGlobalsTitle => 'OpenAI Globals';

  @override
  String get globalTheme => 'Theme';

  @override
  String get globalLocale => 'Locale';

  @override
  String get globalDeviceType => 'Device Type';

  @override
  String get globalDisplayMode => 'Display Mode';

  @override
  String get globalMaxHeight => 'Max Height';

  @override
  String get globalHoverCapability => 'Hover Capability';

  @override
  String get globalTouchCapability => 'Touch Capability';

  @override
  String get globalSafeAreaTop => 'Safe Area Top';

  @override
  String get globalSafeAreaBottom => 'Safe Area Bottom';

  @override
  String get globalSafeAreaLeft => 'Safe Area Left';

  @override
  String get globalSafeAreaRight => 'Safe Area Right';

  @override
  String get globalWidgetState => 'Widget State';

  @override
  String get globalToolInput => 'Tool Input';

  @override
  String get globalToolOutput => 'Tool Output';

  @override
  String get noToolCalledYet => 'No tool called yet';

  @override
  String get notAvailable => 'N/A';
}
