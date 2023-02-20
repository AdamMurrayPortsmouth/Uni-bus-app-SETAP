

import 'package:location/location.dart';

class LocationPermissionsHandler
{
  static LocationPermissionsHandler? handler;
  late Location location;

  LocationPermissionsHandler._()
  {
    location = Location();
  }

  static LocationPermissionsHandler getHandler()
  {
    handler ??= LocationPermissionsHandler._();
    return handler!;
  }

  Location getLocation()
  {
    return location;
  }

  requestLocationPermission() async
  {
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
  }

  Future<bool> hasPermission() async {
    if (!await location.serviceEnabled()) {
      return false;
    }
    return await location.hasPermission() != PermissionStatus.denied;
  }
}