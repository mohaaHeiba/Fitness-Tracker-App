import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

void customSnackBar(String title, String content, Color color) {
  GetSnackBar(
    title: title,
    message: content,
    backgroundColor: color,
    duration: Duration(seconds: 3),
  );
}
