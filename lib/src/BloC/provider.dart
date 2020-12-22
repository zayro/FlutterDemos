import 'package:flutter/rendering.dart';

import 'package:flutter/material.dart';
import './login.bloc.dart';

class Provider extends InheritedWidget {
  Provider({Key key, this.child}) : super(key: key, child: child);

  final loginBloc = new LoginBloc();

  final Widget child;

  static LoginBloc of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider>().loginBloc;
  }

  @override
  bool updateShouldNotify(Provider oldWidget) {
    return true;
  }
}
