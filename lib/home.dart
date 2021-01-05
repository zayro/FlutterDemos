import 'package:flutter/material.dart';
import 'package:listas/service/sqlite.dart';

import './service/scan.dart';
import './service/urlLauncher.dart';

import './views/MapParams.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final db = DBServicio();
  final scan = ScanCode();
  final url = UrlLauncher();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Row(
          children: [
            IconButton(
                icon: Icon(Icons.http),
                onPressed: () {
                  Navigator.pushNamed(context, "/ListUrl");
                }),
            Spacer(),
            IconButton(
                icon: Icon(Icons.map),
                onPressed: () {
                  Navigator.pushNamed(context, "/ListMap");
                }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.camera),
          onPressed: () async {
            final data = await scan.scanQR();

            final geo = data.split(',');

            if (data.toLowerCase().contains('http') ||
                data.toLowerCase().contains('https')) {
              print(" ************ URL ************");
              await db.addHttp([data]);
              await url.open(data);
            }

            if (geo.length > 1) {
              print(" *********** GEO ***********");
              await db.infoGeo([data]);
              Navigator.pushNamed(context, MapParam.routeName,
                  arguments: (geo));
            }
          }),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
    );
  }
}
