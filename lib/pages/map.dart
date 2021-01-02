import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MapType mapa = MapType.normal;
    bool toggledOn = true;

    void tipoMapa() {
      if (!toggledOn) {
        toggledOn = true;
      } else {
        toggledOn = false;
      }

      print("toggledOn");
      print(toggledOn);

      switch (toggledOn) {
        case true:
          mapa = MapType.normal;
          break;
        case false:
          mapa = MapType.hybrid;
          break;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Bucaramanga'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: () {
              tipoMapa();
            },
          )
        ],
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

  MapType mapa = MapType.normal;
  bool toggledOn = true;
  IconData iconoMapa = Icons.map_outlined;

  @override
  Widget build(BuildContext context) {
    Set<Marker> markers = new Set<Marker>();
    markers.add(new Marker(
        markerId: MarkerId('geo-location'),
        infoWindow: InfoWindow(title: "casita"),
        position: LatLng(7.1148641, -73.1326849)));

    void tipoMapa() {
      setState(() {
        if (!toggledOn) {
          toggledOn = true;
        } else {
          toggledOn = false;
        }

        print("toggledOn");
        print(toggledOn);

        switch (toggledOn) {
          case true:
            mapa = MapType.normal;
            iconoMapa = Icons.map_outlined;

            print('ingreso normal');
            break;
          case false:
            mapa = MapType.hybrid;
            print('ingreso hybrid');
            iconoMapa = Icons.map_rounded;
            break;
        }

        print("MapType");
        print(mapa);
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Bucaramanga'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              iconoMapa,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                tipoMapa();
              });
            },
          )
        ],
      ),
      body: GoogleMap(
        //mapType: MapType.hybrid,
        mapType: mapa,
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
