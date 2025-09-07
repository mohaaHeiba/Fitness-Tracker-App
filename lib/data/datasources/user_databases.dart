import 'package:fitness_tracker_app/data/datasources/user_dao.dart';
import 'package:fitness_tracker_app/domain/entitys/user_entity.dart';
import 'package:floor/floor.dart';
import 'dart:async';

import 'package:sqflite/sqflite.dart' as sqflite;

part 'user_databases.g.dart';

@Database(version: 1, entities: [UserEntity])
abstract class UserDatabases extends FloorDatabase {
  UserDao get userdao;
}
