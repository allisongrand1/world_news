import 'package:world_news/core/common/infrastructure.dart';
import 'package:world_news/core/di/providers/bloc_providers.dart';
import 'package:world_news/core/di/providers/data_source_providers.dart';
import 'package:world_news/core/di/providers/data_storage_providers.dart';
import 'package:world_news/core/di/providers/notifier_providers.dart';
import 'package:world_news/core/di/providers/repository_providers.dart';
import 'package:world_news/core/di/providers/use_case_providers.dart';

class DIProviders {
  final DataStorageProviders dataStorageProviders;
  final UseCaseProviders useCaseProviders;
  final DataSourceProviders dataSourceProviders;
  final RepositoryProviders repositoryProviders;
  final NotifierProviders notifierProviders;
  final BlocProviders blocProviders;

  DIProviders._({
    required this.dataStorageProviders,
    required this.useCaseProviders,
    required this.dataSourceProviders,
    required this.repositoryProviders,
    required this.notifierProviders,
    required this.blocProviders,
  });

  factory DIProviders.base(Infrastructure infrastructure) {
    final notifierProviders = NotifierProviders.base();
    final dataStorageProviders = DataStorageProviders.base();

    final dataSourceProviders = DataSourceProviders.base(infrastructure);
    final repositoryProviders = RepositoryProviders.base(dataSourceProviders, dataStorageProviders, notifierProviders);
    final useCaseProviders = UseCaseProviders.base(repositoryProviders, notifierProviders);
    final blocProviders = BlocProviders.base(useCaseProviders);

    return DIProviders._(
      dataStorageProviders: dataStorageProviders,
      useCaseProviders: useCaseProviders,
      dataSourceProviders: dataSourceProviders,
      repositoryProviders: repositoryProviders,
      notifierProviders: notifierProviders,
      blocProviders: blocProviders,
    );
  }

  factory DIProviders.test(Infrastructure infrastructure) {
    final notifierProviders = NotifierProviders.base();
    final dataStorageProviders = DataStorageProviders.base();
    final dataSourceProviders = DataSourceProviders.base(infrastructure);
    final repositoryProviders = RepositoryProviders.base(dataSourceProviders, dataStorageProviders, notifierProviders);
    final useCaseProviders = UseCaseProviders.base(repositoryProviders, notifierProviders);
    final blocProviders = BlocProviders.base(useCaseProviders);

    return DIProviders._(
      dataStorageProviders: dataStorageProviders,
      useCaseProviders: useCaseProviders,
      dataSourceProviders: dataSourceProviders,
      repositoryProviders: repositoryProviders,
      notifierProviders: notifierProviders,
      blocProviders: blocProviders,
    );
  }
}
