import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:world_news/config/themes/app_theme.dart';
import 'package:world_news/core/di/providers/notifier_providers.dart';
import 'package:world_news/core/router/app_router.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    final authNotifier = context.watch<NotifierProviders>().authNotifier;

    final routerConfig = AppRouter.routerConfig(authNotifier);

    return MaterialApp.router(
      title: 'World News',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.createTheme(AppThemeType.light),
      routerConfig: routerConfig,
    );
  }
}
