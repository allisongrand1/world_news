import 'package:world_news/features/news/data/data_base/news_database.dart';
import 'package:world_news/features/news/data/data_source/news_data_source.dart';
import 'package:world_news/features/news/data/mappers/comment_table_data_mapper.dart';
import 'package:world_news/features/news/data/mappers/news_table_data_mapper.dart';
import 'package:world_news/features/news/domain/models/news.dart';
import 'package:world_news/features/news/domain/repositories/news_repository.dart';

class NewsRepositoryImpl extends NewsRepository {
  final NewsDataBase newsDataBase;
  final NewsDataSource newsDataSource;

  NewsRepositoryImpl({required this.newsDataBase, required this.newsDataSource});

  @override
  Future<void> addCommentToNews({required String newsId, required String comment, required String name}) async {
    await newsDataBase.addCommentToNews(newsId: newsId, comment: comment, name: name);
  }

  @override
  Future<List<News>> getNews() async {
    var news = <News>[];

    final savedNews = await newsDataBase.getNews();

    if (savedNews.isEmpty) {
      news = await newsDataSource.getNews();

      await newsDataBase.saveNews(news);
    } else {
      for (final article in savedNews) {
        final comments = await newsDataBase.getCommentsByNews(article.id);
        news = savedNews.fromSqlList(comments.fromSqlList());
      }
    }
    print(news.length);
    return news;
  }

  @override
  Future<News> getNewsById(String id) async {
    final news = await newsDataBase.getNewsById(id);
    final comments = await newsDataBase.getCommentsByNews(id);

    return news.fromSql(comments.fromSqlList());
  }

  @override
  Future<List<News>> searchByQuery(String query) async {
    var news = <News>[];

    final savedNews = await newsDataBase.findNewsByQuery(query);

    for (final article in news) {
      final comments = await newsDataBase.getCommentsByNews(article.id);
      news = savedNews.fromSqlList(comments.fromSqlList());
    }

    return news;
  }
}
