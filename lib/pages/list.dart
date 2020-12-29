import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import '../service/db_servicio.dart';
import '../model/persona.dart';

class ListPerson extends StatefulWidget {
  final data;

  ListPerson({
    Key key,
    @required this.data,
  }) : super(key: key);

  @override
  _ListPersonState createState() => _ListPersonState();
}

class _ListPersonState extends State<ListPerson> {
  final db = DBServicio();

  loadList() async {
    final res = await db.findAll();
    print(res.map((message) => message.toJson()));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadList();
  }

  @override
  Widget build(BuildContext context) {
    print("widget.data");
    print(widget.data);

    Future<dynamic> _registros() async {
      return true;
    }

    var futureBuilder = FutureBuilder(
        future: db.findAll(),
        builder: (context, AsyncSnapshot<List> snap) {
          if (snap.hasData) {
            return ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              //itemCount: items.length,
              itemCount: snap.data.length ?? 0,
              itemBuilder: (context, index) {
                return Dismissible(
                  // Each Dismissible must contain a Key. Keys allow Flutter to
                  // uniquely identify widgets.
                  // key: Key(item),
                  key: UniqueKey(),
                  // Show a red background as the item is swiped away.
                  background: Container(
                    alignment: AlignmentDirectional.centerEnd,
                    color: Colors.red,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                      child: Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  // Provide a function that tells the app
                  // what to do after an item has been swiped away.
                  onDismissed: (direction) {
                    // Remove the item from the data source.
                    db.deleteRow(snap.data[index].id);
                    setState(() {
                      //items.removeAt(index);
                    });

                    // Then show a snackbar.
                    Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text(
                            "${index + 1}- dismissed - ${snap.data[index].id}")));
                  },

                  child: ListTile(
                    title: Text(
                        '${index + 1} - ${snap.data[index].nombre} ${snap.data[index].apellido}'),
                    leading: Icon(Icons.person),
                  ),
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
    return futureBuilder;
  }
}
