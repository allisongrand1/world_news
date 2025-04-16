import 'package:drift/drift.dart';

class AuthTable extends Table {
  TextColumn get login => text()();
  TextColumn get password => text()();

  @override
  Set<Column> get primaryKey => {login};
}
