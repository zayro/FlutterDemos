import 'package:flutter/material.dart';
/**
 * Agregar Rutas
 */
import 'pages/Listabasica/info.dart';
import 'pages/ListaAvanzada/infoAdvanc.dart';
import 'pages/ListaDatos/ListaDatos.dart';

import 'pages/Listabasica/contacts.dart';
import 'pages/ListaAvanzada/contactsAdvanc.dart';

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
      case '/listaDatos':
        return MaterialPageRoute(
          builder: (_) => ListaDatos(),
        );
      case '/listaContactosAvanzado':
        return MaterialPageRoute(
          builder: (_) => ContactPageAdvanced(),
        );
      case '/listaContactos':
        return MaterialPageRoute(
          builder: (_) => ContactPage(),
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
