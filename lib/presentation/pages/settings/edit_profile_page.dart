import 'package:fitness_tracker_app/presentation/controllers/data_user_controll.dart';
import 'package:fitness_tracker_app/presentation/widgets/custom_widgets/custom_appbar.dart';
import 'package:fitness_tracker_app/presentation/widgets/welcome_widgets/textfeilds_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfilePage extends StatelessWidget {
  EditProfilePage({super.key});
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DataUserControll>();

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
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    customAppBar("Editing Profile", padding: 0),

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
                              alignment: controller.tempState.value
                                  ? Alignment.centerLeft
                                  : Alignment.centerRight,
                              child: Container(
                                width:
                                    MediaQuery.of(context).size.width / 2 - 20,
                                margin: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: Colors.deepOrangeAccent,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ),

                            Row(
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    behavior: HitTestBehavior.translucent,
                                    onTap: () {
                                      controller.tempState.value = true;

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
                                      controller.tempState.value = false;

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
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          // print("Form is valid");
                          if (controller.contGender.text.isEmpty) {
                            controller.contGender.text =
                                controller.gender.first;
                          }

                          controller.isSelectGender.value =
                              controller.tempState.value;
                          await controller.updateUser();
                          Get.back();
                        } else {
                          print("Form is invalid");
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrange,
                        minimumSize: Size(200, 50),
                      ),
                      child: Text('Update proflie'),
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
