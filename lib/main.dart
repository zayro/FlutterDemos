import 'package:flutter/material.dart';
import './routes/index.dart';

void main() async {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Main',
    theme: ThemeData(
        // Define the default brightness and colors.
        brightness: Brightness.light,
        primaryColor: Colors.brown,
        accentColor: Colors.orange,
        buttonColor: Colors.deepOrange
        // Define the default font family.
        //fontFamily: 'Georgia',
        ),
    initialRoute: "/home",
    routes: rootPath(),
    //home: HomePage(),
  ));
}
