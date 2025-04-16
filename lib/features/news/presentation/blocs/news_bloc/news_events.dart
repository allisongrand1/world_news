sealed class NewsEvents {
  static NewsEvents getNews() => GetNewsEvent();

  static NewsEvents logout() => LogoutEvent();

  static NewsEvents searchNews(String query) => SearchNewsEvent(query: query);
}

class GetNewsEvent extends NewsEvents {}

class LogoutEvent extends NewsEvents {}

class SearchNewsEvent extends NewsEvents {
  final String query;

  SearchNewsEvent({required this.query});
}

extension NewsEventsExtension<T> on NewsEvents {
  T map({
    required T Function(GetNewsEvent) getNews,
    required T Function(LogoutEvent) logout,
    required T Function(SearchNewsEvent) searchNews,
  }) {
    return switch (this) {
      GetNewsEvent event => getNews(event),
      LogoutEvent event => logout(event),
      SearchNewsEvent event => searchNews(event),
    };
  }
}
