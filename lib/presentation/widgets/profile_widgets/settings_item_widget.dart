import 'package:fitness_tracker_app/presentation/controllers/data_user_controll.dart';
import 'package:fitness_tracker_app/presentation/controllers/navigation_controll.dart';
import 'package:fitness_tracker_app/presentation/pages/welcome_page/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget buildSettingItem(
  IconData icon,
  String title,
  String subtitle,
  bool showDialog,
  Widget? page,
) {
  final controller = Get.find<DataUserControll>();
  final controllerNav = Get.find<NavigationControll>();

  final colorTitle = title == 'Sign Out' ? Colors.red : Colors.black;
  final colorIcon = title == 'Sign Out' ? Colors.red : Colors.grey;

  return ListTile(
    onTap: () {
      if (showDialog == true) {
        Get.dialog(
          AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            title: const Text("Sign Out"),
            content: const Text("This will clear all data! Are you sure?"),
            actions: [
              TextButton(
                onPressed: () => Get.back(),
                child: const Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: () async {
                  await controller.deleteData();
                  controller.contAge.clear();
                  controller.contGender.clear();
                  controller.contHeight.clear();
                  controller.contName.clear();
                  controller.contWeight.clear();
                  Get.offAll(WelcomePage());
                  controllerNav.index.value = 2;
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
                child: const Text("Sign Out"),
              ),
            ],
          ),
        );
      } else {
        Get.to(
          () => page!,
          // arguments:
          transition: Transition.rightToLeft,
        );
      }
    },
    leading: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: colorIcon.withOpacity(0.2),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(icon, color: colorTitle),
      ),
    ),
    title: Text(title, style: TextStyle(color: colorTitle)),
    subtitle: Text(
      subtitle,
      style: TextStyle(fontSize: 12, color: Colors.black.withOpacity(0.5)),
    ),
    trailing: Icon(Icons.arrow_forward_ios, size: 16),
  );
}
