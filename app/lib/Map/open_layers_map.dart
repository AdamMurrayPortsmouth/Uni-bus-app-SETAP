import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path/path.dart';

import 'package:webview_flutter/webview_flutter.dart';

class OpenLayersMap
{
  late WebViewController webViewController;

  OpenLayersMap()
  {
    webViewController = _createWebViewController();
    _loadMap();
  }

  WebViewController _createWebViewController()
  {
    return WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..addJavaScriptChannel("MarkerClickedDart", onMessageReceived: (JavaScriptMessage markerIdMessage) {
        _markerClicked(markerIdMessage.message);
      })
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {
            _addMarkers();
          },
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {return NavigationDecision.navigate;},
        ),
      );
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

  _addMarkers()
  {
    // TODO:  Actual data
    //String jsObject = "{id: $id, longitude: $long, latitude: $lat}";
    //webViewController.runJavaScript("addBusStopMarker($jsObject)");
  }

  _markerClicked(String markerId)
  {
      // TODO: Add functionality to use the markerId
  }
}