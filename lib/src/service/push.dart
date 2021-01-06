import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';

class ServicioPush {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

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

    print(argumento);
  }

  Future<dynamic> onLaunch(Map<String, dynamic> message) async {
    print("==========onLaunch=============");
    // al final para el stream
    final argumento = message['data'];

    print(argumento);
  }

  Future<dynamic> onResume(Map<String, dynamic> message) async {
    print("==========onResume=============");

    // al final para el stream
    final argumento = message['data'];

    print(argumento);
  }
}
