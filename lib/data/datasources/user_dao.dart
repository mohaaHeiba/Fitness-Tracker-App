import 'package:fitness_tracker_app/domain/entitys/user_entity.dart';
import 'package:floor/floor.dart';

@dao
abstract class UserDao {
  @insert
  Future<int> insertUser(UserEntity userentity);

  @Query('select *from user limit 1')
  Future<UserEntity?> getUser();

  @delete
  Future<int> deleteUser(UserEntity userentity);
}
