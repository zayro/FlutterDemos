import 'package:flutter/material.dart';
//import './src/pages/login.page.dart';
import './route/route.dart';
import './preferencias/usuario.dart';
import './BloC/provider.dart';

void main() async {
  final prefs = new PreferenciasUsario();
  WidgetsFlutterBinding();
  await prefs.initPrefs();

  runApp(Provider(
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/home",
      routes: rootPath(),
    ),
  ));
}
