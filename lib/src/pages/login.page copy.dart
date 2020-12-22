import 'package:flutter/material.dart';

class LoginApp extends StatelessWidget {
  const LoginApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
              child: Container(
            color: Colors.grey,
            child: Center(
              child: Text("texto"),
            ),
          )),
          Positioned(
            top: 48.0,
            width: MediaQuery.of(context).size.width * 0.5,
            height: MediaQuery.of(context).size.height * 0.4,
            child: Container(
              color: Colors.white,
            ),
          ),
          Positioned(
              top: 0,
              child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.4,
                  color: Colors.red,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Icon(Icons.account_circle_outlined),
                      ),
                      Center(
                        child: Text("PERSONAL SOFT"),
                      )
                    ],
                  ))),
        ],
      ),
    );
  }
}
