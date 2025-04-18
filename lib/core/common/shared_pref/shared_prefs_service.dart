import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsService {
  final SharedPreferences prefs;

  SharedPrefsService(this.prefs);

  Future<void> setLastRoute(String route) async {
    await prefs.setString('lastRoute', route);
  }

  String getLastRoute() {
    return prefs.getString('lastRoute') ?? '/';
  }

  Future<void> clear() async {
    await prefs.clear();
  }
}
