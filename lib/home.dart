import 'package:flutter/material.dart';
import 'package:listas/service/sqlite.dart';

import 'package:provider/provider.dart';
import './providers/index.dart';

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
    var myProvider = Provider.of<MyProvider>(context);
    int _selectPosition = 0;

    _onSelectItem(int val) {
      print("_onSelectItemOnTap $val");
      myProvider.pageCurrent = val;
      myProvider.updateList = true;
      setState(() => _selectPosition = val);
    }

    return Scaffold(
      body: myProvider.handleState(),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Row(
          children: [
            IconButton(
                icon: Icon(Icons.http),
                onPressed: () {
                  _onSelectItem(1);
                  //Navigator.pushNamed(context, "/ListUrl");
                }),
            Spacer(),
            IconButton(
                icon: Icon(Icons.map),
                onPressed: () {
                  _onSelectItem(0);
                  //Navigator.pushNamed(context, "/ListMap");
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
              myProvider.updateList = true;
            }

            if (geo.length > 1) {
              print(" *********** GEO ***********");
              await db.infoGeo([data]);
              myProvider.updateList = true;
              Navigator.pushNamed(context, MapParam.routeName,
                  arguments: (geo));
            }
          }),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
    );
  }
}
