import 'dart:developer';

import 'package:geolocator/geolocator.dart';

abstract class PermissionLocation {
  static Future<void> getPermission() async {
    try {
      bool serviceEnabled;
      LocationPermission permission;

      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        serviceEnabled = await Geolocator.openLocationSettings();
        if (!serviceEnabled) {
          return Future.error('Serviços de localização desabilitados');
        }
      }

      permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.deniedForever) {
        return;
      }

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission != LocationPermission.whileInUse &&
            permission != LocationPermission.always) {
          return;
        }
      }
    } catch (e, s) {
      String msg = 'ERRO AO OBTER A LOCALIZAÇÃO';
      log(msg, error: e, stackTrace: s);
      return Future.error(msg);
    }
  }
}
