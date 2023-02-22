import 'dart:io';

import 'package:app/Map/user_icon_enum.dart';
import 'package:app/MapData/map_data_loader.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../MapData/bus_stop.dart';
import '../MapData/data.dart';
import '../MapData/map_data.dart';
import '../Permissions/location_permissions_handler.dart';

class OpenLayersMap
{
  late final WebViewController _webViewController;
  Function(String)? _markerClickedFunction;

  OpenLayersMap()
  {
    _webViewController = _createWebViewController();
    _loadMap();
  }

  onMarkerClicked(Function(String) markerClicked)
  {
    _markerClickedFunction = markerClicked;
  }

  WebViewController getController()
  {
    return _webViewController;
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
            MapDataLoader.getDataLoader().onDataLoaded((mapData)
            {
              _addMarkers(mapData);
            });
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
      _webViewController.loadFile(
          "file:///android_asset/flutter_assets/$relativePath");
    }
    else if (Platform.isIOS)
    {
      // TODO: Add the absolute path for ios
      _webViewController.loadFile(
          "$relativePath");
    }
  }

  _addMarkers(MapData mapData)
  {
    for(BusStop busStop in mapData.getBusStops())
    {
      _addBusStopMarker(busStop.id, busStop.long, busStop.lat);
    }
    for(Data uniBuilding in mapData.getUniBuildings())
    {
      _addUniBuildingMarker(uniBuilding.id, uniBuilding.long, uniBuilding.lat);
    }
    for(Data landmark in mapData.getLandmarks())
    {
      _addLandmarkMarker(landmark.id, landmark.long, landmark.lat);
    }
  }

  _addBusStopMarker(String id, double long, double lat)
  {
    String jsObject = "{id: '$id', longitude: $long, latitude: $lat}";
    _webViewController.runJavaScript("addBusStopMarker($jsObject)");
  }

  _addUniBuildingMarker(String id, double long, double lat)
  {
    String jsObject = "{id: '$id', longitude: $long, latitude: $lat}";
    _webViewController.runJavaScript("addUniBuildingMarker($jsObject)");
  }

  _addLandmarkMarker(String id, double long, double lat)
  {
    String jsObject = "{id: '$id', longitude: $long, latitude: $lat}";
    _webViewController.runJavaScript("addLandmarkMarker($jsObject)");
  }

  _markerClicked(String markerId)
  {
    if (_markerClickedFunction == null)
    {
      return;
    }
    _markerClickedFunction!(markerId);
  }

  _addUserLocationIcon() async
  {
    LocationPermissionsHandler handler = LocationPermissionsHandler.getHandler();
    Location location = handler.getLocation();

    if (await handler.hasPermission())
    {
      LocationData currentLocation = await location.getLocation();
      String jsObject = "{id: '${UserIcon.id.name}', longitude: ${currentLocation.longitude}, latitude: ${currentLocation.latitude}}";
      _webViewController.runJavaScript("addUserIcon($jsObject)");
    }

    location.onLocationChanged.listen((LocationData currentLocation) {
      String jsObject = "{id: '${UserIcon.id.name}', longitude: ${currentLocation.longitude}, latitude: ${currentLocation.latitude}}";
      _webViewController.runJavaScript("updateUserIcon($jsObject)");
    });
  }
}