import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openai_apps_sdk/openai_apps_sdk.dart';

class OpenAiDisplayModeCubit extends Cubit<OpenAiDisplayMode> {
  OpenAiDisplayModeCubit() : super(_openaiAppsBridge.displayMode) {
    _subscription = _openaiAppsBridge.displayModeStream.listen(emit);
  }
  static final OpenAiAppsSDKBridge _openaiAppsBridge =
      OpenAiAppsSDKBridge();

  late final StreamSubscription<OpenAiDisplayMode>? _subscription;

  @override
  Future<void> close() async {
    await _subscription?.cancel();
    return super.close();
  }
}
