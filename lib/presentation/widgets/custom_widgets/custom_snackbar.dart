import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

void customSnackBar(String title, String content, Color color) {
  Get.showSnackbar(
    GetSnackBar(
      title: title,
      message: content,
      backgroundColor: color,
      duration: Duration(seconds: 3),
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.all(8),
      borderRadius: 10,
    ),
  );
}
