import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:world_news/features/news/data/data_base/comments_table.dart';
import 'package:world_news/features/news/data/data_base/news_table.dart';
import 'package:world_news/features/news/domain/models/news.dart';

part 'news_database.g.dart';

@DriftDatabase(tables: [NewsTable, CommentsTable])
class NewsDataBase extends _$NewsDataBase {
  NewsDataBase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'news_database', native: const DriftNativeOptions());
  }

  Future<List<NewsTableData>> getNews() => select(newsTable).get();

  Future<List<CommentsTableData>> getCommentsByNews(int id) =>
      (select(commentsTable)..where((tbl) => tbl.newsId.equals(id))).get();

  Future<void> saveNews(List<News> news) async {
    await transaction(() async {
      for (var article in news) {
        await into(newsTable).insert(
          NewsTableCompanion(
            id: Value(article.id),
            name: Value(article.name),
            author: Value(article.author),
            title: Value(article.title),
            description: Value(article.description),
            url: Value(article.url),
            urlToImage: Value(article.urlToImage),
            publishedAt: Value(article.publishedAt),
            content: Value(article.content),
          ),
          mode: InsertMode.insertOrReplace,
        );

        await (delete(commentsTable)..where((t) => t.newsId.equals(article.id))).go();
      }

      await batch((batch) {
        for (var article in news) {
          batch.insertAll(
            commentsTable,
            article.comments
                .map(
                  (c) => CommentsTableCompanion(
                    newsId: Value(article.id),
                    comment: Value(c.comment),
                    createdAt: Value(c.createdAt),
                  ),
                )
                .toList(),
          );
        }
      });
    });
  }

  Future<void> clearNews() async {
    await delete(newsTable).go();
    await delete(commentsTable).go();
  }

  Future<List<NewsTableData>> findNewsByQuery(String query) async {
    return await (select(newsTable)..where((tbl) => tbl.title.like('%$query%'))).get();
  }

  Future<NewsTableData> getNewsById(int id) => (select(newsTable)..where((tbl) => tbl.id.equals(id))).getSingle();

  Future<void> addCommentToNews({required int newsId, required String comment, required String name}) {
    return into(commentsTable).insert(
      CommentsTableCompanion(
        newsId: Value(newsId),
        comment: Value(comment),
        createdAt: Value(DateTime.now()),
        name: Value(name),
      ),
    );
  }
}
