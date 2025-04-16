import 'package:world_news/core/common/infrastructure.dart';
import 'package:world_news/features/news/data/data_source/news_data_source.dart';
import 'package:world_news/features/news/data/data_source/news_data_source_impl.dart';

class DataSourceProviders {
  final NewsDataSource newsDataSource;

  DataSourceProviders._({required this.newsDataSource});

  factory DataSourceProviders.base(Infrastructure infrastructure) {
    return DataSourceProviders._(newsDataSource: NewsDataSourceImpl(dio: infrastructure.dio));
  }
}
