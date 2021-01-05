import 'package:flutter/material.dart';
import '../service/urlLauncher.dart';

import '../service/sqlite.dart';

class ListUrl extends StatefulWidget {
  @override
  _ListUrlState createState() => _ListUrlState();
}

class _ListUrlState extends State<ListUrl> {
  final db = DBServicio();
  servicio() async {
    final res = await db.findAllHttp();
    final mapeo = res.map((message) => message);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('init state');
    servicio();
  }

  final url = UrlLauncher();

  @override
  Widget build(BuildContext context) {
    var futureBuilder = FutureBuilder(
        future: db.findAllHttp(),
        builder: (context, AsyncSnapshot snap) {
          print("snap.data");
          print(snap.data);

          if (snap.hasData) {
            return ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              //itemCount: items.length,
              itemCount: snap.data.length ?? 0,
              itemBuilder: (context, index) {
                print(snap.data[index].runtimeType);
                Map data = snap.data[index] as Map;

                return Dismissible(
                  // Each Dismissible must contain a Key. Keys allow Flutter to
                  // uniquely identify widgets.
                  // key: Key(item),
                  key: UniqueKey(),
                  // Show a red background as the item is swiped away.
                  background: Container(
                    color: Colors.green,
                    child: Align(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            width: 20,
                          ),
                          Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                          Text(
                            " Open",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                      alignment: Alignment.centerLeft,
                    ),
                  ),

                  secondaryBackground: Container(
                    color: Colors.red,
                    child: Align(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                          Text(
                            " Delete",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.right,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                        ],
                      ),
                      alignment: Alignment.centerRight,
                    ),
                  ),
                  // Provide a function that tells the app
                  // what to do after an item has been swiped away.
                  onDismissed: (direction) async {
                    // Remove the item from the data source.
                    print("----------------------");
                    print(direction);
                    print("----------------------");

                    if (direction == DismissDirection.endToStart) {
                      db.deleteHttp(data['id']);
                    }

                    if (direction == DismissDirection.startToEnd) {
                      await url.open(data['http']);
                    }

                    //db.deleteHttp(snap.data[index].id);
                    setState(() {
                      //items.removeAt(index);
                    });

                    // Then show a snackbar.
                    Scaffold.of(context).showSnackBar(SnackBar(
                        content:
                            Text("${index + 1}- dismissed - ${data['id']}")));
                  },

                  child: ListTile(
                    title: Text("${index + 1} - ${data['http']} "),
                    leading: Icon(Icons.http),
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
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista Url"),
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
              children: <Widget>[futureBuilder],
            ),
          ),
        );
      }),
    );
  }
}
