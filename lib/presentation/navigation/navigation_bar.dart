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

    return SafeArea(
      child: Obx(
        () => Scaffold(
          extendBody: true,
          body: IndexedStack(
            index: controller.index.value,
            children: controller.screens,
          ),
          bottomNavigationBar: CurvedNavigationBar(
            height: 65,
            index: controller.index.value,
            color: Colors.deepOrange,
            backgroundColor: Colors.transparent,
            onTap: controller.changeIndex,
            items: List.generate(
              icons.length,
              (i) => Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      icons[i],
                      size: 28,
                      color: controller.index.value == i
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(
                              context,
                            ).colorScheme.primary.withOpacity(0.8),
                    ),
                    const SizedBox(height: 4),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 200),
                      child: controller.index.value != i
                          ? Text(
                              labels[i],
                              key: ValueKey(i),
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            )
                          : const SizedBox.shrink(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
