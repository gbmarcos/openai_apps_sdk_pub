import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:openai_apps_sdk/openai_apps_sdk.dart' as openai_apps_sdk;

class ParentThemeCubit extends Cubit<openai_apps_sdk.Theme?> {

  ParentThemeCubit() : super(openai_apps_sdk.Theme.light) {
    emit(openaiClient.theme);
    listener = openai_apps_sdk.addGlobalsChangeListener((globals) {
      final theme = globals?['theme'] as String?;
      emit(openai_apps_sdk.Theme.fromString(theme ?? 'light'));

      print('theme: $theme');
    });
  }
  final openai_apps_sdk.OpenAiClient openaiClient =
      openai_apps_sdk.OpenAiClient.fromWindow();

  late final openai_apps_sdk.JSExportedDartFunction listener;

  @override
  Future<void> close() {
    openai_apps_sdk.removeGlobalsChangeListener(listener);
    return super.close();
  }

  void setTheme(openai_apps_sdk.Theme theme) {
    emit(theme);
  }
}
