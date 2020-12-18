import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu Principal'),
      ),
      body: ListView(
        children: [
          Card(
            clipBehavior: Clip.antiAlias,
            color: Colors.green[100],
            child: Column(
              children: [
                ListTile(
                  title: const Text('Lista Basica'),
                  subtitle: Text(
                    'Leccion 1',
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Tematica de Listar y pasar Parametros.',
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.start,
                  children: [
                    FlatButton(
                      onPressed: () {
                        // Perform some action
                        Navigator.pushNamed(context, '/listaContactos');
                      },
                      child: const Text('Visualizar'),
                    ),
                  ],
                ),
                //   Image.asset('assets/card-sample-image.jpg'),
              ],
            ),
          ),
          Card(
            clipBehavior: Clip.antiAlias,
            color: Colors.lightGreen[300],
            child: Column(
              children: [
                ListTile(
                  title: const Text('Lista Avanzada'),
                  subtitle: Text(
                    'Leccion 2',
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Tematica de Listar, pasar Parametros, mejoras de diseño.',
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.start,
                  children: [
                    FlatButton(
                      onPressed: () {
                        // Perform some action
                        Navigator.pushNamed(context, '/listaContactosAvanzado');
                      },
                      child: const Text('Visualizar'),
                    ),
                  ],
                ),
                //   Image.asset('assets/card-sample-image.jpg'),
              ],
            ),
          ),
          Card(
            clipBehavior: Clip.antiAlias,
            color: Colors.lightGreen[300],
            child: Column(
              children: [
                ListTile(
                  title: const Text('Lista Datos Json'),
                  subtitle: Text(
                    'Leccion 3',
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Tematica de Listar, pasar Parametros, mejoras de diseño.',
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.start,
                  children: [
                    FlatButton(
                      onPressed: () {
                        // Perform some action
                        Navigator.pushNamed(context, '/listaDatos');
                      },
                      child: const Text('Visualizar'),
                    ),
                  ],
                ),
                //   Image.asset('assets/card-sample-image.jpg'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
