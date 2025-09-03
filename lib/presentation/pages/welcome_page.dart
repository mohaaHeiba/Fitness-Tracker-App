import 'package:fitness_tracker_app/generated/l10n.dart';
import 'package:fitness_tracker_app/presentation/controllers/services_controll.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:fitness_tracker_app/presentation/navigation/navigation_bar.dart'
    as nav;
import 'package:get_storage/get_storage.dart';

class WelcomePage extends StatelessWidget {
  WelcomePage({super.key});
  final storage = GetStorage();
  final controll = Get.find<ServicesControll>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset("assets/images/logo.jpeg", fit: BoxFit.cover),
          ),

          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 80.0),
                  child: Column(
                    children: [
                      Text(
                        S.of(context).welcome,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10),
                      Text(
                        S.of(context).welcome_des,
                        style: TextStyle(color: Colors.black, fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(bottom: 60.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 14,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: Colors.deepOrange,
                    ),
                    onPressed: () async {
                      storage.write('loginBefore', true);
                      await controll.getlocations();
                      // Get.off(
                      //   nav.NavigationBar(),
                      //   transition: Transition.rightToLeft,
                      // );
                    },
                    child: SizedBox(
                      width: 120,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            S.of(context).start,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Icon(Icons.arrow_circle_right),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
