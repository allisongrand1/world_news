import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:world_news/core/di/di.dart';
import 'package:world_news/core/di/providers/bloc_providers.dart';
import 'package:world_news/core/di/providers/data_source_providers.dart';
import 'package:world_news/core/di/providers/data_storage_providers.dart';
import 'package:world_news/core/di/providers/notifier_providers.dart';
import 'package:world_news/core/di/providers/repository_providers.dart';
import 'package:world_news/core/di/providers/use_case_providers.dart';
import 'package:world_news/features/auth/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:world_news/features/news/presentation/blocs/detail_news_bloc/detail_news_bloc.dart';
import 'package:world_news/features/news/presentation/blocs/news_bloc/news_bloc.dart';

class ProviderWrapper extends StatefulWidget {
  final DI di;
  final Widget child;

  const ProviderWrapper({super.key, required this.di, required this.child});

  @override
  State<ProviderWrapper> createState() => _ProviderWrapperState();
}

class _ProviderWrapperState extends State<ProviderWrapper> {
  late final DataSourceProviders dataSourceProviders;
  late final RepositoryProviders repositoryProviders;
  late final DataStorageProviders dataStorageProviders;
  late final UseCaseProviders useCaseProviders;
  late final NotifierProviders notifierProviders;
  late final BlocProviders blocProviders;

  @override
  void initState() {
    super.initState();

    initProviders();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<DataSourceProviders>.value(value: dataSourceProviders),
        Provider<RepositoryProviders>.value(value: repositoryProviders),
        Provider<DataStorageProviders>.value(value: dataStorageProviders),
        Provider<UseCaseProviders>.value(value: useCaseProviders),
        Provider<NotifierProviders>.value(value: notifierProviders),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>.value(value: blocProviders.authBloc),
          BlocProvider<NewsBloc>.value(value: blocProviders.newsBloc),
          BlocProvider<DetailNewsBloc>.value(value: blocProviders.detailNewsBloc),
        ],
        child: widget.child,
      ),
    );
  }

  void initProviders() {
    dataSourceProviders = widget.di.providers.dataSourceProviders;
    repositoryProviders = widget.di.providers.repositoryProviders;
    dataStorageProviders = widget.di.providers.dataStorageProviders;
    useCaseProviders = widget.di.providers.useCaseProviders;
    notifierProviders = widget.di.providers.notifierProviders;
    blocProviders = widget.di.providers.blocProviders;

    useCaseProviders.getProfileUseCase.call();
  }
}
