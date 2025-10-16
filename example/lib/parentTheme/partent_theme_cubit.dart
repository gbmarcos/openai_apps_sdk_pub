import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openai_apps_sdk/openai_apps_sdk.dart';

class ParentThemeCubit extends Cubit<OpenAiTheme> {
  ParentThemeCubit() : super(OpenAiTheme.light) {
    emit(openaiClient.theme);
    _subscription = openaiClient.themeStream.listen(emit);
  }
  final OpenAiSDK openaiClient = OpenAiSDK.instance;

  StreamSubscription<OpenAiTheme>? _subscription;

  @override
  Future<void> close() async {
    await _subscription?.cancel();
    return super.close();
  }

  void setTheme(OpenAiTheme theme) {
    emit(theme);
  }
}
