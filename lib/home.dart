import 'package:flutter/material.dart';

import './pages/AnimatedContainer.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Column(
        children: [
          Center(
            child: MaterialButton(
              color: Colors.amber,
              child: Text("AnimatedContainer"),
              onPressed: () {
                Navigator.push(
                    context,
                    PageRouteBuilder(
                        transitionDuration: Duration(seconds: 2),
                        transitionsBuilder: (BuildContext contex,
                            Animation<double> animation,
                            Animation<double> secanimation,
                            Widget child) {
                          return ScaleTransition(
                            alignment: Alignment.center,
                            scale: animation,
                            child: child,
                          );
                        },
                        pageBuilder: (BuildContext contex,
                            Animation<double> animation,
                            Animation<double> secanimation) {
                          return AnimatedContainerExample();
                        }));
              },
            ),
          )
        ],
      ),
    );
  }
}
