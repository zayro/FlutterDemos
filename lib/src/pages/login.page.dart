import 'package:flutter/material.dart';
import '../BloC/provider.dart';
import '../BloC/login.bloc.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
          onChanged: bloc.setEmail,
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
          onChanged: bloc.chagePassword,
        );
      },
    );
  }

  Widget _boton() {
    return RaisedButton(
      color: Colors.red,
      child: Text("ingresar", style: TextStyle(color: Colors.white)),
      onPressed: () {},
    );
  }
}