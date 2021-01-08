import 'dart:convert';

import 'package:flutter/material.dart';
import './src/service/push.dart';
import './src/service/info.dart';
import './src/service/http.dart';
import './src/service/scan.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _notificacion;
  String nombre = "";

  final servicioPush = new ServicioPush();
  // Nota: Esto es un GlobalKey<FormState>, no un GlobalKey<MyCustomFormState>!
  final _formKey = GlobalKey<FormState>();

  final dataInfo = Info();

  final _http = HttpPush();
  final scan = ScanCode();

  String _token = "";
  String _serverToken = "";

  @override
  void initState() {
    super.initState();

    servicioPush.iniciarNotificaciones();

    servicioPush.mensajesStream.listen((argumento) {
      print("argumento desde main:");
      print(argumento);
      dataInfo.agregar(argumento);
      print("class info dataInfo ----------------:");
      print(dataInfo.data);

      nombre = argumento['usuario'] ?? '';

      _notificacion = argumento;

      setState(() {});
    });
  }

  @override
  void didUpdateWidget(covariant MyApp oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _message = TextEditingController();

    return MaterialApp(
        title: 'Material App',
        home: Scaffold(
          appBar: AppBar(
            title: Text("En linea : $nombre"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                SingleChildScrollView(
                    physics: ScrollPhysics(),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          TextFormField(
                            controller: _message,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter some text';
                              }
                            },
                            decoration: InputDecoration(
                                labelText: "Enter First Name",
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: RaisedButton(
                              onPressed: () {
                                // devolverá true si el formulario es válido, o falso si
                                // el formulario no es válido.
                                if (_formKey.currentState.validate()) {
                                  // Si el formulario es válido, queremos mostrar un Snackbar
                                  //Scaffold.of(context).showSnackBar(SnackBar(content: Text('Processing Data')));

                                  _http.sendAndRetrieveMessage(_message.text);
                                }
                              },
                              child: Text('Submit'),
                            ),
                          ),
                          Text("Token : $_token"),
                          Text("ServerToken: $_serverToken"),
                        ],
                      ),
                    )),
                SingleChildScrollView(
                  physics: ScrollPhysics(),
                  child: Padding(
                    padding: EdgeInsets.all(2),
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 200,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 2.0),
                          decoration: const BoxDecoration(
                            border: Border(
                              top: BorderSide(
                                  width: 1.0, color: Color(0xFFFF000000)),
                              left: BorderSide(
                                  width: 1.0, color: Color(0xFFFF000000)),
                              right: BorderSide(
                                  width: 1.0, color: Color(0xFFFF000000)),
                              bottom: BorderSide(
                                  width: 1.0, color: Color(0xFFFF000000)),
                            ),
                          ),
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: dataInfo.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              print("-------- $index --------");

                              return ListTile(
                                  leading: Icon(Icons.list),
                                  trailing: Text(
                                    dataInfo.data[index]['nombres'],
                                    style: TextStyle(
                                        color: (dataInfo.data[index]['type'] ==
                                                'remoto')
                                            ? Colors.green
                                            : Colors.red,
                                        fontSize: 15),
                                  ),
                                  title:
                                      Text("${dataInfo.data[index]['type']} "));
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Text("texto"),
                ),
              ],
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            shape: CircularNotchedRectangle(),
            child: Padding(
              padding: EdgeInsets.all(20.0),
            ),
          ),
          floatingActionButton: FloatingActionButton(
              child: Icon(Icons.camera),
              onPressed: () async {
                final data = await scan.scanQR();
                print("*****************************************************");
                print("scan.scanQR");
                print("*****************************************************");
                print(data);
                print("*****************************************************");
                Map<String, dynamic> scaneo = jsonDecode(data) as Map;
                print("*****************************************************");
                print('server, ${scaneo['key']}!');
                print("*****************************************************");
                print('token, ${scaneo['token']}!');
                print("*****************************************************");
                _http.serverToken = scaneo['server'];
                _http.token = scaneo['token'];

                setState(() {
                  _token = scaneo['token'];
                  _serverToken = scaneo['key'];
                });
              }),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.miniCenterDocked,
        ));
  }
}
