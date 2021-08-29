import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Mymap extends StatefulWidget {
 double lat;
 double lng;
 Mymap({this.lat,this.lng});
  @override
  State<Mymap> createState() => MymapState();
}

class MymapState extends State<Mymap> {



  Completer<GoogleMapController> _controller = Completer();

   CameraPosition _KAddress ;
  @override
  void initState() {
    super.initState();
    _KAddress =   CameraPosition(
        bearing: 192.8334901395799,
        target: LatLng(widget.lat,widget.lng),
        tilt: 59.440717697143555,
        zoom: 19.151926040649414);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _KAddress,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}