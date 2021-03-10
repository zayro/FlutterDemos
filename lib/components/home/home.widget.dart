import 'package:flutter/material.dart';
import 'package:listas/stream/index.dart';

//Step3: Build widgets with streambuilder

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  StreamSocket streamSocket = StreamSocket();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Center(
              child: Text("texto"),
            ),
            StreamBuilder(
              stream: streamSocket.getResponse,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                print(snapshot);
                print(snapshot.data);
                return Text("data");
              },
            ),
          ],
        ),
      ),
    );
  }
}
