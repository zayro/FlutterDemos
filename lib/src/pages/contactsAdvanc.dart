import 'package:flutter/material.dart';

class ScreenArguments {
  final String title;
  final String message;

  ScreenArguments(this.title, this.message);
}

class ContactPageAdvanced extends StatelessWidget {
  // lista de elementos
  final _contacts = ["Miguel", "Marlon", "Edwin", "Diego"];

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
            Navigator.pushNamed(
              context,
              '/infoAdvanced',
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
          body: ListView(children: _cargarLista3())),
    );
  }
}
