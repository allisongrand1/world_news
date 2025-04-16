import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:world_news/core/common/notifier/auth_notifier.dart';
import 'package:world_news/core/router/routes.dart';
import 'package:world_news/features/auth/presentation/screens/auth_screen.dart';
import 'package:world_news/features/news/presentation/screens/detail_news_screen.dart';
import 'package:world_news/features/news/presentation/screens/news_screen.dart';

class AppRouter {
  static GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'rootNavigatorKey');
  static GlobalKey<NavigatorState> mainNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'mainNavigatorKey');

  static routerConfig(AuthNotifier authNotifier) {
    // final redirect = <RedirectPath>[AuthRedirectPath(), NewsRedirectPath()];

    return GoRouter(
      navigatorKey: rootNavigatorKey,
      refreshListenable: authNotifier,
      redirect: (context, state) {
        print('state.path:${state.uri.path}');

        final isAuth = authNotifier.isAuthenticated;
        final loggingIn = state.uri.path == AppRoutes.authentication.path;
        print('isAuth:${isAuth}');
        print('loggingIn:${loggingIn}');
        if (!isAuth && !loggingIn) return AppRoutes.authentication.path;
        if (isAuth && loggingIn) return AppRoutes.news.path;

        return null;
        // print('${state.path}');
        //
        // final path = state.path ?? '';
        //
        // final redirectPath =
        //     redirect
        //         .firstWhere((element) => element.match(path, context), orElse: () => NewsRedirectPath())
        //         .pathRedirect;
        //
        // print('${redirectPath}');
        // return redirectPath;
      },
      routes: [
        GoRoute(
          path: AppRoutes.authentication.path,
          name: AppRoutes.authentication.name,
          builder: (context, state) => const AuthScreen(),
        ),
        GoRoute(
          path: AppRoutes.news.path,
          name: AppRoutes.news.name,
          builder: (context, state) => const NewsScreen(),
          routes: [
            GoRoute(
              path: AppRoutes.detailNews.path,
              name: AppRoutes.detailNews.name,
              builder: (context, state) {
                final id = state.pathParameters['id'] ?? '';

                return DetailNewsScreen(id: id);
              },
            ),
          ],
        ),
      ],
    );
  }
}
