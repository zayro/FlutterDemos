import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text('App Bar'),
          ),
          body: ListView(
            children: [
              ListTile(
                title: Text("Card"),
                onTap: () {
                  Navigator.pushNamed(context, '/card');
                },
              ),
              ListTile(
                title: Text("Form"),
                onTap: () {
                  Navigator.pushNamed(context, '/form');
                },
              ),
              ListTile(
                title: Text("Slider"),
                onTap: () {
                  Navigator.pushNamed(context, '/slider');
                },
              ),
              ListTile(
                title: Text("List"),
                onTap: () {
                  Navigator.pushNamed(context, '/list');
                },
              ),
              ListTile(
                title: Text("List Interact"),
                onTap: () {
                  Navigator.pushNamed(context, '/listInteract');
                },
              ),
              ListTile(
                title: Text("Http"),
                onTap: () {
                  Navigator.pushNamed(context, '/http');
                },
              )
            ],
          )),
    );
  }
}
