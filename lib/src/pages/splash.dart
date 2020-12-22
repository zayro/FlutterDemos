import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double _width = 200.0;
  double _height = 200.0;

  double _updateState() {
    setState(() {
      this._width = 500.0;
      this._height = 500.0;
    });
  }

  @override
  void initState() {
// TODO: implement initState
    super.initState();
    Future.delayed(
        Duration(seconds: 3), () => {Navigator.pushNamed(context, '/home')});
  }

  @override
  Widget build(BuildContext context) {
    var sizedBox = SizedBox(
      height: 50.5,
    );
    var center = Center(
      child: Text(
        "Welcome App",
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 50, color: Colors.blue[300]),
      ),
    );
    var center2 = Center(
      child: FlutterLogo(
        size: 300,
        curve: Curves.bounceOut,
      ),
    );
    var center3 = Center(
      child: Text(
        "Loading App ...",
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
      ),
    );
    var center4 = Center(
      child: Text(
        "By Marlon Zayro Arias Vargas.",
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 10, color: Colors.white),
      ),
    );
    var safeArea = SafeArea(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        center,
        sizedBox,
        center2,
        sizedBox,
        CircularProgressIndicator(),
        sizedBox,
        center3,
        sizedBox,
        center4
      ],
    ));
    return Scaffold(
      body: Center(
          child: Container(
              child: safeArea,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.blue[400], Colors.blue[900]])))),
    );
  }
}
