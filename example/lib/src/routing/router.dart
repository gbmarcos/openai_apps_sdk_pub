import 'package:example/src/features/home/home.dart';
import 'package:go_router/go_router.dart';

enum AppRoute {
  home('/');

  final String path;

  const AppRoute(this.path);
}

/// A router for the app.
class AppRouter {
  AppRouter._();

  static final AppRouter instance = AppRouter._();

  final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        name: AppRoute.home.name,
        path: AppRoute.home.path,
        builder: (context, state) => const HomePage(),
      ),
    ],
  );
}
