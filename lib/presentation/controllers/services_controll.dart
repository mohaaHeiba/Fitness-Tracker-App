import 'package:fitness_tracker_app/core/services/locations_permissions.dart';
import 'package:get/get.dart';

class ServicesControll extends GetxController {
  Future<void> getPermission() async {
    LocationsPermissions lo = LocationsPermissions();

    await lo.getPermissionLocation();

    // await lo.getCurrentlocation();
  }
}
