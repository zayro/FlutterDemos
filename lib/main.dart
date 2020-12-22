import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import './src/route/route.dart';

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: "/",
    routes: rootPath(),
  ));
}
