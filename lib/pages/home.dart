import 'package:flutter/material.dart';
import '../preferencias/usuario.dart';

import './http.dart';
import './orientation.dart';
import './text.dart';

import './placeholder.dart';

class HomePage extends StatefulWidget {
  //HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _prefs = new PreferenciasUsario();

  int _currentIndex = 0;
  final List<Widget> _children = [
    PlaceholderWidget(Colors.white),
    PlaceholderWidget(Colors.deepOrange),
    PlaceholderWidget(Colors.green)
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

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
    //Navigator.of(context).pop();
    Navigator.pop(context);
    setState(() => _selectPosition = val);
  }

  _onSelectItemOnTap(int val) {
    setState(() => _selectPosition = val);
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
    return Scaffold(
      appBar: AppBar(
        title: Text("Home $_selectPosition"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onSelectItemOnTap,
        currentIndex:
            _selectPosition, // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Text',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Http',
          ),
        ],
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
    );
  }
}
