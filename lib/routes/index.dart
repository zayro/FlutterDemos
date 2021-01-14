import 'package:flutter/material.dart';
import 'package:listas/components/home/home.widget.dart';
import 'package:listas/components/login/login.widget.dart';
import 'package:listas/components/products/product.widget.dart';

Map<String, WidgetBuilder> rootPath() {
  return <String, WidgetBuilder>{
    "/login": (BuildContext context) => LoginPage(),
    "/home": (BuildContext context) => HomePage(),
    "/product": (BuildContext context) => ProductPage(),
  };
}
