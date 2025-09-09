import 'package:dartx/dartx.dart';
import 'package:fitness_tracker_app/domain/entitys/user_entity.dart';
import 'package:fitness_tracker_app/presentation/controllers/init_data_controll.dart';
import 'package:fitness_tracker_app/presentation/widgets/custom_widgets/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DataUserControll extends GetxController {
  final contName = TextEditingController();
  final contAge = TextEditingController();
  final contWeight = TextEditingController();
  final contHeight = TextEditingController();
  final contGender = TextEditingController();
  final gender = ['male', 'female'];
  final isSelectGender = false.obs;

  late final DatabaseController _db;
  final data = Rxn<UserEntity>();

  @override
  void onInit() {
    super.onInit();
    _db = Get.find<DatabaseController>();
  }

  @override
  void onClose() {
    contName.dispose();
    contAge.dispose();
    contWeight.dispose();
    contHeight.dispose();
    contGender.dispose();
    super.onClose();
  }

  Future<UserEntity?> insertData() async {
    // if (contName.text.isEmpty ||
    //     contAge.text.isEmpty ||
    //     contWeight.text.isEmpty ||
    //     contHeight.text.isEmpty ||
    //     contGender.text.isEmpty) {
    //   customSnackBar("Error", "All fields are required", Colors.red);
    //   return null;
    // }

    final user = UserEntity(
      1,
      name: contName.text.trim(),
      age: contAge.text.toInt(),
      gender: contGender.text,
      weight: contWeight.text.toDouble(),
      height: contHeight.text.toDouble(),
    );

    try {
      await _db.userdata.userdao.insertUser(user);
      data.value = user;
      return user;
    } catch (e) {
      customSnackBar("Database Error", e.toString(), Colors.red);
      print(e);
      return null;
    }
  }

  Future<UserEntity?> getData() async {
    try {
      final user = await _db.userdata.userdao.getUser();
      if (user != null) {
        data.value = user;
      }
      return user;
    } catch (e) {
      customSnackBar("Database Error", e.toString(), Colors.red);
      print(e);
      return null;
    }
  }

  Future<UserEntity?> updateUser() async {
    if (data.value != null) {
      final user = UserEntity(
        1,
        name: contName.text.trim(),
        age: contAge.text.toInt(),
        gender: contGender.text,
        weight: contWeight.text.toDouble(),
        height: contHeight.text.toDouble(),
      );
      try {
        await _db.userdata.userdao.updateUser(user);
        data.value = user;
        return user;
      } catch (e) {
        customSnackBar("Error", e.toString(), Colors.red);
        print(e);
        return null;
      }
    } else {
      customSnackBar("Error", "No user data to Update", Colors.red);
      return null;
    }
  }

  Future<void> deleteData() async {
    if (data.value != null) {
      await _db.userdata.userdao.deleteUser(data.value!);
      data.value = null;
      customSnackBar("Success", "User data has been removed", Colors.green);
    } else {
      customSnackBar("Error", "No user data to delete", Colors.red);
    }
  }
}
