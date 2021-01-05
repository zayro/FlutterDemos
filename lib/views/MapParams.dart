import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapParam extends StatefulWidget {
  static const routeName = '/MapParam';

  MapParam({
    Key key,
  }) : super(key: key);

  @override
  State<MapParam> createState() {
    return MapParamState();
  }
}

class MapParamState extends State<MapParam> {
  Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    //final Map args = ModalRoute.of(context).settings.arguments as Map;

    final List args = ModalRoute.of(context).settings.arguments as List;

    print(args);

    final latitud = double.parse(args[0]);
    final longitud = double.parse(args[1]);

    return Scaffold(
      appBar: AppBar(title: Text("Mapa")),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: LatLng(latitud, longitud),
          zoom: 14.4746,
        ),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
