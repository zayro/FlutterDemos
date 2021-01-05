import 'package:flutter/material.dart';
import '../views/ListUrl.dart';
import '../views/ListMap.dart';
import '../views/MapParams.dart';
import '../home.dart';

Map<String, WidgetBuilder> rootPath() {
  return <String, WidgetBuilder>{
    "/ListMap": (BuildContext context) => ListMap(),
    "/ListUrl": (BuildContext context) => ListUrl(),
    "/MapParam": (BuildContext context) => MapParam(),
    "/home": (BuildContext context) => HomePage(),
  };
}
