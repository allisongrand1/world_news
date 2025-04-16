import 'package:world_news/core/di/providers/data_source_providers.dart';
import 'package:world_news/core/di/providers/data_storage_providers.dart';
import 'package:world_news/core/di/providers/notifier_providers.dart';
import 'package:world_news/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:world_news/features/auth/domain/repositories/auth_repository.dart';
import 'package:world_news/features/news/data/repository/news_repository_impl.dart';
import 'package:world_news/features/news/domain/repositories/news_repository.dart';

class RepositoryProviders {
  final AuthRepository authRepository;
  final NewsRepository newsRepository;
  RepositoryProviders._({required this.authRepository, required this.newsRepository});

  factory RepositoryProviders.base(
    DataSourceProviders dataSourceProviders,
    DataStorageProviders dataStorageProviders,
    NotifierProviders notifierProviders,
  ) {
    return RepositoryProviders._(
      authRepository: AuthRepositoryImpl(
        authDataBase: dataStorageProviders.authDataBase,
        authNotifier: notifierProviders.authNotifier,
      ),
      newsRepository: NewsRepositoryImpl(
        newsDataBase: dataStorageProviders.newsDataBase,
        newsDataSource: dataSourceProviders.newsDataSource,
      ),
    );
  }
}
