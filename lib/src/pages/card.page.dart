import 'package:flutter/material.dart';

import '../alert/alert.dart';

class CardPage extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  //SnackBar
  void mostrarSnackbar(String mensaje) {
    final snackbar = SnackBar(
      content: Text(mensaje),
      duration: Duration(milliseconds: 3000),
    );

    scaffoldKey.currentState.showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    //Alert
    final AlertDialog dialog = AlertDialog(
      title: Text('Reset settings?'),
      content:
          Text('This will reset your device to its default factory settings.'),
      actions: [
        FlatButton(
          textColor: Color(0xFF6200EE),
          onPressed: () => Navigator.pop(context),
          child: Text('CANCEL'),
        ),
        FlatButton(
          textColor: Color(0xFF6200EE),
          onPressed: () => Navigator.pop(context),
          child: Text('ACCEPT'),
        ),
      ],
    );

    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: Text('Snackbars'),
          actions: [SnackbarButton()],
        ),
        body: ListView(
          children: [cardLocal(context, dialog), cardHttp()],
        ));
  }

  cardHttp() {
    return Card(
        clipBehavior: Clip.antiAlias,
        child: Column(children: [
          ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.account_circle_outlined),
            ),
            title: const Text('Card Http'),
            subtitle: Text(
              'Text about Card',
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.network('https://picsum.photos/250?image=9')),
          //child: Image.asset('assets/images/shield.jpg', )),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Esta es una imagen Generada con HTTP https://picsum.photos/250?image=9.',
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.start,
            children: [
              FlatButton(
                //ElevatedButton: const Color(0xFF6200EE),
                onPressed: () {
                  // Perform some action
                },
                child: const Text('CANCEL'),
              ),
              ElevatedButton(
                //textColor: const Color(0xFF6200EE),
                onPressed: () {
                  // Perform some action
                },
                child: const Text('SEND'),
              ),
            ],
          ),
          //Image.network('https://picsum.photos/250?image=9'),
        ]));
  }

  cardLocal(BuildContext context, dialog) {
    return Card(
        clipBehavior: Clip.antiAlias,
        child: Column(children: [
          ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.account_circle_outlined),
            ),
            title: const Text('Card Local'),
            subtitle: Text(
              'Text about Card',
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(20.0),
              //child: Image.network('https://picsum.photos/250?image=9')),
              child: Image.asset(
                'assets/images/shield.jpg',
              )),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Esta es una imagen Generada atra vez de un folder local llamado assets. assets/images/shield.jpg',
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.start,
            children: [
              FlatButton(
                //ElevatedButton: const Color(0xFF6200EE),
                onPressed: () {
                  // Perform some action
                  mostrarSnackbar("Guardando...");
                },
                child: const Text('CANCEL'),
              ),
              ElevatedButton(
                //textColor: const Color(0xFF6200EE),
                onPressed: () {
                  // Perform some action
                  showDialog<void>(
                      context: context, builder: (context) => dialog);
                },
                child: const Text('SEND'),
              ),
            ],
          ),
          //Image.network('https://picsum.photos/250?image=9'),
        ]));
  }
}
