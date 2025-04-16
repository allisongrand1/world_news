import 'package:world_news/features/news/data/data_base/news_database.dart';
import 'package:world_news/features/news/domain/models/comment.dart';

extension CommentTableDataMapper on List<CommentsTableData> {
  List<Comment> fromSqlList() {
    return map((comment) => comment.fromSql()).toList();
  }
}

extension NewsTableDataMapper on CommentsTableData {
  Comment fromSql() {
    return Comment(id: id, name: name, comment: comment, createdAt: createdAt, newsId: newsId);
  }
}
