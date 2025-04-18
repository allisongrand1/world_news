sealed class DetailNewsEvents {
  static DetailNewsEvents getDetailInfo(int id) => DetailNewsEvent(id: id);

  static DetailNewsEvents comment({required int id, required String comment}) =>
      CommentNewsEvent(id: id, comment: comment);
}

class DetailNewsEvent extends DetailNewsEvents {
  final int id;

  DetailNewsEvent({required this.id});
}

class CommentNewsEvent extends DetailNewsEvents {
  final int id;
  final String comment;

  CommentNewsEvent({required this.id, required this.comment});
}

extension DetailNewsEventsExtension<T> on DetailNewsEvents {
  T map({required T Function(DetailNewsEvent) getDetail, required T Function(CommentNewsEvent) comment}) {
    return switch (this) {
      DetailNewsEvent event => getDetail(event),
      CommentNewsEvent event => comment(event),
    };
  }
}
