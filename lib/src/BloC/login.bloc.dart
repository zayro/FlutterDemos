import 'dart:async';
import '../validate/validation.dart';

class LoginBloc with Validation {
  // crea el broadcast de las variables
  final _passControler = StreamController<String>.broadcast();
  final _emailControler = StreamController<String>.broadcast();

  // recuerpa el valor de la variable
  //Stream<String> get getPassword => _passControler.stream;
  Stream<String> get getPassword =>
      _passControler.stream.transform(validatePass);

  // modifica el valor de la variable
  Function(String) get chagePassword => _passControler.sink.add;

  /**
   * Validation Email
   */

  Stream get getEmail => _emailControler.stream.transform(validateEmail);

  Function get setEmail => _emailControler.sink.add;

  dispose() {
    _passControler?.close();
    _emailControler?.close();
  }
}
