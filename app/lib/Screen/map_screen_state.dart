import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'main_screen.dart';

/// This class contains the GUI structure for the screen that contains the map.
class MapScreenState extends State<MainScreen> {
  // The instance of our map
  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(50.7978527, -1.0841577),
    zoom: 14,
  );



  /// Builds the GUI and places the map inside.
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:
      AppBar(
        elevation:4,
        centerTitle:false,
        automaticallyImplyLeading: false,
        backgroundColor:Color(0xff3a57e8),
        shape:RoundedRectangleBorder(
          borderRadius:BorderRadius.zero,
        ),
        title:Text(
          "AppBar",
          style:TextStyle(
            fontWeight:FontWeight.w400,
            fontStyle:FontStyle.normal,
            fontSize:14,
            color:Color(0xff000000),
          ),
        ),
        leading: Icon(
          Icons.arrow_back,
          color:Color(0xff212435),
          size:24,
        ),
      ),
      body:
      Column(
        mainAxisAlignment:MainAxisAlignment.start,
        crossAxisAlignment:CrossAxisAlignment.center,
        mainAxisSize:MainAxisSize.max,
        children: [
          Container(
            margin:EdgeInsets.zero,
            padding:EdgeInsets.zero,
            width:200,
            height:100,
            decoration: BoxDecoration(
              color:Color(0x1f000000),
              shape:BoxShape.rectangle,
              borderRadius:BorderRadius.zero,
              border:Border.all(color:Color(0x4d9e9e9e),width:1),
            ),
            child: GoogleMap(
              mapType: MapType.hybrid,
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ), // Map
          )

          ,
          MaterialButton(
            onPressed:(){},
            color:Color(0xffffffff),
            elevation:0,
            shape:RoundedRectangleBorder(
              borderRadius:BorderRadius.zero,
              side:BorderSide(color:Color(0xff808080),width:1),
            ),
            padding:EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child:Text("Text Button", style: TextStyle( fontSize:14,
              fontWeight:FontWeight.w400,
              fontStyle:FontStyle.normal,
            ),),
            textColor:Color(0xff000000),
            height:40,
            minWidth:140,
          ),
        ],),
    )
    ;

  }
}