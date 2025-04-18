typedef Routes = ({String name, String path});

abstract class AppRoutes {
  static Routes authentication = (name: 'auth', path: '/auth');

  static Routes news = (name: 'news', path: '/');

  static Routes detailNews = (name: 'detailNews', path: '/detailNews/:id');

  static List<String> routes = [authentication.path, news.path, detailNews.path];
}
