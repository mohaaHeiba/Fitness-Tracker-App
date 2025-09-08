import 'package:flutter/material.dart';

Widget buildSettingItem(
  IconData icon,
  String title,
  String subtitle,
  // Widget? page,
) {
  final colorTitle = title == 'Sign Out' ? Colors.red : Colors.black;
  final colorIcon = title == 'Sign Out' ? Colors.red : Colors.grey;

  return ListTile(
    onTap: () {
      // Get.to(
      //   () => page,
      //   // arguments:
      //   transition: Transition.rightToLeft,
      // );
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
