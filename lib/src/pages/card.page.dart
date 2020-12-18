import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        buttonColor: Colors.blue,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text('Material App Card'),
          ),
          body: ListView(
            children: [cardLocal(), cardHttp()],
          )),
    );
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

  cardLocal() {
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
}
