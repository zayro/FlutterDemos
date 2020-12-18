import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  // This is a String for the sake of an example.
  // You can use any type you want.
  final data;

  InfoPage({
    Key key,
    @required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Routing App'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              data.title,
              style: TextStyle(fontSize: 50),
            ),
            Text(
              data.message,
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
