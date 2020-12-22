import 'dart:async';

class LoginBloc {
  // crea el broadcast de las variables
  final _passControler = StreamController.broadcast();

  // recuerpa el valor de la variable
  Stream get getPassword => _passControler.stream;

  // modifica el valor de la variable
  Function get chagePassword => _passControler.sink.add;

  dispose() {
    _passControler?.close();
  }
}
