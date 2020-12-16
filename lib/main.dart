import 'package:flutter/material.dart';

import './src/pages/contacts.dart';

import './src/pages/infoBasic.dart';

import './src/route.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      //initialRoute: '/',
      routes: {'/infoBasic': (context) => InfoBasicPage(name: "as")},
      onGenerateRoute: RouteGenerator.generateRoute,
      home: ContactPage(),
    );
  }
}
