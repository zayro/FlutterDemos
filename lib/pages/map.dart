import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bucaramanga"),
      ),
      body: MapSample(),
    );
  }
}

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(7.1107807, -73.1231582),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(7.1148641, -73.1326849),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    Set<Marker> markers = new Set<Marker>();
    markers.add(new Marker(
        markerId: MarkerId('geo-location'),
        infoWindow: InfoWindow(title: "casita"),
        position: LatLng(7.1148641, -73.1326849)));
    return new Scaffold(
      body: GoogleMap(
        //mapType: MapType.hybrid,
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        markers: markers,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: Text('Buscar casa!'),
        icon: Icon(Icons.search),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
