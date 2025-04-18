import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:world_news/core/common/environment/environment.dart';
import 'package:world_news/core/common/shared_pref/shared_prefs_service.dart';

class Infrastructure {
  final Dio dio;
  final SharedPrefsService sharedPrefsService;

  Infrastructure._({required this.dio, required this.sharedPrefsService});

  static Future<Infrastructure> base(SharedPreferences sharedPrefsService) async {
    final sharedPrefs = SharedPrefsService(sharedPrefsService);
    final dio = Dio(Environment.dioBaseOptions);
    return Infrastructure._(dio: dio, sharedPrefsService: sharedPrefs);
  }
}
