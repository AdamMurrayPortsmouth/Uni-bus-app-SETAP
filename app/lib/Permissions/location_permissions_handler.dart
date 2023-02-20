

import 'package:location/location.dart';

class LocationPermissionsHandler
{
  static late LocationPermissionsHandler handler;
  late Location location;

  LocationPermissionsHandler._()
  {
    location = Location();
  }

  static LocationPermissionsHandler getHandler()
  {
    handler ??= LocationPermissionsHandler._();
    return handler;
  }

  Location getLocation()
  {
    return location;
  }

  requestLocationPermission() async
  {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
  }
}