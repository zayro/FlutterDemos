import 'package:flutter/material.dart';

//import './infoBasic.dart';

class ScreenArguments {
  final String title;
  final String message;

  ScreenArguments(this.title, this.message);
}

class ContactPage extends StatelessWidget {
  // lista de elementos
  final _contacts = ["Miguel", "Marlon", "Edwin", "Diego"];

  List<Widget> _cargarLista1() {
    return List.generate(
        _contacts.length,
        (i) => ListTile(
            title:
                Text("$i - ${_contacts[i]}", style: TextStyle(fontSize: 20.0)),
            subtitle: Text("+573015862"),
            leading: Icon(Icons.access_alarm_sharp),
            trailing: Icon(Icons.access_alarm_sharp)));
  }

  List<Widget> _cargarLista2() {
    return _contacts.map((item) {
      return ListTile(
        title: Text(item),
        subtitle: Text("12345678"),
        trailing: Icon(Icons.access_alarms_rounded),
        leading: Icon(Icons.ac_unit),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _cargarLista3() {
      return _contacts.map((item) {
        return ListTile(
          title: Text(item),
          subtitle: Text("12345678"),
          trailing: Icon(Icons.arrow_forward_ios_outlined),
          leading: CircleAvatar(
            child: Text(item.substring(0, 1).toUpperCase()),
          ),
          onTap: () {
            //Navigator.push(context,MaterialPageRoute(builder: (context) => InfoPage(name: item)));
            //Navigator.pushNamed(context, '/infoBasic', arguments: InfoBasicPage(name: item));
            Navigator.pushNamed(
              context,
              '/info',
              arguments: ScreenArguments('Contact', item),
            );
          },
        );
      }).toList();
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
              children: _cargarLista3())),
    );
  }
}
