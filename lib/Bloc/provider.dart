import 'package:flutter/material.dart';
import './login_bloc.dart';

class Provider extends InheritedWidget {
  @override
  final loginBloc = LoginBloc();

  Provider({Key key, Widget child}) : super(key: key, child: child);

  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;

  static LoginBloc of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider>().loginBloc;
  }
}
