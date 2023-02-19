import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'main_screen.dart';
import '../Map/open_layers_map.dart';

class MapScreenState extends State<MainScreen> {

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