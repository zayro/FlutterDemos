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
                title: Text("Navegar"),
                onTap: () {
                  Navigator.pushNamed(context, '/card');
                },
              )
            ],
          )),
    );
  }
}
