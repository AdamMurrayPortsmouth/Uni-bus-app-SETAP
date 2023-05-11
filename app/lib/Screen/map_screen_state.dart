import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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
      backgroundColor: Color(0xffffffff),
      appBar:
      AppBar(
        elevation:4,
        centerTitle:false,
        automaticallyImplyLeading: false,
        backgroundColor:Color(0xffa93ae8),
        shape:RoundedRectangleBorder(
          borderRadius:BorderRadius.zero,
        ),
        title:Text(
          "Map Screen",
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
      body:Container(
        margin:EdgeInsets.all(0),
        padding:EdgeInsets.all(0),
        width:500,
        height:2400,
        decoration: BoxDecoration(
          color:Color(0x1f000000),
          shape:BoxShape.rectangle,
          borderRadius:BorderRadius.zero,
          border:Border.all(color:Color(0x4d9e9e9e),width:1),
        ),
        child:
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
          child:

          Column(
            mainAxisAlignment:MainAxisAlignment.start,
            crossAxisAlignment:CrossAxisAlignment.center,
            mainAxisSize:MainAxisSize.max,
            children: [
              TextField(
                controller:TextEditingController(),
                obscureText:false,
                textAlign:TextAlign.start,
                maxLines:1,
                style:TextStyle(
                  fontWeight:FontWeight.w400,
                  fontStyle:FontStyle.normal,
                  fontSize:14,
                  color:Color(0xff000000),
                ),
                decoration:InputDecoration(
                  disabledBorder:OutlineInputBorder(
                    borderRadius:BorderRadius.circular(4.0),
                    borderSide:BorderSide(
                        color:Color(0xff000000),
                        width:1
                    ),
                  ),
                  focusedBorder:OutlineInputBorder(
                    borderRadius:BorderRadius.circular(4.0),
                    borderSide:BorderSide(
                        color:Color(0xff000000),
                        width:1
                    ),
                  ),
                  enabledBorder:OutlineInputBorder(
                    borderRadius:BorderRadius.circular(4.0),
                    borderSide:BorderSide(
                        color:Color(0xff000000),
                        width:1
                    ),
                  ),
                  hintText:"From:Location",
                  hintStyle:TextStyle(
                    fontWeight:FontWeight.w400,
                    fontStyle:FontStyle.normal,
                    fontSize:14,
                    color:Color(0xff000000),
                  ),
                  filled:true,
                  fillColor:Color(0xab700c7d),
                  isDense:false,
                  contentPadding:EdgeInsets.fromLTRB(12, 8, 12, 8),
                ),
              ),
              TextField(
                controller:TextEditingController(),
                obscureText:false,
                textAlign:TextAlign.start,
                maxLines:1,
                style:TextStyle(
                  fontWeight:FontWeight.w400,
                  fontStyle:FontStyle.normal,
                  fontSize:14,
                  color:Color(0xff000000),
                ),
                decoration:InputDecoration(
                  disabledBorder:OutlineInputBorder(
                    borderRadius:BorderRadius.circular(4.0),
                    borderSide:BorderSide(
                        color:Color(0xff000000),
                        width:1
                    ),
                  ),
                  focusedBorder:OutlineInputBorder(
                    borderRadius:BorderRadius.circular(4.0),
                    borderSide:BorderSide(
                        color:Color(0xff000000),
                        width:1
                    ),
                  ),
                  enabledBorder:OutlineInputBorder(
                    borderRadius:BorderRadius.circular(4.0),
                    borderSide:BorderSide(
                        color:Color(0xff000000),
                        width:1
                    ),
                  ),
                  hintText:"To:Location",
                  hintStyle:TextStyle(
                    fontWeight:FontWeight.w400,
                    fontStyle:FontStyle.normal,
                    fontSize:14,
                    color:Color(0xff000000),
                  ),
                  filled:true,
                  fillColor:Color(0xab700c7d),
                  isDense:false,
                  contentPadding:EdgeInsets.fromLTRB(12, 8, 12, 8),
                ),
              ),
              Container(
                margin:EdgeInsets.zero,
                padding:EdgeInsets.zero,
                width:500,
                height:590,
                decoration: BoxDecoration(
                  color:Color(0xb4ebee02),
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
                ),
              )

              ,
              Align(
                alignment:Alignment(-0.1, 0.0),
                child:MaterialButton(
                  onPressed:(){},
                  color:Color(0xab700c7d),
                  elevation:0,
                  shape:RoundedRectangleBorder(
                    borderRadius:BorderRadius.zero,
                    side:BorderSide(color:Color(0xff808080),width:1),
                  ),
                  padding:EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child:Text("Home", style: TextStyle( fontSize:14,
                    fontWeight:FontWeight.w400,
                    fontStyle:FontStyle.normal,
                  ),),
                  textColor:Color(0xff000000),
                  height:90,
                  minWidth:410,
                ),
              ),
            ],),
        ),
      ),
    )
    ;}
}
