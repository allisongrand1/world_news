// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_database.dart';

// ignore_for_file: type=lint
class $AuthTableTable extends AuthTable
    with TableInfo<$AuthTableTable, AuthTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AuthTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _loginMeta = const VerificationMeta('login');
  @override
  late final GeneratedColumn<String> login = GeneratedColumn<String>(
    'login',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _passwordMeta = const VerificationMeta(
    'password',
  );
  @override
  late final GeneratedColumn<String> password = GeneratedColumn<String>(
    'password',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [login, password];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'auth_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<AuthTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('login')) {
      context.handle(
        _loginMeta,
        login.isAcceptableOrUnknown(data['login']!, _loginMeta),
      );
    } else if (isInserting) {
      context.missing(_loginMeta);
    }
    if (data.containsKey('password')) {
      context.handle(
        _passwordMeta,
        password.isAcceptableOrUnknown(data['password']!, _passwordMeta),
      );
    } else if (isInserting) {
      context.missing(_passwordMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {login};
  @override
  AuthTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AuthTableData(
      login:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}login'],
          )!,
      password:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}password'],
          )!,
    );
  }

  @override
  $AuthTableTable createAlias(String alias) {
    return $AuthTableTable(attachedDatabase, alias);
  }
}

class AuthTableData extends DataClass implements Insertable<AuthTableData> {
  final String login;
  final String password;
  const AuthTableData({required this.login, required this.password});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['login'] = Variable<String>(login);
    map['password'] = Variable<String>(password);
    return map;
  }

  AuthTableCompanion toCompanion(bool nullToAbsent) {
    return AuthTableCompanion(login: Value(login), password: Value(password));
  }

  factory AuthTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AuthTableData(
      login: serializer.fromJson<String>(json['login']),
      password: serializer.fromJson<String>(json['password']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'login': serializer.toJson<String>(login),
      'password': serializer.toJson<String>(password),
    };
  }

  AuthTableData copyWith({String? login, String? password}) => AuthTableData(
    login: login ?? this.login,
    password: password ?? this.password,
  );
  AuthTableData copyWithCompanion(AuthTableCompanion data) {
    return AuthTableData(
      login: data.login.present ? data.login.value : this.login,
      password: data.password.present ? data.password.value : this.password,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AuthTableData(')
          ..write('login: $login, ')
          ..write('password: $password')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(login, password);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AuthTableData &&
          other.login == this.login &&
          other.password == this.password);
}

class AuthTableCompanion extends UpdateCompanion<AuthTableData> {
  final Value<String> login;
  final Value<String> password;
  final Value<int> rowid;
  const AuthTableCompanion({
    this.login = const Value.absent(),
    this.password = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AuthTableCompanion.insert({
    required String login,
    required String password,
    this.rowid = const Value.absent(),
  }) : login = Value(login),
       password = Value(password);
  static Insertable<AuthTableData> custom({
    Expression<String>? login,
    Expression<String>? password,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (login != null) 'login': login,
      if (password != null) 'password': password,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AuthTableCompanion copyWith({
    Value<String>? login,
    Value<String>? password,
    Value<int>? rowid,
  }) {
    return AuthTableCompanion(
      login: login ?? this.login,
      password: password ?? this.password,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (login.present) {
      map['login'] = Variable<String>(login.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AuthTableCompanion(')
          ..write('login: $login, ')
          ..write('password: $password, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AuthDataBase extends GeneratedDatabase {
  _$AuthDataBase(QueryExecutor e) : super(e);
  $AuthDataBaseManager get managers => $AuthDataBaseManager(this);
  late final $AuthTableTable authTable = $AuthTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [authTable];
}

typedef $$AuthTableTableCreateCompanionBuilder =
    AuthTableCompanion Function({
      required String login,
      required String password,
      Value<int> rowid,
    });
typedef $$AuthTableTableUpdateCompanionBuilder =
    AuthTableCompanion Function({
      Value<String> login,
      Value<String> password,
      Value<int> rowid,
    });

class $$AuthTableTableFilterComposer
    extends Composer<_$AuthDataBase, $AuthTableTable> {
  $$AuthTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get login => $composableBuilder(
    column: $table.login,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get password => $composableBuilder(
    column: $table.password,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AuthTableTableOrderingComposer
    extends Composer<_$AuthDataBase, $AuthTableTable> {
  $$AuthTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get login => $composableBuilder(
    column: $table.login,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get password => $composableBuilder(
    column: $table.password,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AuthTableTableAnnotationComposer
    extends Composer<_$AuthDataBase, $AuthTableTable> {
  $$AuthTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get login =>
      $composableBuilder(column: $table.login, builder: (column) => column);

  GeneratedColumn<String> get password =>
      $composableBuilder(column: $table.password, builder: (column) => column);
}

class $$AuthTableTableTableManager
    extends
        RootTableManager<
          _$AuthDataBase,
          $AuthTableTable,
          AuthTableData,
          $$AuthTableTableFilterComposer,
          $$AuthTableTableOrderingComposer,
          $$AuthTableTableAnnotationComposer,
          $$AuthTableTableCreateCompanionBuilder,
          $$AuthTableTableUpdateCompanionBuilder,
          (
            AuthTableData,
            BaseReferences<_$AuthDataBase, $AuthTableTable, AuthTableData>,
          ),
          AuthTableData,
          PrefetchHooks Function()
        > {
  $$AuthTableTableTableManager(_$AuthDataBase db, $AuthTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$AuthTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$AuthTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$AuthTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> login = const Value.absent(),
                Value<String> password = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AuthTableCompanion(
                login: login,
                password: password,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String login,
                required String password,
                Value<int> rowid = const Value.absent(),
              }) => AuthTableCompanion.insert(
                login: login,
                password: password,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AuthTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AuthDataBase,
      $AuthTableTable,
      AuthTableData,
      $$AuthTableTableFilterComposer,
      $$AuthTableTableOrderingComposer,
      $$AuthTableTableAnnotationComposer,
      $$AuthTableTableCreateCompanionBuilder,
      $$AuthTableTableUpdateCompanionBuilder,
      (
        AuthTableData,
        BaseReferences<_$AuthDataBase, $AuthTableTable, AuthTableData>,
      ),
      AuthTableData,
      PrefetchHooks Function()
    >;

class $AuthDataBaseManager {
  final _$AuthDataBase _db;
  $AuthDataBaseManager(this._db);
  $$AuthTableTableTableManager get authTable =>
      $$AuthTableTableTableManager(_db, _db.authTable);
}
