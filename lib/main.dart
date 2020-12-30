import 'package:flutter/material.dart';
import './pages/map.dart';
import './pages/scan.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _scanBarcode = 'Unknown';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(title: const Text('Barcode scan')),
            body: Builder(builder: (BuildContext context) {
              return Container(
                  alignment: Alignment.center,
                  child: Flex(
                      direction: Axis.vertical,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RaisedButton(
                            onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyScan()),
                                ),
                            child: Text("Abrir barcode scan")),
                        RaisedButton(
                            onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyMap()),
                                ),
                            child: Text("Abrir Mapa")),
                      ]));
            })));
  }
}
