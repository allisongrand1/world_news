import 'package:world_news/features/auth/data/data_base/auth_database.dart';
import 'package:world_news/features/auth/data/models/profile.dart';

extension ProfileTableDataMapper on AuthTableData {
  Profile fromSql() {
    return Profile(login: login, password: password);
  }
}
