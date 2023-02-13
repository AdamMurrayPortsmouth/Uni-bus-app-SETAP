import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:path/path.dart' as p;

import 'Map/open_layers_map.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  OpenLayersMap map = OpenLayersMap();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Container(
          margin: EdgeInsets.zero,
          padding: EdgeInsets.zero,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Color(0x1f000000),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.zero,
            border: Border.all(color: Color(0x4d9e9e9e), width: 1)
          ),
          child: WebViewWidget(controller: map.webViewController)
          ),
        );
  }
}
