import 'package:flutter/widgets.dart';

sealed class RedirectPath {
  String get pathRedirect;

  bool match(String path, BuildContext context);
}

//
// class AuthRedirectPath implements RedirectPath {
//   AuthRedirectPath();
//
//   @override
//   String get pathRedirect => AppRoutes.authentication.path;
//
//   @override
//   bool match(String path, BuildContext context) {
//     final authNotifier = Provider.of<AuthNotifier>(context, listen: false);
//     final isAuthorized = authNotifier.isAuthenticated;
//
//     final isLoggingIn = path == pathRedirect;
//
//     if (isAuthorized && isLoggingIn) {
//       return false;
//     }
//     return true;
//   }
// }
//
// class NewsRedirectPath implements RedirectPath {
//   @override
//   String get pathRedirect => AppRoutes.news.path;
//
//   @override
//   bool match(String path, BuildContext context) {
//     if (path == pathRedirect) {
//       return false;
//     }
//     return true;
//   }
// }
