import 'package:example/parentTheme/partent_theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:example/counter/counter.dart';
import 'package:example/l10n/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openai_apps_sdk/openai_apps_sdk.dart' as openai_apps_sdk;

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ParentThemeCubit(),
      child: BlocBuilder<ParentThemeCubit, openai_apps_sdk.Theme?>(
        builder: (context, openAiTheme) {
          return MaterialApp(
            theme: ThemeData(
              appBarTheme: AppBarTheme(
                backgroundColor: Theme.of(context).colorScheme.inversePrimary,
              ),
              useMaterial3: true,
            ),
            darkTheme: ThemeData.dark(
              useMaterial3: true,
            ),

            themeMode: switch (openAiTheme) {
              openai_apps_sdk.Theme.light => ThemeMode.light,
              openai_apps_sdk.Theme.dark => ThemeMode.dark,
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
