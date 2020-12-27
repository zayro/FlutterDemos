import 'package:flutter/material.dart';
import '../pages/login.dart';
import '../pages/home.dart';
import '../pages/multimedia.dart';
import '../pages/http.dart';
import '../pages/orientation.dart';
import '../pages/text.dart';

Map<String, WidgetBuilder> rootPath() {
  return <String, WidgetBuilder>{
    "/login": (BuildContext context) => LoginPage(),
    "/home": (BuildContext context) => HomePage(),
    "/http": (BuildContext context) => HttpPage(),
    "/multimedia": (BuildContext context) => MultimediaPage(),
    "/orientation": (BuildContext context) => OrientationPage(),
    "/text": (BuildContext context) => TextPage(),
  };
}
