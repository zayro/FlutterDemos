import 'package:flutter/material.dart';

import 'routes/index.dart';

//import './home.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: "/home",
    routes: rootPath(),
    //home: HomePage(),
  ));
}
