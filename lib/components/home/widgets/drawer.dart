import 'package:flutter/material.dart';

class DrawerCustom extends StatelessWidget {
  const DrawerCustom({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
              accountName: Text("MARLON ZAYRO ARIAS VARGAS"),
              accountEmail: Text("ZAYRO8905@GMAIL.COM"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Theme.of(context).accentColor,
                child: Text("M"),
              )),
          ListTile(
            title: Text("Cerrar sesion"),
            onTap: () {
              //cerrar_session();
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
            //selected: (0 == _selectPosition),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            title: Text("Http"),
            //selected: (1 == _selectPosition),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            title: Text("Orientation"),
            //selected: (2 == _selectPosition),
            onTap: () {},
          )
        ],
      ),
    );
  }
}
