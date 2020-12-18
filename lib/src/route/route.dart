import 'package:flutter/material.dart';

import '../pages/home.page.dart';
import '../pages/card.page.dart';

Map<String, WidgetBuilder> rootPath() {
  return <String, WidgetBuilder>{
    "/": (BuildContext context) => HomePage(),
    "/card": (BuildContext context) => CardPage()
  };
}
