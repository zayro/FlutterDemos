import 'package:flutter/material.dart';
//import './src/pages/login.page.dart';
import './routes/route.dart';

void main() async {
  WidgetsFlutterBinding();

  runApp(
    MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: "/SlideTransition",
        routes: rootPath()),
  );
}
