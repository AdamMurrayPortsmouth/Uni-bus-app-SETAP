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

    return Scaffold(      // Start of the styling for application
      backgroundColor: const Color(0xffffffff),
      appBar:
      AppBar(
        elevation:4,
        centerTitle:false,
        automaticallyImplyLeading: false,
        backgroundColor:const Color(0xffcf97ef),
        shape:const RoundedRectangleBorder(
          borderRadius:BorderRadius.zero,
        ),
        title:const Text(
          "Map Screen",       // styling for the Map screen
          style:TextStyle(
            fontWeight:FontWeight.w400,
            fontStyle:FontStyle.normal,
            fontSize:14,
            color:Color(0xff000000),
          ),
        ),
        leading: const Icon(
          Icons.arrow_back,
          color:Color(0xff212435),
          size:24,
        ),
      ),
      body:Container( // styling for container
        margin:const EdgeInsets.all(0),
        padding:const EdgeInsets.all(0),
        width:500,
        height:2400,
        decoration: BoxDecoration(
          color:const Color(0x1f000000),
          shape:BoxShape.rectangle,
          borderRadius:BorderRadius.zero,
          border:Border.all(color:const Color(0x4d9e9e9e),width:1),
        ),
        child:
        Container(  //styling for container
          margin:EdgeInsets.zero,
          padding:EdgeInsets.zero,
          width:200,
          height:100,
          decoration: BoxDecoration(
            color:const Color(0x1f000000),
            shape:BoxShape.rectangle,
            borderRadius:BorderRadius.zero,
            border:Border.all(color:const Color(0x4d9e9e9e),width:1),
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
                style:const TextStyle(
                  fontWeight:FontWeight.w400,
                  fontStyle:FontStyle.normal,
                  fontSize:14,
                  color:Color(0xff000000),
                ),
                decoration:InputDecoration(
                  disabledBorder:OutlineInputBorder(
                    borderRadius:BorderRadius.circular(4.0),
                    borderSide:const BorderSide(
                        color:Color(0xff000000),
                        width:1
                    ),
                  ),
                  focusedBorder:OutlineInputBorder(
                    borderRadius:BorderRadius.circular(4.0),
                    borderSide:const BorderSide(
                        color:Color(0xff000000),
                        width:1
                    ),
                  ),
                  enabledBorder:OutlineInputBorder(
                    borderRadius:BorderRadius.circular(4.0),
                    borderSide:const BorderSide(
                        color:Color(0xff000000),
                        width:1
                    ),
                  ),
                  hintText:"From:Location", //styling for search box
                  hintStyle:const TextStyle(
                    fontWeight:FontWeight.w400,
                    fontStyle:FontStyle.normal,
                    fontSize:14,
                    color:Color(0xff000000),
                  ),
                  filled:true,
                  fillColor:const Color(0xab700c7c),
                  isDense:false,
                  contentPadding:const EdgeInsets.fromLTRB(12, 8, 12, 8),
                ),
              ),
              TextField(
                controller:TextEditingController(),
                obscureText:false,
                textAlign:TextAlign.start,
                maxLines:1,
                style:const TextStyle(
                  fontWeight:FontWeight.w400,
                  fontStyle:FontStyle.normal,
                  fontSize:14,
                  color:Color(0xff000000),
                ),
                decoration:InputDecoration(
                  disabledBorder:OutlineInputBorder(
                    borderRadius:BorderRadius.circular(4.0),
                    borderSide:const BorderSide(
                        color:Color(0xff000000),
                        width:1
                    ),
                  ),
                  focusedBorder:OutlineInputBorder(
                    borderRadius:BorderRadius.circular(4.0),
                    borderSide:const BorderSide(
                        color:Color(0xff000000),
                        width:1
                    ),
                  ),
                  enabledBorder:OutlineInputBorder(
                    borderRadius:BorderRadius.circular(4.0),
                    borderSide:const BorderSide(
                        color:Color(0xff000000),
                        width:1
                    ),
                  ),
                  hintText:"To:Location", // Styling for the  search box
                  hintStyle:const TextStyle(
                    fontWeight:FontWeight.w400,
                    fontStyle:FontStyle.normal,
                    fontSize:14,
                    color:Color(0xff000000),
                  ),
                  filled:true,
                  fillColor:const Color(0xab700c7d),
                  isDense:false,
                  contentPadding:const EdgeInsets.fromLTRB(12, 8, 12, 8),
                ),
              ),
              Container(
                margin:EdgeInsets.zero,
                padding:EdgeInsets.zero,
                width:500,
                height:590,
                decoration: BoxDecoration(
                  color:const Color(0xd5ebee02),
                  shape:BoxShape.rectangle,
                  borderRadius:BorderRadius.zero,
                  border:Border.all(color:const Color(0x4d9e9e9e),width:1),
                ),
                child: GoogleMap(         // Places the actual google API in application
                  mapType: MapType.hybrid,
                  initialCameraPosition: _kGooglePlex,
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                ),
              )

              ,
              Align(
                alignment:const Alignment(-0.1, 0.0), //
                child:MaterialButton(
                  onPressed:(){},
                  color:const Color(0xab700c7d),
                  elevation:0,
                  shape:const RoundedRectangleBorder(
                    borderRadius:BorderRadius.zero,
                    side:BorderSide(color:Color(0xff808080),width:1),
                  ),
                  padding:const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  textColor:const Color(0xff000000),
                  height:90,
                  minWidth:410,
                  child:const Text("Home", style: TextStyle( fontSize:14, //styling for the home button
                    fontWeight:FontWeight.w400,
                    fontStyle:FontStyle.normal,
                  ),),
                ),
              ),
            ],),
        ),
      ),
    )
    ;}
}
