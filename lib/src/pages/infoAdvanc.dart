import 'package:flutter/material.dart';

class InfoPageAdvanced extends StatelessWidget {
  final data;

  // lista de elementos
  final _contacts = ["Miguel", "Marlon", "Edwin", "Diego"];

  InfoPageAdvanced({
    Key key,
    @required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> _cargarLista() {
      List<Widget> lst = new List<Widget>();

      for (int i = 0; i < 20; i++) {
        final lisTile = ListTile(
          title: Text("Item $i"),
          leading: Icon(Icons.account_box_outlined),
          trailing: Icon(Icons.arrow_circle_down),
          subtitle: Text("Info del Item $i"),
        );

        lst.add(lisTile);
      }

      return lst;
    }

    Widget _seccionListView() {
      return Container(
        child: ListView(children: _cargarLista()),
      );
    }

    Widget _bottonFloat() {
      return Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        FloatingActionButton(
            onPressed: () {
              // Add your onPressed code here!
            },
            heroTag: "boton1",
            child: Icon(Icons.add),
            backgroundColor: Colors.green),
        FloatingActionButton(
            onPressed: () {
              // Add your onPressed code here!
            },
            heroTag: "boton2",
            child: Icon(Icons.mouse),
            backgroundColor: Colors.green),
      ]);
    }

    Card container() {
      return Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  CircleAvatar(
                    minRadius: 20.0,
                    maxRadius: 40.0,
                    backgroundImage: AssetImage('assets/images/avatar.png'),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    data.message,
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.6), fontSize: 20.0),
                  ),
                ],
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.book,
                      color: Colors.blue,
                      size: 25.0,
                    ),
                    Text(
                      "1020300",
                      style: TextStyle(color: Colors.green, fontSize: 15.0),
                    ),
                  ],
                )
              ],
            ),

            //Image.asset('assets/images/avatar.png'),
          ],
        ),
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('Crear Solicitud'),
        ),
        body: Container(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                container(),
                SizedBox(
                  height: 10.5,
                ),
                Expanded(child: _seccionListView()),
                SizedBox(
                  height: 10.5,
                ),
                _bottonFloat(),
                SwitchListTile(
                    title: Text("Listado"), value: true, onChanged: null)
              ],
            )));
  } // widget

} // clase
