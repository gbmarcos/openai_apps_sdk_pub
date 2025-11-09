import 'package:example/bootstrap.dart';
import 'package:example/src/core/cubits/cubits.dart';
import 'package:example/src/l10n/l10n.dart';
import 'package:example/src/routing/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:openai_apps_sdk/openai_apps_sdk.dart';

Future<void> main() async {
  /// Initialize the inline mode size config (experimental)
  OpenAiAppsSDKBridge().initInlineModeSizeConfig(
    desktopHeight: 400,
    mobileHeight: 280,
  );
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
        BlocProvider(create: (_) => OpenAiSafeAreaCubit()),
        BlocProvider(create: (_) => OpenAiLocaleCubit()),
        BlocProvider(create: (_) => OpenAiGlobalsCubit()),
      ],
      child: BlocBuilder<OpenAiLocaleCubit, String?>(
        builder: (context, localeString) {
          
          final locale = _getLocaleFromString(localeString);

          return BlocBuilder<OpenAiThemeCubit, OpenAiTheme>(
            builder: (context, openAiTheme) {
              return MaterialApp.router(
                // theme configuration
                theme: ThemeData(
                  appBarTheme: AppBarTheme(
                    backgroundColor: Theme.of(
                      context,
                    ).colorScheme.inversePrimary,
                  ),
                  useMaterial3: true,
                ),
                darkTheme: ThemeData.dark(useMaterial3: true),
                themeMode: switch (openAiTheme) {
                  OpenAiTheme.light => ThemeMode.light,
                  OpenAiTheme.dark => ThemeMode.dark,
                  _ => null,
                },

                // localization configuration
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                supportedLocales: AppLocalizations.supportedLocales,
                locale: locale,

                // router configuration
                routerConfig: AppRouter.instance.router,
              );
            },
          );
        },
      ),
    );
  }

  Locale? _getLocaleFromString(String? localeString) {
    final parts = localeString?.split('-');

    final locale = switch (parts) {
      [final languageCode, final countryCode] => Locale(
        languageCode,
        countryCode,
      ),

      _ => null,
    };
    return locale;
  }
}
