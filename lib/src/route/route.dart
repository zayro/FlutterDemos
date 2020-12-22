import 'package:flutter/material.dart';
import '../pages/login.page.dart';

Map<String, WidgetBuilder> rootPath() {
  return <String, WidgetBuilder>{
    "/login": (BuildContext context) => LoginPage()
  };
}
