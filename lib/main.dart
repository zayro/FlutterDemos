import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // lista de elementos
  final _contacts = ["Miguel", "Marlon", "Edwin", "pepito"];

  List<Widget> listado() {
    return List.generate(
        _contacts.length,
        (i) => ListTile(
            title:
                Text("$i - ${_contacts[i]}", style: TextStyle(fontSize: 20.0)),
            subtitle: Text("+573015862"),
            leading: Icon(Icons.access_alarm_sharp),
            trailing: Icon(Icons.access_alarm_sharp)));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
          appBar: AppBar(
            title: Text('Material App Bar'),
          ),
          body: ListView(
              // Ejemplo Lista Fija
              /*  children: [
              ListTile(
                  title: Text("Marlon", style: TextStyle(fontSize: 20.0)),
                  subtitle: Text("+573015862"),
                  leading: Icon(Icons.access_alarm_sharp),
                  trailing: Icon(Icons.access_alarm_sharp)),
                 
            ], */
              children: listado())),
    );
  }
}
