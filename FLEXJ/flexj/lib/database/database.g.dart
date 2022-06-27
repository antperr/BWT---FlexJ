// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  DataDao? _dataDaoInstance;

  UserDao? _userDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `User` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `name` TEXT NOT NULL, `email` TEXT NOT NULL, `pw` TEXT NOT NULL)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Data` (`giorno` INTEGER NOT NULL, `steps` INTEGER, `bpm` INTEGER, `sleep` INTEGER, `cal` INTEGER, `obiettivo` INTEGER NOT NULL, `peso` INTEGER, `altezza` INTEGER, `bmi` INTEGER, `index` INTEGER NOT NULL, FOREIGN KEY (`index`) REFERENCES `User` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION, PRIMARY KEY (`giorno`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  DataDao get dataDao {
    return _dataDaoInstance ??= _$DataDao(database, changeListener);
  }

  @override
  UserDao get userDao {
    return _userDaoInstance ??= _$UserDao(database, changeListener);
  }
}

class _$DataDao extends DataDao {
  _$DataDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _dataInsertionAdapter = InsertionAdapter(
            database,
            'Data',
            (Data item) => <String, Object?>{
                  'giorno': _dateTimeConverter.encode(item.giorno),
                  'steps': item.steps,
                  'bpm': item.bpm,
                  'sleep': item.sleep,
                  'cal': item.cal,
                  'obiettivo': item.obiettivo ? 1 : 0,
                  'peso': item.peso,
                  'altezza': item.altezza,
                  'bmi': item.bmi,
                  'index': item.index
                }),
        _dataUpdateAdapter = UpdateAdapter(
            database,
            'Data',
            ['giorno'],
            (Data item) => <String, Object?>{
                  'giorno': _dateTimeConverter.encode(item.giorno),
                  'steps': item.steps,
                  'bpm': item.bpm,
                  'sleep': item.sleep,
                  'cal': item.cal,
                  'obiettivo': item.obiettivo ? 1 : 0,
                  'peso': item.peso,
                  'altezza': item.altezza,
                  'bmi': item.bmi,
                  'index': item.index
                }),
        _dataDeletionAdapter = DeletionAdapter(
            database,
            'Data',
            ['giorno'],
            (Data item) => <String, Object?>{
                  'giorno': _dateTimeConverter.encode(item.giorno),
                  'steps': item.steps,
                  'bpm': item.bpm,
                  'sleep': item.sleep,
                  'cal': item.cal,
                  'obiettivo': item.obiettivo ? 1 : 0,
                  'peso': item.peso,
                  'altezza': item.altezza,
                  'bmi': item.bmi,
                  'index': item.index
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Data> _dataInsertionAdapter;

  final UpdateAdapter<Data> _dataUpdateAdapter;

  final DeletionAdapter<Data> _dataDeletionAdapter;

  @override
  Future<Object?> findMaxCal() async {
    await _queryAdapter.queryNoReturn('SELECT MAX(cal) FROM data');
  }

  @override
  Future<Object?> findMaxSteps() async {
    await _queryAdapter.queryNoReturn('SELECT MAX(steps) FROM data');
  }

  @override
  Future<void> insertdata(Data data) async {
    await _dataInsertionAdapter.insert(data, OnConflictStrategy.abort);
  }

  @override
  Future<void> updatedata(Data data) async {
    await _dataUpdateAdapter.update(data, OnConflictStrategy.replace);
  }

  @override
  Future<void> deletedata(Data data) async {
    await _dataDeletionAdapter.delete(data);
  }
}

class _$UserDao extends UserDao {
  _$UserDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _userInsertionAdapter = InsertionAdapter(
            database,
            'User',
            (User item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'email': item.email,
                  'pw': item.pw
                }),
        _userUpdateAdapter = UpdateAdapter(
            database,
            'User',
            ['id'],
            (User item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'email': item.email,
                  'pw': item.pw
                }),
        _userDeletionAdapter = DeletionAdapter(
            database,
            'User',
            ['id'],
            (User item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'email': item.email,
                  'pw': item.pw
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<User> _userInsertionAdapter;

  final UpdateAdapter<User> _userUpdateAdapter;

  final DeletionAdapter<User> _userDeletionAdapter;

  @override
  Future<List<User>> findAllUser() async {
    return _queryAdapter.queryList('SELECT * FROM table1',
        mapper: (Map<String, Object?> row) => User(
            row['id'] as int?,
            row['name'] as String,
            row['email'] as String,
            row['pw'] as String));
  }

  @override
  Future<void> insertUser(User user) async {
    await _userInsertionAdapter.insert(user, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateUser(User user) async {
    await _userUpdateAdapter.update(user, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteUser(User user) async {
    await _userDeletionAdapter.delete(user);
  }
}

// ignore_for_file: unused_element
final _dateTimeConverter = DateTimeConverter();
