import 'package:world_news/features/news/domain/models/news.dart';

abstract class NewsDataSource {
  Future<List<News>> getNews();
}
