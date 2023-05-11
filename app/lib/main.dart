import 'package:flutter/material.dart';

import 'MapData/map_data_loader.dart';
import 'Permissions/location_permissions_handler.dart';
import 'Screen/main_screen.dart';

/// Target for start of application.
void main() {
  //runApp(const MyApp());
  runApp(const MaterialApp(
    title: 'Navigation Basics',
    home: FirstRoute(),
  ));
}
class FirstRoute extends StatelessWidget {
  const FirstRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bus Application'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Open Map'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MyApp()),

            );
          },
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}
/// The entire application is started from this class.
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