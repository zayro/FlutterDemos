import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:firebase_messaging/firebase_messaging.dart';

class HttpPush {
// Replace with server token from firebase console settings.
  String serverToken = '<Server-Token>';
  String token = '<Token>';

  // server
  // key=AAAA2_bTjgo:APA91bGViFX932lyg7F-tWZ4puD7oPlLlUOeukZIDXCHUqA4co_dLNKVeC5NbPAki0nCJ14iavC2EAwJ8iNYosjDrxlBgEEVpvYaieHX3RBAoArH90t0hY57TjKxjozU-_VVN86MINHJ

  //token
  // await firebaseMessaging.getToken(),

  final FirebaseMessaging firebaseMessaging = FirebaseMessaging();

  Future<Map<String, dynamic>> sendAndRetrieveMessage(value) async {
    await firebaseMessaging.requestNotificationPermissions(
      const IosNotificationSettings(
          sound: true, badge: true, alert: true, provisional: false),
    );

    print("TOKEN ---------------");
    print(await firebaseMessaging.getToken());

    await http.post(
      'https://fcm.googleapis.com/fcm/send',
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'key=$serverToken',
      },
      body: jsonEncode(
        <String, dynamic>{
          'notification': <String, dynamic>{
            'body': 'this is a body',
            'title': 'this is a title'
          },
          'priority': 'high',
          'data': <String, dynamic>{
            'click_action': 'FLUTTER_NOTIFICATION_CLICK',
            'id': '1',
            'nombres': value,
            "type": "local",
            'status': 'done'
          },
          'to': this.token,
        },
      ),
    );

    final Completer<Map<String, dynamic>> completer =
        Completer<Map<String, dynamic>>();

    firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        completer.complete(message);
      },
    );

    return completer.future;
  }
}
