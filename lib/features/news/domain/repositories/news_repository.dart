import 'package:world_news/features/news/domain/models/comment.dart';
import 'package:world_news/features/news/domain/models/news.dart';

abstract class NewsRepository {
  Future<List<News>> getNews();

  Future<News> getNewsById(int id);

  Future<List<News>> searchByQuery(String query);

  Future<List<Comment>> addCommentToNews({required int newsId, required String comment, required String name});
}
