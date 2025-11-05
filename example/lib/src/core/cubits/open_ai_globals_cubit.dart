import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openai_apps_sdk/openai_apps_sdk.dart';

class OpenAiGlobalsCubit extends Cubit<PartialOpenAiGlobals?> {
  OpenAiGlobalsCubit() : super(null) {
    _subscription = _openaiAppsBridge.globalsStream.listen(emit);
  }
  static final OpenAiAppsSDKBridge _openaiAppsBridge = OpenAiAppsSDKBridge();

  late final StreamSubscription<PartialOpenAiGlobals>? _subscription;

  @override
  Future<void> close() async {
    await _subscription?.cancel();
    return super.close();
  }
}
