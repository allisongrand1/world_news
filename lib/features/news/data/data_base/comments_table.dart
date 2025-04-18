import 'package:drift/drift.dart';

class CommentsTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get newsId => integer()();

  TextColumn get name => text()();

  TextColumn get comment => text()();

  DateTimeColumn get createdAt => dateTime()();
}
