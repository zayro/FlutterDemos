import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  ListPage({Key key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<String> litems = ["1", "2", "Third", "4"];
  int _carga = 5;

  ScrollController _scrollController = new ScrollController();

  //https://picsum.photos/200
  //https://source.unsplash.com/random/200x200

  void initState() {
    super.initState();

    _scrollController.addListener(() {
      print("init scroll");
      if (_scrollController.offset >=
              _scrollController.position.maxScrollExtent &&
          !_scrollController.position.outOfRange) {
        setState(() {
          print("reach the bottom");

          showDialog(
              context: context,
              builder: (_) => AlertDialog(
                    title: Text('Loading Image'),
                    content: CircularProgressIndicator(),
                    actions: <Widget>[
                      FlatButton(
                        child: Text('Touch me!'),
                        onPressed: () {
                          setState(() {
                            _carga = _carga + 5;
                          });
                        },
                      )
                    ],
                  ));
        });
      }
      if (_scrollController.offset <=
              _scrollController.position.minScrollExtent &&
          !_scrollController.position.outOfRange) {
        setState(() {
          print("reach the top");
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            itemCount: _carga,
            controller: _scrollController,
            itemBuilder: (BuildContext ctxt, int index) {
              //return new Text(litems[index]);
              var container = Container(
                //padding: EdgeInsets.all(1),
                child: FadeInImage.assetNetwork(
                    placeholder: 'assets/images/Reload-1s-200px.gif',
                    image: 'https://picsum.photos/200/300?random=$index',
                    fit: BoxFit.cover),
              );
              var center = Center(
                child: Text("imagen $index"),
              );
              var sizedBox = SizedBox(height: 10);
              return Column(
                children: [container, sizedBox, center, sizedBox],
              );
            }));
  }
}
