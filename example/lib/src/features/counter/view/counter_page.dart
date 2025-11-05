import 'package:example/src/core/cubits/cubits.dart';
import 'package:example/src/core/cubits/open_ai_safe_area_cubit.dart';
import 'package:example/src/features/counter/counter.dart';
import 'package:example/src/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openai_apps_sdk/openai_apps_sdk.dart' hide OpenAiTheme;

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: const CounterView(),
    );
  }
}

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    final openAiBridge = OpenAiAppsSDKBridge();

    final displayMode = context.select(
      (OpenAiDisplayModeCubit cubit) => cubit.state,
    );

    final safeAreaInsets = context.select(
      (OpenAiSafeAreaCubit cubit) => cubit.state,
    );

    final theme = context.select((OpenAiThemeCubit cubit) => cubit.state);

    dynamic getOpenAIDataSafely(dynamic Function() function) {
      try {
        return function();
      } on Exception catch (e) {
        return 'Error: $e';
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.counterAppBarTitle),
      ),
      body: SingleChildScrollView(
        child: FractionallySizedBox(
          widthFactor: 1,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 8,
            children: [
              const CounterText(),
              const Text('OpenAI SDK data:'),
              Text('Theme: $theme'),
              Text(
                'Locale: ${getOpenAIDataSafely(() => openAiBridge.locale)}',
              ),
              Text(
                'Device Type: ${getOpenAIDataSafely(() => openAiBridge.deviceType)}',
              ),
              Text(
                'Max Height: ${getOpenAIDataSafely(() => openAiBridge.maxHeight)}',
              ),
              Text(
                'Display Mode: $displayMode',
              ),
              Text(
                'Has Hover Capability: ${getOpenAIDataSafely(() => openAiBridge.hasHoverCapability)}',
              ),
              Text(
                'Has Touch Capability: ${getOpenAIDataSafely(() => openAiBridge.hasTouchCapability)}',
              ),
              Text(
                'Safe Area Insets: $safeAreaInsets',
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        spacing: 8,
        children: [
          FloatingActionButton(
            onPressed: () =>
                openAiBridge.openExternal('https://www.google.com'),
            child: const Icon(Icons.open_in_new),
          ),
          FloatingActionButton(
            onPressed: openAiBridge.updateSize,
            child: const Icon(Icons.text_snippet_rounded),
          ),
          FloatingActionButton(
            onPressed: () => context.read<CounterCubit>().increment(),
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () => context.read<CounterCubit>().decrement(),
            child: const Icon(Icons.remove),
          ),
        ],
      ),
      // bar to request display mode
      bottomNavigationBar: SafeArea(
        minimum: EdgeInsets.only(
          top: safeAreaInsets.top,
          bottom: safeAreaInsets.bottom,
          left: safeAreaInsets.left,
          right: safeAreaInsets.right,
        ),
        child: BottomNavigationBar(
          onTap: (index) => openAiBridge.requestDisplayMode(switch (index) {
            0 => OpenAiDisplayMode.inline,
            1 => OpenAiDisplayMode.fullscreen,
            2 => OpenAiDisplayMode.pip,
            _ => OpenAiDisplayMode.inline,
          }),

          currentIndex: switch (displayMode) {
            OpenAiDisplayMode.inline => 0,
            OpenAiDisplayMode.fullscreen => 1,
            OpenAiDisplayMode.pip => 2,
            _ => 0,
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.border_all),
              label: 'Inline',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.fullscreen),
              label: 'Fullscreen',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.picture_in_picture),
              label: 'PiP',
            ),
          ],
        ),
      ),
    );
  }
}

class CounterText extends StatelessWidget {
  const CounterText({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final count = context.select((CounterCubit cubit) => cubit.state);
    return Text('$count', style: theme.textTheme.displayLarge);
  }
}
