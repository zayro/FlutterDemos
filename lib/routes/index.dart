import 'package:flutter/material.dart';

import '../components/home/home.widget.dart';

Map<String, WidgetBuilder> rootPath() {
  return <String, WidgetBuilder>{
    "/home": (BuildContext context) => HomePage(),
  };
}
