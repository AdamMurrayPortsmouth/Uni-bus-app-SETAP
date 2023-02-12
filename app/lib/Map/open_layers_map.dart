import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path/path.dart';

import 'package:webview_flutter/webview_flutter.dart';

class OpenLayersMap
{
  WebViewController webViewController = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
        // Update loading bar.
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {return NavigationDecision.navigate;},
      ),
    );

  OpenLayersMap()
  {
    _loadMap();
  }

  _loadMap()
  {
    String relativePath = "assets/open-layers-map/map.html";
    if (Platform.isAndroid) {
      webViewController.loadFile(
          "file:///android_asset/flutter_assets/$relativePath");
    }
    else if (Platform.isIOS)
    {
      // TODO: Add the absolute path for ios
      webViewController.loadFile(
          "$relativePath");
    }
  }

  addMarkers()
  {
    String jsObject = "{id: 1, longitude: -1.0894829, latitude: 50.7918624}";
    webViewController.runJavaScript("addBusStopMarker($jsObject)");
  }
}