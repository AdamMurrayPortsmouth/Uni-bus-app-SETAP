import 'package:geolocator/geolocator.dart';

class LocationPermissionsHandler
{
  static requestLocationPermission() async
  {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied)
    {
      permission = await Geolocator.requestPermission();
    }
  }

  static Future<bool> hasLocationPermission() async
  {
    LocationPermission permission = await Geolocator.checkPermission();
    return permission != LocationPermission.denied;
  }
}