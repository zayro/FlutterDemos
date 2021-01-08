import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';

class ServicioPush {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  final _mensajeStreamController = StreamController.broadcast();
  Stream get mensajesStream => _mensajeStreamController.stream;

  static Future<dynamic> mensajePush(Map<String, dynamic> message) async {
    if (message.containsKey('data')) {
      final dynamic data = message['data'];
    }

    if (message.containsKey('notification')) {
      final dynamic notification = message['notification'];
    }
  }

  iniciarNotificaciones() async {
    await _firebaseMessaging.requestNotificationPermissions();
    final token = await _firebaseMessaging.getToken();

    print("====================== token =================" + token);

    _firebaseMessaging.configure(
      onMessage: onMessage,
      onBackgroundMessage: mensajePush,
      onLaunch: onLaunch,
      onResume: onResume,
    );
  }

  Future<dynamic> onMessage(Map<String, dynamic> message) async {
    print("==========onMessage=============");

    final argumento = message['data'];
    _mensajeStreamController.sink.add(argumento);

    print(message);
    print(argumento);
  }

  Future<dynamic> onLaunch(Map<String, dynamic> message) async {
    print("==========onLaunch=============");
    // al final para el stream
    final argumento = message['data'];
    _mensajeStreamController.sink.add(argumento);

    print(argumento);
  }

  Future<dynamic> onResume(Map<String, dynamic> message) async {
    print("==========onResume=============");

    // al final para el stream
    final argumento = message['data'];
    _mensajeStreamController.sink.add(argumento);

    print(argumento);
  }

  dispose() {
    _mensajeStreamController?.close();
  }
}
