import 'package:world_news/features/news/domain/models/news.dart';

abstract class NewsRepository {
  Future<List<News>> getNews();
  Future<News> getNewsById(String id);
  Future<List<News>> searchByQuery(String query);
  Future<void> addCommentToNews({required String newsId, required String comment, required String name});
}
