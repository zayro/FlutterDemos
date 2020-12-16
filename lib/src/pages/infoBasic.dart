import 'package:flutter/material.dart';

class InfoBasicPage extends StatelessWidget {
  final String name;

  InfoBasicPage({this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Info Contacs"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back! $name'),
        ),
      ),
    );
  }
}
