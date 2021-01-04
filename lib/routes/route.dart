import 'package:flutter/material.dart';
import '../pages/AnimatedContainer.dart';
import '../pages/AnimatedBuilder.dart';
import '../pages/DecoratedBoxTransition.dart';
import '../pages/PositionedTransition.dart';
import '../pages/SlideTransition.dart';
import '../home.dart';

Map<String, WidgetBuilder> rootPath() {
  return <String, WidgetBuilder>{
    "/": (BuildContext context) => HomePage(),
    "/AnimatedContainer": (BuildContext context) => AnimatedContainerExample(),
    "/AnimatedBuilder": (BuildContext context) => AnimatedBuilderExample(),
    "/DecoratedBoxTransition": (BuildContext context) =>
        DecoratedBoxTransitionExample(),
    "/PositionedTransition": (BuildContext context) =>
        PositionedTransitionExample(),
    "/SlideTransition": (BuildContext context) => SlideTransitionExample()
  };
}
