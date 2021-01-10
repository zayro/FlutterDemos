import 'package:flutter/material.dart';
import 'package:listas/components/details/detalle.widget.dart';

import '../components/home/home.widget.dart';

Map<String, WidgetBuilder> rootPath() {
  return <String, WidgetBuilder>{
    "/home": (BuildContext context) => HomePage(),
    "/detail": (BuildContext context) => DetailProductPage(),
  };
}
