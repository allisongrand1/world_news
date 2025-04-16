import 'package:world_news/features/news/domain/models/news.dart';

sealed class NewsStates {
  static NewsStates init() => InitNewsState();

  static NewsStates loading() => LoadingNewsState();

  static NewsStates loaded(List<News> news) => LoadedNewsState(news);

  static NewsStates error(String error) => ErrorNewsState(error);
}

class InitNewsState extends NewsStates {}

class LoadingNewsState extends NewsStates {}

class LoadedNewsState extends NewsStates {
  final List<News> news;

  LoadedNewsState(this.news);
}

class ErrorNewsState extends NewsStates {
  final String error;

  ErrorNewsState(this.error);
}

extension NewsStatesExtension<T> on NewsStates {
  T map({
    required T Function() init,
    required T Function() loading,
    required T Function(LoadedNewsState state) loaded,
    required T Function(ErrorNewsState error) error,
  }) {
    return switch (this) {
      InitNewsState _ => init(),
      LoadingNewsState _ => loading(),
      LoadedNewsState state => loaded(state),
      ErrorNewsState state => error(state),
    };
  }
}
