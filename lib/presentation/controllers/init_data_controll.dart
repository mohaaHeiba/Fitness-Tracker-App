import 'dart:io';
import 'dart:typed_data';

import 'package:fitness_tracker_app/data/datasources/user_databases.dart';
import 'package:flutter/services.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class DatabaseController extends GetxController {
  late final UserDatabases userdata;

  Future<void> initDatabase() async {
    await _copyDatabase();
    final dir = await getApplicationDocumentsDirectory();
    final dbPath = join(dir.path, 'user.db');

    userdata = await $FloorUserDatabases.databaseBuilder(dbPath).build();
  }

  Future<void> _copyDatabase() async {
    final dir = await getApplicationDocumentsDirectory();
    final path = join(dir.path, 'user.db');

    if (File(path).existsSync()) return;

    ByteData data = await rootBundle.load('assets/data/user.db');
    final bytes = data.buffer.asUint8List(
      data.offsetInBytes,
      data.lengthInBytes,
    );
    await File(path).writeAsBytes(bytes);
  }
}
