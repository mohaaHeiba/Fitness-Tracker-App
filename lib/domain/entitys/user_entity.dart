import 'package:floor/floor.dart';

@Entity(tableName: 'user')
class UserEntity {
  @PrimaryKey(autoGenerate: true)
  final int? id;

  final String name, gender;
  final int age;
  final double weight, height;
  UserEntity(
    this.id, {
    required this.name,
    required this.age,
    required this.gender,
    required this.weight,
    required this.height,
  });
}
