import 'package:world_news/features/news/domain/models/news.dart';

sealed class DetailNewsStates {
  static DetailNewsStates init() => InitDetailNewsState();

  static DetailNewsStates loading() => LoadingDetailNewsState();

  static DetailNewsStates loaded(News detailNews) => LoadedDetailNewsState(detailNews);

  static DetailNewsStates error(String error) => ErrorDetailNewsState(error);
}

class InitDetailNewsState extends DetailNewsStates {}

class LoadingDetailNewsState extends DetailNewsStates {}

class LoadedDetailNewsState extends DetailNewsStates {
  final News detailNews;

  LoadedDetailNewsState(this.detailNews);
}

class ErrorDetailNewsState extends DetailNewsStates {
  final String error;

  ErrorDetailNewsState(this.error);
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
