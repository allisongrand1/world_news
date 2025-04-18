import 'package:world_news/features/news/data/data_base/news_database.dart';
import 'package:world_news/features/news/data/data_source/news_data_source.dart';
import 'package:world_news/features/news/data/mappers/comment_table_data_mapper.dart';
import 'package:world_news/features/news/data/mappers/news_table_data_mapper.dart';
import 'package:world_news/features/news/domain/models/comment.dart';
import 'package:world_news/features/news/domain/models/news.dart';
import 'package:world_news/features/news/domain/repositories/news_repository.dart';

class NewsRepositoryImpl extends NewsRepository {
  final NewsDataBase newsDataBase;
  final NewsDataSource newsDataSource;

  NewsRepositoryImpl({required this.newsDataBase, required this.newsDataSource});

  @override
  Future<List<Comment>> addCommentToNews({required int newsId, required String comment, required String name}) async {
    await newsDataBase.addCommentToNews(newsId: newsId, comment: comment, name: name);

    final comments = await newsDataBase.getCommentsByNews(newsId);

    return comments.fromSqlList();
  }

  @override
  Future<List<News>> getNews() async {
    final savedNews = await newsDataBase.getNews();

    if (savedNews.isEmpty) {
      final remoteNews = await newsDataSource.getNews();
      await newsDataBase.saveNews(remoteNews);
      return remoteNews;
    } else {
      final result = <News>[];
      for (final article in savedNews) {
        final comments = await newsDataBase.getCommentsByNews(article.id);
        result.add(article.fromSql(comments.fromSqlList()));
      }
      return result;
    }
  }

  @override
  Future<News> getNewsById(int id) async {
    final news = await newsDataBase.getNewsById(id);
    final comments = await newsDataBase.getCommentsByNews(id);

    return news.fromSql(comments.fromSqlList());
  }

  @override
  Future<List<News>> searchByQuery(String query) async {
    final savedNews = await newsDataBase.findNewsByQuery(query);
    final result = <News>[];

    for (final article in savedNews) {
      final comments = await newsDataBase.getCommentsByNews(article.id);
      result.add(article.fromSql(comments.fromSqlList()));
    }

    return result;
  }
}
