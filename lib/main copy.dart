import 'package:flutter/material.dart';
import './routes/index.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client/socket_io_client.dart';

void main() {
  // Dart client
  IO.Socket socket = IO.io('http://localhost:3000');
  socket.onConnect((_) {
    print('connect');
    socket.emit('msg', 'test');
  });
  socket.on('event', (data) => print(data));
  socket.onDisconnect((_) => print('disconnect'));
  socket.on('fromServer', (_) => print(_));

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Main',
    theme: ThemeData(
      // Define the default brightness and colors.
      brightness: Brightness.light,
      primaryColor: Colors.yellow[700],
      accentColor: Colors.grey[700],
      backgroundColor: Colors.white,
      cardColor: Colors.white,
      textSelectionColor: Colors.amber,

      // Define the default font family.
      //fontFamily: 'Georgia',
    ),
    initialRoute: "/home",
    routes: rootPath(),
    //home: HomePage(),
  ));
}
