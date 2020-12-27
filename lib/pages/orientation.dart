import 'package:flutter/material.dart';

class OrientationPage extends StatelessWidget {
  const OrientationPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: OrientationBuilder(builder: (context, orientation) {
      if (orientation == Orientation.portrait) {
        return Center(
          child: Text("portrait"),
        );
      } else {
        return Center(
          child: Text("Landscape"),
        );
      }
    }));
  }
}
