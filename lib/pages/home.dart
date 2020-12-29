import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import './list.dart';
import '../service/db_servicio.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() {
    //DBServicio();
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  String nombre = "", apellido = "";
  List registros = [];

  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  final servicio = DBServicio();

  Future crearList() async {
    print("$nombre $apellido");
    List<String> save = [];
    save.add(nombre);
    save.add(apellido);
    print(save);
    return await servicio.add(save);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("init state");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    var container = Container(
      //height: _size.height * 0.3,
      padding: EdgeInsets.symmetric(vertical: 5.0),
      //color: Colors.amber,
      child: Center(
        child: Text(
          "Ingreso Personal",
          style: TextStyle(
              color: Colors.grey, fontSize: 28.0, fontWeight: FontWeight.bold),
        ),
      ),
    );

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
            Icons.person_add,
            color: Colors.blue,
            size: 60,
          ),
          Text(
            "Lista de personas",
            style: TextStyle(
                //color: Colors.white,
                fontSize: 18.0,
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

    //MAIN
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Text("Formulario"),
            automaticallyImplyLeading: false,
          ),
          //backgroundColor: Colors.grey[900],
          body: Builder(
              // Create an inner BuildContext so that the onPressed methods
              // can refer to the Scaffold with Scaffold.of().
              builder: (BuildContext context) {
            return SingleChildScrollView(
              physics: ScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.all(25),
                child: Column(
                  children: <Widget>[
                    container,
                    buildContainer2(context),
                    container3,
                    ListPerson(data: registros)
                  ],
                ),
              ),
            );
          })),
    );
  }

  Container buildContainer2(BuildContext context) {
    return Container(
        //color: Colors.blue,
        //height: _size.height * 0.3,
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(5.0),
                child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          //initialValue: nombre,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          cursorColor: Theme.of(context).cursorColor,
                          onChanged: (val) {
                            setState(() {
                              nombre = val;
                            });
                          },
                          //maxLength: 20,
                          decoration: InputDecoration(
                            //icon: Icon(Icons.person),
                            hoverColor: Colors.grey,
                            labelText: 'Digit Name',
                            labelStyle: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        TextFormField(
                          //initialValue: apellido,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          cursorColor: Theme.of(context).cursorColor,
                          onChanged: (val) {
                            setState(() {
                              apellido = val;
                            });
                          },
                          //maxLength: 20,
                          decoration: InputDecoration(
                            fillColor: Colors.grey,
                            focusColor: Colors.grey,
                            //icon: Icon(Icons.shield),
                            hoverColor: Colors.grey,
                            labelText: 'Digit Lastname',
                            labelStyle: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: double.infinity,
                          child: RaisedButton(
                            onPressed: () {
                              // Perform some action
                              // Validate returns true if the form is valid, or false
                              // otherwise.
                              if (_formKey.currentState.validate()) {
                                // If the form is valid, display a Snackbar.
                                // show the dialog
                                showDialog(
                                    context: context,
                                    builder: (_) => new AlertDialog(
                                          title: new Text("Send Info"),
                                          content: new Text("process data!"),
                                        ));

                                crearList().then((value) => {
                                      Scaffold.of(context).showSnackBar(
                                          SnackBar(
                                              content:
                                                  Text("Row Insert $value")))
                                    });

                                _formKey.currentState.reset();
                                setState(() {
                                  nombre = "";
                                  apellido = "";
                                });
                              }
                            },
                            color: Colors.lightBlue[800],
                            elevation: 0.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'SEND',
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ))),
          ],
        ));
  }
}
