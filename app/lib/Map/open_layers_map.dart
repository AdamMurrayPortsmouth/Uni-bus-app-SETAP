import 'dart:io';

import 'package:app/Map/user_icon_enum.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:path/path.dart';

import 'package:webview_flutter/webview_flutter.dart';

import '../Permissions/location_permissions_handler.dart';

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
            _addUserLocationIcon();
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
    // TODO: Use Actual data
    //String jsObject = "{id: $id, longitude: $long, latitude: $lat}";
    //webViewController.runJavaScript("addBusStopMarker($jsObject)");
  }

  _markerClicked(String markerId)
  {
      // TODO: Add functionality to use the markerId
  }

  _addUserLocationIcon() async
  {
    LocationPermissionsHandler handler = LocationPermissionsHandler.getHandler();
    Location location = handler.getLocation();

    if (!await handler.hasPermission())
    {
        return;
    }
    LocationData currentLocation = await location.getLocation();
    String jsObject = "{id: '${UserIcon.id.name}', longitude: ${currentLocation.longitude}, latitude: ${currentLocation.latitude}}";
    webViewController.runJavaScript("addUserIcon($jsObject)");

    location.onLocationChanged.listen((LocationData currentLocation) {
      String jsObject = "{id: '${UserIcon.id.name}', longitude: ${currentLocation.longitude}, latitude: ${currentLocation.latitude}}";
      webViewController.runJavaScript("updateUserIcon($jsObject)");
    });
  }
}