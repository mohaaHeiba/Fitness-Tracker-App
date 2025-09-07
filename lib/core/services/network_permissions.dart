import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:fitness_tracker_app/generated/l10n.dart';
import 'package:fitness_tracker_app/presentation/widgets/custom_widgets/custom_snackbar.dart';
import 'package:get/get.dart';

class NetworkPermissions {
  static final Connectivity _connectivity = Connectivity();

  static void monitorConnection() {
    final notFirstTime = true.obs;
    _connectivity.onConnectivityChanged.listen((
      List<ConnectivityResult> results,
    ) {
      final result = results.isNotEmpty
          ? results.first
          : ConnectivityResult.none;

      if (result == ConnectivityResult.none) {
        customSnackBar(S.current.alert, S.current.no_internet, Colors.red);
        notFirstTime.value = false;
      } else {
        if (!notFirstTime.value) {
          customSnackBar(
            S.current.success,
            S.current.internet_connected,
            Colors.green,
          );
        } else {
          notFirstTime.value = false;
        }
      }
    });
  }
}
