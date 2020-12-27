

import 'dart:async';

class Validaciones{

  final validarPassword = StreamTransformer<String, String>.fromHandlers(

    handleData: (password, skin){

      if(password.length >= 6){
        skin.add(password);
      }else{
        if(password.length > 0){
          skin.addError('Ingrese más de 6 caracteres');
        }else{
          skin.add(password);
        }
      }

    }

  );

  final validarEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: ( email, sink ) {


      Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regExp   = new RegExp(pattern);

      if ( regExp.hasMatch( email ) ) {
        sink.add( email );
      } else {
        sink.addError('Email no es correcto');
      }

    }
  );

}