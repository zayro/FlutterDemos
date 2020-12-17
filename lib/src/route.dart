import 'package:flutter/material.dart';
/**
 * Agregar Rutas
 */
import './pages/info.dart';
import './pages/infoAdvanc.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case '/info':
        return MaterialPageRoute(
          builder: (_) => InfoPage(
            data: args,
          ),
        );
      case '/infoAdvanced':
        return MaterialPageRoute(
          builder: (_) => InfoPageAdvanced(
            data: args,
          ),
        );
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
