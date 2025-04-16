import 'package:world_news/features/news/data/data_base/news_database.dart';
import 'package:world_news/features/news/domain/models/comment.dart';
import 'package:world_news/features/news/domain/models/news.dart';

extension NewsTableDataListMapper on List<NewsTableData> {
  List<News> fromSqlList(List<Comment> comments) {
    return map((news) => news.fromSql(comments)).toList();
  }
}

extension NewsTableDataMapper on NewsTableData {
  News fromSql(List<Comment> comments) {
    return News(
      id: id,
      name: name,
      author: author,
      title: title,
      description: description,
      url: url,
      urlToImage: urlToImage,
      publishedAt: publishedAt,
      content: content,
      comments: comments,
    );
  }
}
