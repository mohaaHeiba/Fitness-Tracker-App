import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fitness_tracker_app/generated/l10n.dart';
import 'package:fitness_tracker_app/presentation/widgets/custom_widgets/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationsPermissions {
  Future<void> getPermissionLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      customSnackBar(
        S.current.alert,
        S.current.location_disabled,
        Colors.yellowAccent,
      );
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        customSnackBar(
          S.current.error,
          S.current.permission_denied,
          Colors.red,
        );
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      customSnackBar(
        S.current.error,
        S.current.permission_denied_forever,
        Colors.red,
      );
    }
  }

  Future<Position?> getCurrentlocation() async {
    final connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult.isEmpty ||
        connectivityResult.first == ConnectivityResult.none) {
      customSnackBar(S.current.alert, S.current.no_internet, Colors.red);
      return null;
    }

    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      customSnackBar(
        S.current.alert,
        S.current.location_disabled,
        Colors.yellowAccent,
      );
      return null;
    }
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      customSnackBar(S.current.error, S.current.permission_denied, Colors.red);
      return null;
    }

    Position position = await Geolocator.getCurrentPosition();
    customSnackBar(S.current.success, S.current.location_success, Colors.green);
    return position;
  }
}
