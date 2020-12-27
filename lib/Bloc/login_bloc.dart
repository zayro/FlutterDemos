import './validaciones.dart';
import 'dart:async';

class LoginBloc with Validaciones {
  // controlador de la variable password
  final _passwordController = StreamController<String>.broadcast();
  final _emaildController = StreamController<String>.broadcast();

  // escucha o recupera el valor de la variable
  Stream<String> get paswordStream =>
      _passwordController.stream.transform(validarPassword);
  Stream<String> get emailStream =>
      _emaildController.stream.transform(validarEmail);

  // el que inserta los valores nuevos de la variable
  Function(String) get changePassword => _passwordController.sink.add;
  Function(String) get changeEmail => _emaildController.sink.add;

  dispose() {
    _passwordController?.close();
    _emaildController?.close();
  }
}
