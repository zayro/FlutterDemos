import 'dart:async';

class Validation {
  final validatePass =
      StreamTransformer<String, String>.fromHandlers(handleData: (data, skin) {
    if (data.length >= 6) {
      skin.add(data);
    } else {
      skin.addError('Ingrese mas caracteres');
    }
  });

  final validateEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (data, skin) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    return (regex.hasMatch(data))
        ? skin.add(data)
        : skin.addError('Error Email');
  });
}
