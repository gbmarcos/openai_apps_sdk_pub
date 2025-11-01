import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openai_apps_sdk/openai_apps_sdk.dart';

class OpenAiThemeCubit extends Cubit<OpenAiTheme> {
  OpenAiThemeCubit() : super(_openaiAppsBridge.theme) {
    _subscription = _openaiAppsBridge.themeStream.listen(emit);
  }
  static final OpenAiAppsSDKBridge _openaiAppsBridge =
      OpenAiAppsSDKBridge.instance;

  late final StreamSubscription<OpenAiTheme>? _subscription;

  @override
  Future<void> close() async {
    await _subscription?.cancel();
    return super.close();
  }
}
