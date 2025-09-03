import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:fitness_tracker_app/generated/l10n.dart';
import 'package:fitness_tracker_app/presentation/controllers/navigation_controll.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationBar extends StatelessWidget {
  NavigationBar({super.key});
  final controller = Get.find<NavigationControll>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        extendBody: true,

        // backgroundColor: Colors.transparent,
        body: IndexedStack(
          index: controller.index.value,
          children: controller.screens,
        ),
        bottomNavigationBar: CurvedNavigationBar(
          // height: 60,
          items: <Widget>[
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.home, size: 30),
                controller.index.value != 0
                    ? Text(S.of(context).home, style: TextStyle(fontSize: 12))
                    : SizedBox(),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.map, size: 30),
                controller.index.value != 1
                    ? Text(S.of(context).maps, style: TextStyle(fontSize: 12))
                    : SizedBox(),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.track_changes, size: 30),
                controller.index.value != 2
                    ? Text(S.of(context).goals, style: TextStyle(fontSize: 12))
                    : SizedBox(),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.list_alt, size: 30),
                controller.index.value != 3
                    ? Text(
                        S.of(context).history,
                        style: TextStyle(fontSize: 12),
                      )
                    : SizedBox(),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.person, size: 30),
                controller.index.value != 4
                    ? Text(
                        S.of(context).profile,
                        style: TextStyle(fontSize: 12),
                      )
                    : SizedBox(),
              ],
            ),
          ],
          index: controller.index.value,
          color: Colors.deepOrange,
          backgroundColor: Colors.transparent,
          onTap: (i) => controller.changeIndex(i),
        ),
      ),
    );
  }
}
