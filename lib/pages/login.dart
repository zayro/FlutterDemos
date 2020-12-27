import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'dart:async';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LocalAuthentication auth = LocalAuthentication();
  bool _canCheckBiometrics;
  List<BiometricType> _availableBiometrics;
  String _authorized = 'Not Authorized';
  bool _isAuthenticating = false;

  Future<void> _checkBiometrics() async {
    bool canCheckBiometrics;
    try {
      canCheckBiometrics = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;

    setState(() {
      _canCheckBiometrics = canCheckBiometrics;
    });
  }

  Future<void> _getAvailableBiometrics() async {
    List<BiometricType> availableBiometrics;
    try {
      availableBiometrics = await auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;

    setState(() {
      _availableBiometrics = availableBiometrics;
    });
  }

  Future<void> _authenticate() async {
    bool authenticated = false;
    try {
      setState(() {
        _isAuthenticating = true;
        _authorized = 'Authenticating';
      });
      authenticated = await auth.authenticateWithBiometrics(
          localizedReason: 'Scan your fingerprint to authenticate...',
          useErrorDialogs: true,
          stickyAuth: true);
      setState(() {
        _isAuthenticating = false;
        _authorized = 'Authenticating';
      });
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;

    final String message = authenticated ? 'Authorized' : 'Not Authorized';
    setState(() {
      _authorized = message;
    });
  }

  void _cancelAuthentication() {
    auth.stopAuthentication();
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    var container = Container(
      //height: _size.height * 0.3,
      padding: EdgeInsets.symmetric(vertical: 35.0),
      //color: Colors.amber,
      child: Center(
        child: Text(
          "Login",
          style: TextStyle(
              color: Colors.white, fontSize: 48.0, fontWeight: FontWeight.bold),
        ),
      ),
    );
    var container2 = Container(
        //color: Colors.blue,
        //height: _size.height * 0.3,
        padding: const EdgeInsets.symmetric(vertical: 35.0),
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  children: [
                    TextFormField(
                      initialValue: '',
                      cursorColor: Theme.of(context).cursorColor,
                      //maxLength: 20,
                      decoration: InputDecoration(
                        icon: Icon(Icons.email),
                        hoverColor: Colors.white,
                        labelText: 'Digit Email',
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    TextFormField(
                      initialValue: '',
                      cursorColor: Theme.of(context).cursorColor,
                      //maxLength: 20,
                      decoration: InputDecoration(
                        fillColor: Colors.grey,
                        focusColor: Colors.grey,
                        icon: Icon(Icons.shield),
                        hoverColor: Colors.white,
                        labelText: 'Digit Password',
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                )),
            Container(
              width: double.infinity,
              child: RaisedButton(
                onPressed: () {
                  // Perform some action

                  Navigator.pushNamed(context, '/home');
                },
                color: Colors.blue,
                elevation: 0.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'INGRESAR',
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ));
    var container3 = Container(
      //margin: EdgeInsets.symmetric(vertical: 20),
      width: double.infinity,
      //color: Colors.red,
      //height: _size.height * 0.2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Icon(
            Icons.fingerprint,
            color: Colors.blue,
            size: 120,
          ),
          Text(
            "FingerPrint Auth",
            style: TextStyle(
                color: Colors.white,
                fontSize: 28.0,
                fontWeight: FontWeight.bold),
          ),
          Container(
            //width: 280.0,
            child: Text(
              "Auntenticar using your fingerprint instead of your password",
              style: TextStyle(
                color: Colors.white,
                fontSize: 12.0,
              ),
            ),
          ),
        ],
      ),
    );
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        //backgroundColor: Color(0xFF3C3),
        backgroundColor: Colors.grey[900],
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.2, horizontal: 10),
            child: Column(
              children: [
                container,
                container2,
                container3,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/* ConstrainedBox(
          constraints: const BoxConstraints.expand(),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text('Can check biometrics: $_canCheckBiometrics\n'),
                RaisedButton(
                  child: const Text('Check biometrics'),
                  onPressed: _checkBiometrics,
                ),
                Text('Available biometrics: $_availableBiometrics\n'),
                RaisedButton(
                  child: const Text('Get available biometrics'),
                  onPressed: _getAvailableBiometrics,
                ),
                Text('Current State: $_authorized\n'),
                RaisedButton(
                  child: Text(_isAuthenticating ? 'Cancel' : 'Authenticate'),
                  onPressed:
                      _isAuthenticating ? _cancelAuthentication : _authenticate,
                )
              ])
              
              ) */
