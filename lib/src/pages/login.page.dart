import 'package:flutter/material.dart';
import '../BloC/provider.dart';

import '../BloC/login.bloc.dart';
import '../service/service.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _servicio = Servicio();

  String _emailText = '';
  String _passwordText = '';

  void _peticion() async {
    Map info = await _servicio.login(_emailText, _passwordText);

    if (info['ok']) {
      Navigator.pushNamed(context, 'home');
    } else {
      _alertaLogueo(context);
    }
  }

  void _alertaLogueo(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (context) {
        return AlertDialog(
          title: Text('Alerta'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Usuario y/o contrasena invalida'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Aceptar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Stack(
        children: <Widget>[_fondoRojo(), _login(context)],
      ),
    );
  }

  Widget _fondoRojo() {
    final size = MediaQuery.of(context).size;

    final cabecera = Container(
      height: size.height * 0.4,
      width: double.infinity,
      color: Colors.red,
    );

    final titulo = Container(
      margin: EdgeInsets.only(top: 60.0),
      child: Center(
        child: Column(
          children: <Widget>[
            Icon(
              Icons.account_circle,
              size: 100.0,
              color: Colors.white,
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              "Login Personal Soft",
              style: TextStyle(fontSize: 25.0, color: Colors.white),
            )
          ],
        ),
      ),
    );

    return Stack(
      children: <Widget>[cabecera, titulo],
    );
  }

  Widget _login(BuildContext context) {
    final bloc = Provider.of(context);

    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SafeArea(
            child: Container(
              height: 200.0,
            ),
          ),
          Container(
            width: size.width * 0.8,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5.0)),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: <Widget>[
                  Text(
                    "Ingreso",
                    style: TextStyle(
                      fontSize: 19.0,
                    ),
                  ),
                  _email(bloc),
                  SizedBox(
                    height: 10.0,
                  ),
                  _password(bloc),
                  SizedBox(
                    height: 20.0,
                  ),
                  _boton()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _email(bloc) {
    return StreamBuilder(
      stream: bloc.getEmail,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return TextField(
          keyboardType: TextInputType.emailAddress,
          //onChanged: bloc.setEmail,
          onChanged: (valor) {
            setState(() {
              _emailText = valor;
            });
            bloc.setEmail;
          },
          decoration: InputDecoration(
              errorText: snapshot.error,
              icon: Icon(Icons.alternate_email, color: Colors.red),
              labelText: 'Email',
              hintText: 'Ingrese email'),
        );
      },
    );
  }

  Widget _password(bloc) {
    return StreamBuilder(
      stream: bloc.getPassword,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return TextField(
          obscureText: false,
          decoration: InputDecoration(
              errorText: snapshot.error,
              icon: Icon(Icons.lock, color: Colors.red),
              labelText: 'Contrasena',
              hintText: 'Ingrese contrasena',
              //
              counterText: snapshot.data),
          //onChanged: bloc.chagePassword,
          onChanged: (valor) {
            setState(() {
              _passwordText = valor;
            });
            bloc.chagePassword;
          },
        );
      },
    );
  }

  Widget _boton() {
    return RaisedButton(
      color: Colors.red,
      child: Text("ingresar", style: TextStyle(color: Colors.white)),
      onPressed: () {
        _servicio.login(_emailText, _passwordText);
      },
    );
  }
}
