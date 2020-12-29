import 'package:flutter/material.dart';
import 'package:listas/pages/list.dart';

import '../pages/home.dart';

Map<String, WidgetBuilder> rootPath() {
  return <String, WidgetBuilder>{
    "/home": (BuildContext context) => HomePage(),
    "/list": (BuildContext context) => ListPerson(),
  };
}
