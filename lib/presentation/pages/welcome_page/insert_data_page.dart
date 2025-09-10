import 'package:fitness_tracker_app/presentation/controllers/data_user_controll.dart';
import 'package:fitness_tracker_app/presentation/controllers/services_controll.dart';

import 'package:fitness_tracker_app/presentation/navigation/navigation_bar.dart'
    as nav;
import 'package:fitness_tracker_app/presentation/widgets/welcome_widgets/textfeilds_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class InsertDataPage extends StatelessWidget {
  InsertDataPage({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DataUserControll());
    final controllService = Get.put(ServicesControll());

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFFFFF8F3), Color(0xFFFFDBAC), Color(0xFFFFDBAC)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        await controller.pickImage();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 20,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        child: CircleAvatar(
                          radius: 100,
                          backgroundColor: const Color(0xFFFFF8F3),
                          child: Obx(() {
                            if (controller.profileImage.value != null) {
                              return ClipOval(
                                child: Image.file(
                                  controller.profileImage.value!,
                                  width: 200,
                                  height: 200,
                                  fit: BoxFit.cover,
                                ),
                              );
                            } else if (!controller.isSelectGender.value) {
                              return Icon(
                                Icons.person,
                                color: Colors.deepOrange[400],
                                size: 150,
                              );
                            } else {
                              return Image.asset(
                                'assets/images/female.png',
                                color: Colors.deepOrange[400],
                                width: 105,
                                height: 105,
                              );
                            }
                          }),
                        ),
                      ),
                    ),

                    SizedBox(height: 40),

                    textFieldWidget(
                      'Full Name',
                      Icons.person_2_outlined,
                      controller.contName,
                      TextInputType.name,
                    ),
                    SizedBox(height: 20),
                    textFieldWidget(
                      'Age',
                      Icons.cake_outlined,
                      controller.contAge,
                      TextInputType.number,
                    ),
                    SizedBox(height: 20),

                    Container(
                      height: 53,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Obx(
                        () => Stack(
                          children: [
                            AnimatedAlign(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                              alignment: controller.isSelectGender.value
                                  ? Alignment.centerLeft
                                  : Alignment.centerRight,
                              child: Container(
                                width:
                                    MediaQuery.of(context).size.width / 2 - 20,
                                margin: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: Colors.deepOrangeAccent,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.5),
                                      blurRadius: 6,
                                      offset: const Offset(0, 0),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            Row(
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    behavior: HitTestBehavior.translucent,
                                    onTap: () {
                                      controller.isSelectGender.value = true;

                                      controller.contGender.text =
                                          controller.gender.last;
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: const Text("Female"),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    behavior: HitTestBehavior.translucent,
                                    onTap: () {
                                      controller.isSelectGender.value = false;
                                      controller.contGender.text =
                                          controller.gender.first;
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: const Text("Male"),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 20),

                    Row(
                      children: [
                        Expanded(
                          child: textFieldWidget(
                            'weight',
                            Icons.line_weight,
                            controller.contWeight,
                            TextInputType.number,
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: textFieldWidget(
                            'Height',
                            Icons.height_outlined,
                            controller.contHeight,
                            TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 40),

                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            // print("Form is valid");
                            if (controller.contGender.text.isEmpty) {
                              controller.contGender.text =
                                  controller.gender.first;
                            }
                            await controller.insertData();
                            Get.offAll(
                              nav.NavigationBar(),
                              transition: Transition.fade,
                            );
                            await controllService.getPermission();

                            GetStorage().write('loginBefore', true);
                          } else {
                            print("Form is invalid");
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepOrange,
                          minimumSize: Size(200, 50),
                        ),
                        child: Text('Create proflie'),
                      ),
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
