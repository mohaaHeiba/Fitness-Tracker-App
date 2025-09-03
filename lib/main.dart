import 'package:fitness_tracker_app/app.dart';
import 'package:fitness_tracker_app/presentation/controllers/navigation_controll.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  Get.put(NavigationControll(), permanent: true);
  runApp(const MyApp());
}
