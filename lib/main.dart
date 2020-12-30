import 'package:flutter/material.dart';
//import './src/pages/login.page.dart';
import './route/route.dart';
import './preferencias/usuario.dart';
import './BloC/provider.dart';
import './pages/home.dart';

void main() async {
  final prefs = new PreferenciasUsario();
  WidgetsFlutterBinding();
  await prefs.initPrefs();

  runApp(Provider(
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/login",
      routes: rootPath(),
      //home: HomePage(),
    ),
  ));
}
