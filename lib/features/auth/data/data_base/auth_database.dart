import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

import 'auth_table.dart';

part 'auth_database.g.dart';

@DriftDatabase(tables: [AuthTable])
class AuthDataBase extends _$AuthDataBase {
  AuthDataBase([QueryExecutor? executor]) : super(executor ?? _openCollection());

  static QueryExecutor _openCollection() {
    return driftDatabase(name: 'auth_database', native: const DriftNativeOptions());
  }

  @override
  int get schemaVersion => 1;

  Future<List<AuthTableData>> getProfile() => select(authTable).get();

  Future<void> createProfile({required String login, required String password}) async {
    await into(authTable).insert(AuthTableCompanion(login: Value(login), password: Value(password)));
  }

  Future<void> deleteProfile() async {
    await (delete(authTable)).go();
  }
}
