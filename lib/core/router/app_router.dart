import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:world_news/core/common/notifier/auth_notifier.dart';
import 'package:world_news/core/router/routes.dart';
import 'package:world_news/features/auth/presentation/screens/auth_screen.dart';
import 'package:world_news/features/news/presentation/screens/detail_news_screen.dart';
import 'package:world_news/features/news/presentation/screens/news_screen.dart';

class AppRouter {
  static GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'rootNavigatorKey');
  static GlobalKey<NavigatorState> mainNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'mainNavigatorKey');

  static GoRouter routerConfig(AuthNotifier authNotifier, SharedPreferences prefs) {
    final storedRoute = prefs.getString('lastRoute');

    final lastRoute =
        AppRoutes.routes.any((path) => storedRoute?.startsWith(path) ?? false) ? storedRoute! : AppRoutes.news.path;
    return GoRouter(
      initialLocation: lastRoute,
      navigatorKey: rootNavigatorKey,
      observers: [
        GoRouterObserver(
          onNavigate: (location) {
            prefs.setString('lastRoute', location);
          },
        ),
      ],
      refreshListenable: authNotifier,
      redirect: (context, state) {
        final isAuth = authNotifier.isAuthenticated;
        final isLoading = authNotifier.isAuthLoading;
        final loggingIn = state.uri.path == AppRoutes.authentication.path;

        if (isLoading) return null;

        if (!isAuth && !loggingIn) return AppRoutes.authentication.path;
        if (isAuth && loggingIn) return AppRoutes.news.path;

        return null;
      },
      routes: [
        GoRoute(
          path: AppRoutes.authentication.path,
          name: AppRoutes.authentication.name,
          builder: (context, state) => const AuthScreen(),
        ),
        GoRoute(path: AppRoutes.news.path, name: AppRoutes.news.name, builder: (context, state) => const NewsScreen()),
        GoRoute(
          path: AppRoutes.detailNews.path,
          name: AppRoutes.detailNews.name,
          builder: (context, state) {
            final id = int.parse(state.pathParameters['id'] ?? '1');
            final scroll = state.extra as bool? ?? false;
            return DetailNewsScreen(id: id, scrollToComment: scroll);
          },
        ),
      ],
    );
  }
}

class GoRouterObserver extends NavigatorObserver {
  final void Function(String route) onNavigate;

  GoRouterObserver({required this.onNavigate});

  @override
  void didPush(Route route, Route? previousRoute) {
    final name = route.settings.name ?? route.settings.arguments.toString();
    onNavigate(name);
  }
}
