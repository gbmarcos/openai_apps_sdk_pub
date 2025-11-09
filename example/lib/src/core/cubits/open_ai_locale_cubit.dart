import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openai_apps_sdk/openai_apps_sdk.dart';

class OpenAiLocaleCubit extends Cubit<String?> {
  OpenAiLocaleCubit() : super(_openaiAppsBridge.locale) {
    _subscription = _openaiAppsBridge.localeStream.listen(emit);
  }
  static final OpenAiAppsSDKBridge _openaiAppsBridge = OpenAiAppsSDKBridge();

  late final StreamSubscription<String>? _subscription;

  @override
  Future<void> close() async {
    await _subscription?.cancel();
    return super.close();
  }
}
