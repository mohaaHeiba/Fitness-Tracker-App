// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_databases.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

abstract class $UserDatabasesBuilderContract {
  /// Adds migrations to the builder.
  $UserDatabasesBuilderContract addMigrations(List<Migration> migrations);

  /// Adds a database [Callback] to the builder.
  $UserDatabasesBuilderContract addCallback(Callback callback);

  /// Creates the database and initializes it.
  Future<UserDatabases> build();
}

// ignore: avoid_classes_with_only_static_members
class $FloorUserDatabases {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $UserDatabasesBuilderContract databaseBuilder(String name) =>
      _$UserDatabasesBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $UserDatabasesBuilderContract inMemoryDatabaseBuilder() =>
      _$UserDatabasesBuilder(null);
}

class _$UserDatabasesBuilder implements $UserDatabasesBuilderContract {
  _$UserDatabasesBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  @override
  $UserDatabasesBuilderContract addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  @override
  $UserDatabasesBuilderContract addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  @override
  Future<UserDatabases> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$UserDatabases();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$UserDatabases extends UserDatabases {
  _$UserDatabases([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  UserDao? _userdaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
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
            'CREATE TABLE IF NOT EXISTS `user` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `name` TEXT NOT NULL, `gender` TEXT NOT NULL, `age` INTEGER NOT NULL, `weight` REAL NOT NULL, `height` REAL NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  UserDao get userdao {
    return _userdaoInstance ??= _$UserDao(database, changeListener);
  }
}

class _$UserDao extends UserDao {
  _$UserDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _userEntityInsertionAdapter = InsertionAdapter(
            database,
            'user',
            (UserEntity item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'gender': item.gender,
                  'age': item.age,
                  'weight': item.weight,
                  'height': item.height
                }),
        _userEntityDeletionAdapter = DeletionAdapter(
            database,
            'user',
            ['id'],
            (UserEntity item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'gender': item.gender,
                  'age': item.age,
                  'weight': item.weight,
                  'height': item.height
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<UserEntity> _userEntityInsertionAdapter;

  final DeletionAdapter<UserEntity> _userEntityDeletionAdapter;

  @override
  Future<UserEntity?> getUser() async {
    return _queryAdapter.query('select *from user limit 1',
        mapper: (Map<String, Object?> row) => UserEntity(row['id'] as int?,
            name: row['name'] as String,
            age: row['age'] as int,
            gender: row['gender'] as String,
            weight: row['weight'] as double,
            height: row['height'] as double));
  }

  @override
  Future<int> insertUser(UserEntity userentity) {
    return _userEntityInsertionAdapter.insertAndReturnId(
        userentity, OnConflictStrategy.abort);
  }

  @override
  Future<int> deleteUser(UserEntity userentity) {
    return _userEntityDeletionAdapter.deleteAndReturnChangedRows(userentity);
  }
}
