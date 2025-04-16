typedef Routes = ({String name, String path});

abstract class AppRoutes {
  static Routes authentication = (name: 'auth', path: '/auth');

  static Routes news = (name: 'news', path: '/news');

  static Routes detailNews = (name: 'detailNews', path: 'detailNews');
}
