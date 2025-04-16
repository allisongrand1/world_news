import 'package:world_news/features/auth/data/data_base/auth_database.dart';
import 'package:world_news/features/news/data/data_base/news_database.dart';

class DataStorageProviders {
  final AuthDataBase authDataBase;
  final NewsDataBase newsDataBase;

  DataStorageProviders._({required this.authDataBase, required this.newsDataBase});

  factory DataStorageProviders.base() {
    return DataStorageProviders._(authDataBase: AuthDataBase(), newsDataBase: NewsDataBase());
  }
}
