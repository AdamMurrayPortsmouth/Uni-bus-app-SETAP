import 'package:location/location.dart';

class LocationPermissionsHandler
{
  static LocationPermissionsHandler? _handler;
  late Location _location;

  LocationPermissionsHandler._()
  {
    _location = Location();
  }

  static LocationPermissionsHandler getHandler()
  {
    _handler ??= LocationPermissionsHandler._();
    return _handler!;
  }

  Location getLocation()
  {
    return _location;
  }

  requestLocationPermission() async
  {
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await _location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await _location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await _location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await _location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
  }

  Future<bool> hasPermission() async {
    if (!await _location.serviceEnabled()) {
      return false;
    }
    return await _location.hasPermission() != PermissionStatus.denied;
  }
}