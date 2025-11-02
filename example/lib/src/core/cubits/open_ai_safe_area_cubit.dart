import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openai_apps_sdk/openai_apps_sdk.dart';

class OpenAiSafeAreaCubit extends Cubit<OpenAiSafeAreaInsets> {
  OpenAiSafeAreaCubit() : super(_openaiAppsBridge.safeAreaInsets) {
    _subscription = _openaiAppsBridge.safeAreaStream
        .map((safeArea) => safeArea.insets)
        .listen(emit);
  }
  static final OpenAiAppsSDKBridge _openaiAppsBridge =
      OpenAiAppsSDKBridge.instance;

  late final StreamSubscription<OpenAiSafeAreaInsets>? _subscription;

  @override
  Future<void> close() async {
    await _subscription?.cancel();
    return super.close();
  }
}
