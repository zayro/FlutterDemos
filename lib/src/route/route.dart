import 'package:flutter/material.dart';

import '../pages/splash.dart';

import '../pages/home.page.dart';
import '../pages/card.page.dart';
import '../pages/form.page.dart';
import '../pages/slider.page.dart';
import '../pages/list.page.dart';
import '../pages/http.page.dart';
import '../pages/list.page_interact.dart';

Map<String, WidgetBuilder> rootPath() {
  return <String, WidgetBuilder>{
    "/": (BuildContext context) => MyApp(),
    "/home": (BuildContext context) => HomePage(),
    "/card": (BuildContext context) => CardPage(),
    "/form": (BuildContext context) => FormText(),
    "/slider": (BuildContext context) => SlidersPage(),
    "/list": (BuildContext context) => ListPage(),
    "/listInteract": (BuildContext context) => ListaPageInteract(),
    "/http": (BuildContext context) => HttpConnect(),
  };
}
