sealed class DetailNewsEvents {
  static DetailNewsEvents getDetailInfo(String id) => DetailNewsEvent(id: id);

  static DetailNewsEvents comment({required String id, required String comment}) =>
      CommentNewsEvent(id: id, comment: comment);
}

class DetailNewsEvent extends DetailNewsEvents {
  final String id;

  DetailNewsEvent({required this.id});
}

class CommentNewsEvent extends DetailNewsEvents {
  final String id;
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
