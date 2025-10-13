import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:example/counter/counter.dart';
import 'package:example/l10n/l10n.dart';
import 'package:openai_apps_sdk/openai_apps_sdk.dart' hide Theme;
import 'package:ultimate_flutter_icons/ficon.dart';
import 'package:ultimate_flutter_icons/icons/ai.dart';

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
    final openAiSdk = OpenAiClient.fromWindow();

    dynamic getOpenAIDataSafely(dynamic Function() function) {
      try {
        return function();
      } catch (e) {
        return 'Error: $e';
      }
    }

    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.counterAppBarTitle)),
      body: SingleChildScrollView(
        child: FractionallySizedBox(
          widthFactor: 1,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 8,
            children: [
              const CounterText(),
              const Text('OpenAI SDK data:'),
              Text('Theme: ${getOpenAIDataSafely(() => openAiSdk.theme)}'),
              Text('Locale: ${getOpenAIDataSafely(() => openAiSdk.locale)}'),
              Text(
                'Device Type: ${getOpenAIDataSafely(() => openAiSdk.deviceType)}',
              ),
              Text(
                'Max Height: ${getOpenAIDataSafely(() => openAiSdk.maxHeight)}',
              ),
              Text(
                'Display Mode: ${getOpenAIDataSafely(() => openAiSdk.displayMode)}',
              ),
              Text(
                'Has Hover Capability: ${getOpenAIDataSafely(() => openAiSdk.hasHoverCapability)}',
              ),
              Text(
                'Has Touch Capability: ${getOpenAIDataSafely(() => openAiSdk.hasTouchCapability)}',
              ),
              Text(
                'Safe Area Insets: ${getOpenAIDataSafely(() => openAiSdk.safeAreaInsets)}',
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => context.read<CounterCubit>().increment(),
            child: const FIcon(AI.AiOutlinePlus) ,
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            onPressed: () => context.read<CounterCubit>().decrement(),
            child: const FIcon(AI.AiOutlineMinus),
          ),
        ],
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
