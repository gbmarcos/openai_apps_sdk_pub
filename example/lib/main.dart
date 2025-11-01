import 'package:example/bootstrap.dart';
import 'package:example/src/core/cubits/cubits.dart';
import 'package:example/src/features/counter/counter.dart';
import 'package:example/src/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openai_apps_sdk/openai_apps_sdk.dart';

Future<void> main() async {
  await bootstrap(() => const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => OpenAiThemeCubit()),
        BlocProvider(create: (_) => OpenAiDisplayModeCubit()),
      ],
      child: BlocBuilder<OpenAiThemeCubit, OpenAiTheme>(
        builder: (context, openAiTheme) {
          return MaterialApp(
            theme: ThemeData(
              appBarTheme: AppBarTheme(
                backgroundColor: Theme.of(context).colorScheme.inversePrimary,
              ),
              useMaterial3: true,
            ),
            darkTheme: ThemeData.dark(useMaterial3: true),
            themeMode: switch (openAiTheme) {
              OpenAiTheme.light => ThemeMode.light,
              OpenAiTheme.dark => ThemeMode.dark,
              _ => null,
            },
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            home: const CounterPage(),
          );
        },
      ),
    );
  }
}
