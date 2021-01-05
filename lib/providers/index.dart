import 'package:flutter/foundation.dart';

import '../views/ListMap.dart';
import '../views/ListUrl.dart';
import '../views/welcome.dart';

class MyProvider with ChangeNotifier {
  String _mitexto =
      "Texto Inicial"; //Dentro de nuestro provider, creamos e inicializamos nuestra variable.

  String get mitexto =>
      _mitexto; //Creamos el metodo Get, para poder obtener el valor de mitexto

  //Ahora creamos el metodo set para poder actualizar el valor de _mitexto, este metodo recibe un valor newTexto de tipo String
  set mitexto(String newTexto) {
    _mitexto = newTexto; //actualizamos el valor
    notifyListeners(); //notificamos a los widgets que esten escuchando el stream.
  }

  bool _updateList = false;

  bool get updateList => _updateList;

  set updateList(bool value) {
    _updateList = value;
    notifyListeners();
  }

  num pageCurrent = 0;

  handleState() {
    //print("handleState $val");
    print("handleState $pageCurrent");

    switch (pageCurrent) {
      case 0:
        return ListMap();
        break;
      case 1:
        return ListUrl();
        break;
      default:
        return Welcome();
        break;
    }
  }
}
