import 'package:fitness_tracker_app/presentation/controllers/insert_data_controll.dart';
import 'package:fitness_tracker_app/presentation/navigation/navigation_bar.dart'
    as Nav;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class InsertDataPage extends StatelessWidget {
  const InsertDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(InsertDataControll());
    final storage = GetStorage();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: controller.contName,
                decoration: const InputDecoration(
                  labelText: "Name",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: controller.contAge,
                decoration: const InputDecoration(
                  labelText: "Age",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 12),
              TextField(
                controller: controller.contGender,
                decoration: const InputDecoration(
                  labelText: "Gender",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: controller.contWeight,
                decoration: const InputDecoration(
                  labelText: "Weight",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 12),
              TextField(
                controller: controller.contHeight,
                decoration: const InputDecoration(
                  labelText: "Height",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                icon: const Icon(Icons.save),
                label: const Text("Save"),
                onPressed: () async {
                  final user = await controller.insertData();
                  if (user != null) {
                    Get.snackbar("Success", "User inserted: ${user.name}");
                    await storage.write('loginBefore', true);

                    Get.to(Nav.NavigationBar());
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
