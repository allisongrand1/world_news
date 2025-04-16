import 'package:drift/drift.dart';

class CommentsTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get newsId => text()();
  TextColumn get name => text()();
  TextColumn get comment => text()();
  DateTimeColumn get createdAt => dateTime()();
}
