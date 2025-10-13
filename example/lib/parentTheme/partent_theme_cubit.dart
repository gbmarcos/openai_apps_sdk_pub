import 'dart:async';
import 'dart:js_interop';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openai_apps_sdk/openai_apps_sdk.dart' as openai;
import 'package:web/web.dart' as web;

class ParentThemeCubit extends Cubit<openai.Theme?> {
  ParentThemeCubit() : super(openai.Theme.light) {
    emit(openaiClient.theme);
    _subscription = web.window.onSetOpenAIGlobals.listen((event) {
      final theme = event.detail?.globals.theme?.toDart;
      if (theme != null) {
        emit(openai.Theme.fromString(theme));
      }
    });
  }
  final openai.OpenAiClient openaiClient = openai.OpenAiClient.fromWindow();

  StreamSubscription<openai.SetGlobalsEvent>? _subscription;

  @override
  Future<void> close() async {
    await _subscription?.cancel();
    return super.close();
  }

  void setTheme(openai.Theme theme) {
    emit(theme);
  }
}
