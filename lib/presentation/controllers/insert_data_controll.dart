import 'package:dartx/dartx.dart';
import 'package:fitness_tracker_app/domain/entitys/user_entity.dart';
import 'package:fitness_tracker_app/presentation/controllers/init_data_controll.dart';
import 'package:fitness_tracker_app/presentation/widgets/custom_widgets/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InsertDataControll extends GetxController {
  final contName = TextEditingController();
  final contAge = TextEditingController();
  final contWeight = TextEditingController();
  final contHeight = TextEditingController();
  final contGender = TextEditingController();

  late final DatabaseController _db;

  @override
  void onInit() {
    super.onInit();
    _db = Get.find<DatabaseController>();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    contName.dispose();
    contAge.dispose();
    contWeight.dispose();
    contHeight.dispose();
    contGender.dispose();
    super.onClose();
  }

  Future<UserEntity?> insertData() async {
    if (contName.text.isEmpty ||
        contAge.text.isEmpty ||
        contWeight.text.isEmpty ||
        contHeight.text.isEmpty ||
        contGender.text.isEmpty) {
      customSnackBar("Error", "All fields are required", Colors.red);
      return null;
    }

    final user = UserEntity(
      1,
      name: contName.text.trim(),
      age: contAge.text.toInt(),
      gender: contGender.text.trim(),
      weight: contWeight.text.toDouble(),
      height: contHeight.text.toDouble(),
    );

    try {
      await _db.userdata.userdao.insertUser(user);
      return user;
    } catch (e) {
      customSnackBar("Database Error", e.toString(), Colors.red);
      print(e);

      return null;
    }
  }
}
