import 'package:fitness_tracker_app/presentation/pages/goals_page.dart';
import 'package:fitness_tracker_app/presentation/pages/history_page.dart';
import 'package:fitness_tracker_app/presentation/pages/home_page.dart';
import 'package:fitness_tracker_app/presentation/pages/maps_page.dart';
import 'package:fitness_tracker_app/presentation/pages/profile_page.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class NavigationControll extends GetxController {
  final index = 2.obs;

  void changeIndex(int i) {
    index.value = i;
  }

  List<Widget> screens = [
    HomePage(),
    MapsPage(),
    GoalsPage(),
    HistoryPage(),
    ProfilePage(),
  ];
}
