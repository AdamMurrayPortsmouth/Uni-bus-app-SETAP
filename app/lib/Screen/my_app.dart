import 'package:flutter/material.dart';

import '../MapData/map_data_loader.dart';
import '../Permissions/location_permissions_handler.dart';
import 'main_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    MapDataLoader.getDataLoader().load();
    LocationPermissionsHandler.getHandler().requestLocationPermission();
    return const MaterialApp(
        home: MainScreen()
    );
  }
}