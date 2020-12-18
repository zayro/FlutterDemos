import 'package:flutter/material.dart';

import '../../service/contact.dart';

class ListaDatos extends StatelessWidget {
  List<Widget> _cargarDatos() {
    contactProvider.loadContact();

    return [];
  }

  @override
  Widget build(BuildContext context) {
    // load data
    List<Widget> _jsonLoad(List<dynamic> datos, BuildContext context) {
      final List<Widget> opciones = [];

      datos.forEach((element) {
        final elemWidget = ListTile(
          title: Text(element['Nombres']),
          leading: CircleAvatar(
              child: Text(
            element['icono'],
            style: TextStyle(fontFamily: 'MaterialIcons'),
          )),
        );
        opciones.add(elemWidget);
      });

      return opciones;
    }

    Widget httpLoad() {
      return FutureBuilder(
          future: contactProvider.remoteContact(),
          builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
            if (snapshot.hasData) {
              return ListView(children: _jsonLoad(snapshot.data, context));
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          });
    }

    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
          appBar: AppBar(
            title: Text('Material App Bar'),
          ),
          body: httpLoad()),
    );
  }
}
