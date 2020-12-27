import 'package:flutter/material.dart';
import '../preferencias/usuario.dart';

import './http.dart';
import './orientation.dart';
import './text.dart';

class HomePage extends StatefulWidget {
  //HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _prefs = new PreferenciasUsario();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //_prefs.ultimaPagina = "home";
    print("open state");

    WidgetsBinding.instance.addPostFrameCallback((val) {
      // Your Code Here
      print("open WidgetsBinding $val");
    });
  }

  @override
  void dispose() {
    print("close state");
    super.dispose();
  }

  int _selectPosition = 0;

  _getDraweItemWidget(int val) {
    print("_getDraweItemWidget $val");

    switch (val) {
      case 0:
        return TextPage();
        break;
      case 1:
        return HttpPage();
        break;
      case 2:
        return OrientationPage();
        break;
    }
  }

  _onSelectItem(int val) {
    //Navigator.pop(context);
    //Navigator.of(context).pop();
    setState(() {
      print("v_onSelectItem $val");
      _selectPosition = val;
      print("_selectPosition $_selectPosition");
    });
  }

  @override
  Widget build(BuildContext context) {
    void cerrar_session() {
      Navigator.pushNamed(context, 'login');
    }

    var drawerHeader = DrawerHeader(
      child: ListView(
        children: [
          Center(
            child: Text(
              "Menu",
              style: TextStyle(fontSize: 30.0),
            ),
          ),
          Icon(
            Icons.account_circle,
            size: 90,
          )
        ],
      ),
    );
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("Home $_selectPosition"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
                accountName: Text("MARLON ZAYRO ARIAS VARGAS"),
                accountEmail: Text("ZAYRO8905@GMAIL.COM"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.amber,
                  child: Text("M"),
                )),
            ListTile(
              title: Text("Cerrar sesion"),
              onTap: () {
                cerrar_session();
              },
            ),
            ListTile(
              title: Text("Multimedia"),
              onTap: () {
                Navigator.pushNamed(context, '/multimedia');
              },
            ),
            Divider(),
            ListTile(
              title: Text("Texto"),
              selected: (0 == _selectPosition),
              onTap: () {
                _onSelectItem(0);
                //Navigator.pop(context);
              },
            ),
            Divider(),
            ListTile(
              title: Text("Http"),
              selected: (1 == _selectPosition),
              onTap: () {
                _onSelectItem(1);
              },
            ),
            Divider(),
            ListTile(
              title: Text("Orientation"),
              selected: (2 == _selectPosition),
              onTap: () {
                _onSelectItem(2);
              },
            )
          ],
        ),
      ),
      body: _getDraweItemWidget(_selectPosition),
    ));
  }
}
