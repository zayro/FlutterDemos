import 'package:flutter/material.dart';
import './routes/index.dart';

void main() async {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Main',
    theme: ThemeData(
      // Define the default brightness and colors.
      brightness: Brightness.light,
      primaryColor: Colors.yellow[700],
      accentColor: Colors.grey[700],
      backgroundColor: Colors.white,
      cardColor: Colors.white,
      textSelectionColor: Colors.amber,

      // Define the default font family.
      //fontFamily: 'Georgia',
    ),
    initialRoute: "/home",
    routes: rootPath(),
    //home: HomePage(),
  ));
}
