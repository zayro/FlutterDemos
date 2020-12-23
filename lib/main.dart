import 'package:flutter/material.dart';
//import './src/pages/login.page.dart';
import './src/route/route.dart';
import './src//preferencias/usuario.dart';
import './src/BloC/provider.dart';

void main() {
  runApp(Provider(
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/login",
      routes: rootPath(),
    ),
  ));
}
