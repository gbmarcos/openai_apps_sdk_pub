import 'package:example/src/features/counter/counter.dart';
import 'package:go_router/go_router.dart';

enum AppRoute {
  counter('/');

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
        name: AppRoute.counter.name,
        path: AppRoute.counter.path,
        builder: (context, state) => const CounterPage(),
      ),
    ],
  );
}
