import 'package:fitness_tracker_app/presentation/controllers/data_user_controll.dart';
import 'package:fitness_tracker_app/presentation/pages/home/home_page.dart';
import 'package:fitness_tracker_app/presentation/pages/settings/edit_profile_page.dart';
import 'package:fitness_tracker_app/presentation/pages/settings/privacy_page.dart';
import 'package:fitness_tracker_app/presentation/widgets/profile_widgets/bmi_widget.dart';
import 'package:fitness_tracker_app/presentation/widgets/profile_widgets/cardState_widget.dart';
import 'package:fitness_tracker_app/presentation/widgets/profile_widgets/infocard_widget.dart';
import 'package:fitness_tracker_app/presentation/widgets/profile_widgets/settings_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DataUserControll>();
    controller.getData();
    return Scaffold(
      body: Obx(() {
        final user = controller.data.value;

        if (user == null) {
          return Center(child: Text('login data again'));
        }
        return Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFFFF8F3), Color(0xFFFFDBAC), Color(0xFFFFDBAC)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                spacing: 20,
                children: [
                  const SizedBox(height: 5),

                  //build information card
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],

                      borderRadius: BorderRadius.circular(24),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xFFFFF8F3),
                                  Colors.deepOrangeAccent,
                                  Colors.deepOrange,
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.deepOrange.withOpacity(0.4),
                                  blurRadius: 12,
                                ),
                              ],
                            ),
                            child: Obx(
                              () => !controller.isSelectGender.value
                                  ? Center(
                                      child: Icon(
                                        Icons.person,
                                        color: Colors.white,
                                        size: 60,
                                      ),
                                    )
                                  : Center(
                                      child: ClipOval(
                                        child: Image.asset(
                                          'assets/images/female.png',
                                          color: Colors.white,
                                          fit: BoxFit.contain,
                                          width: 60,
                                          height: 60,
                                        ),
                                      ),
                                    ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            controller.data.value!.name ?? '',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF2D2D2D),
                            ),
                          ),
                          SizedBox(height: 10),

                          BmiWidget().bmiWidget(controller.data.value),
                          SizedBox(height: 20),

                          buildInfCard(
                            Icons.cake,
                            'Age',
                            controller.data.value!.age ?? '',
                          ),
                          SizedBox(height: 10),

                          buildInfCard(
                            Icons.male,
                            'gender',
                            controller.data.value?.gender ??
                                controller.gender.first,
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),

                  // state card
                  Row(
                    children: [
                      buildStateCard(
                        Icons.monitor_weight_outlined,
                        'weight',
                        controller.data.value!.weight,
                      ),
                      SizedBox(width: 20),

                      buildStateCard(
                        Icons.height_outlined,
                        'height',
                        controller.data.value!.height,
                      ),
                    ],
                  ),

                  // Settings Container
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(24),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
                      child: Column(
                        spacing: 10,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text(
                              "Settings",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          buildSettingItem(
                            Icons.edit_outlined,
                            "Edit Profile",
                            "Update your personal information",
                            false,
                            EditProfilePage(),
                          ),
                          buildSettingItem(
                            Icons.notifications_outlined,
                            "Notifications",
                            "Manage your notification ",
                            false,
                            HomePage(),
                          ),
                          buildSettingItem(
                            Icons.privacy_tip_outlined,
                            "Privacy",
                            "Control your privacy settings",
                            false,
                            PrivacySettingsPage(),
                          ),
                          buildSettingItem(
                            Icons.help_outline,
                            "Help & Support",
                            "Get help or contact support",
                            false,
                            HomePage(),
                          ),
                          buildSettingItem(
                            Icons.logout,
                            "Sign Out",
                            "Sign out of your account",
                            true,
                            null,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
