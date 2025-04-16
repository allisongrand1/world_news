import 'package:drift/drift.dart';

class NewsTable extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get author => text()();
  TextColumn get title => text()();
  TextColumn get description => text()();
  TextColumn get url => text()();
  TextColumn get urlToImage => text()();
  DateTimeColumn get publishedAt => dateTime()();
  TextColumn get content => text()();

  @override
  Set<Column> get primaryKey => {id};

  @override
  bool get isStrict => true;
}
