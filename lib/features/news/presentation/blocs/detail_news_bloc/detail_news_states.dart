import 'package:world_news/features/news/domain/models/comment.dart';
import 'package:world_news/features/news/domain/models/news.dart';

sealed class DetailNewsStates {
  final News detailNews;
  final List<Comment> comments;

  DetailNewsStates({required this.detailNews, required this.comments});
}

class InitDetailNewsState extends DetailNewsStates {
  InitDetailNewsState({required super.detailNews, required super.comments});
}

class LoadingDetailNewsState extends DetailNewsStates {
  LoadingDetailNewsState({required super.detailNews, required super.comments});
}

class LoadedDetailNewsState extends DetailNewsStates {
  LoadedDetailNewsState({required super.detailNews, required super.comments});
}

class ErrorDetailNewsState extends DetailNewsStates {
  final String error;

  ErrorDetailNewsState(this.error, {required super.detailNews, required super.comments});
}

extension DetailNewsStatesExtension<T> on DetailNewsStates {
  T map({
    required T Function() init,
    required T Function() loading,
    required T Function(LoadedDetailNewsState state) loaded,
    required T Function(ErrorDetailNewsState error) error,
  }) {
    return switch (this) {
      InitDetailNewsState _ => init(),
      LoadingDetailNewsState _ => loading(),
      LoadedDetailNewsState state => loaded(state),
      ErrorDetailNewsState state => error(state),
    };
  }
}
