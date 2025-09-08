import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:fitness_tracker_app/generated/l10n.dart';
import 'package:fitness_tracker_app/presentation/controllers/navigation_controll.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationBar extends StatelessWidget {
  NavigationBar({super.key});
  final controller = Get.find<NavigationControll>();
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final labels = [
      S.of(context).home,
      S.of(context).maps,
      S.of(context).goals,
      S.of(context).history,
      S.of(context).profile,
    ];

    final icons = [
      Icons.home,
      Icons.map,
      Icons.track_changes,
      Icons.list_alt,
      Icons.person,
    ];

    return Obx(
      () => Scaffold(
        extendBody: true,
        body: SafeArea(
          child: PageView(
            controller: pageController,
            onPageChanged: (i) => controller.changeIndex(i),
            children: controller.screens,
          ),
        ),
        bottomNavigationBar: CurvedNavigationBar(
          // height: 65,
          index: controller.index.value,
          color: Theme.of(context).colorScheme.onPrimary,
          backgroundColor: const Color.fromARGB(255, 36, 36, 36),
          onTap: (i) {
            controller.changeIndex(i);
            pageController.jumpToPage(i);
          },
          items: List.generate(
            icons.length,
            (i) => Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    icons[i],
                    size: 28,
                    color: controller.index.value == i
                        ? Colors.deepOrange
                        : Colors.white,
                  ),
                  controller.index.value != i
                      ? Text(
                          labels[i],
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        )
                      : const SizedBox.shrink(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
