// dart format off
// coverage:ignore-file

// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get counterAppBarTitle => 'Contador';

  @override
  String get homeAppBarTitle => 'Demo de OpenAI Apps SDK';

  @override
  String get displayModeTitle => 'Modo de Visualización';

  @override
  String get displayModeInline => 'En línea';

  @override
  String get displayModeFullscreen => 'Pantalla completa';

  @override
  String get displayModePip => 'PiP';

  @override
  String displayModeCurrent(String mode) {
    return 'Actual: $mode';
  }

  @override
  String get actionsTitle => 'Acciones';

  @override
  String get sendFollowUpMessage => 'Enviar mensaje de seguimiento (Preguntar a chatgpt por la hora)';

  @override
  String get callMcpTool => 'Llamar herramienta MCP (Obtener un número aleatorio)';

  @override
  String get toolResult => 'Resultado de la herramienta:';

  @override
  String get openExternalLink => 'Abrir enlace externo (Abrir sitio web oficial de Flutter)';

  @override
  String get updateWidgetState => 'Actualizar estado del widget (Guardar la hora actual en el estado del widget)';

  @override
  String get currentWidgetState => 'Estado actual del widget:';

  @override
  String get widgetStateUpdated => '¡Estado del widget actualizado!';

  @override
  String errorMessage(String error) {
    return 'Error: $error';
  }

  @override
  String get openAiGlobalsTitle => 'Variables globales de OpenAI';

  @override
  String get globalTheme => 'Tema';

  @override
  String get globalLocale => 'Idioma';

  @override
  String get globalDeviceType => 'Tipo de dispositivo';

  @override
  String get globalDisplayMode => 'Modo de visualización';

  @override
  String get globalMaxHeight => 'Altura máxima';

  @override
  String get globalHoverCapability => 'Capacidad de hover';

  @override
  String get globalTouchCapability => 'Capacidad táctil';

  @override
  String get globalSafeAreaTop => 'Área segura superior';

  @override
  String get globalSafeAreaBottom => 'Área segura inferior';

  @override
  String get globalSafeAreaLeft => 'Área segura izquierda';

  @override
  String get globalSafeAreaRight => 'Área segura derecha';

  @override
  String get globalWidgetState => 'Estado del widget';

  @override
  String get globalToolInput => 'Entrada de herramienta';

  @override
  String get globalToolOutput => 'Salida de herramienta';

  @override
  String get noToolCalledYet => 'Aún no se ha llamado ninguna herramienta';

  @override
  String get notAvailable => 'N/D';
}
