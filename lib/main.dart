import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: ThemeData(
        // Define the default brightness and colors.
        brightness: Brightness.light,
        primaryColor: Colors.yellow[700],
        accentColor: Colors.grey[400],

        // Define the default font family.
        //fontFamily: 'Georgia',
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text('Material App Bar'),
          ),
          body: ListView(
            children: [
              ListTile(
                  title: Text("Marlon", style: TextStyle(fontSize: 20.0)),
                  subtitle: Text("+573015862"),
                  leading: Icon(Icons.access_alarm_sharp),
                  trailing: Icon(Icons.access_alarm_sharp)),
            ],
          )),
    );
  }
}
