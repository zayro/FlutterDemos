import 'package:flutter/material.dart';

import 'widgets/drawer.dart';
import 'widgets/tabs.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  int _selectPosition = 0;

  _getDraweItemWidget(int val) {
    print("_getDraweItemWidget $val");

    switch (val) {
      case 0:
        //return TextPage();
        break;
      case 1:
        //return HttpPage();
        break;
    }
  }

  _onSelectItem(int val) {
    //Navigator.of(context).pop();
    Navigator.pop(context);
    setState(() => _selectPosition = val);
  }

  _onSelectItemOnTap(int val) {
    setState(() => _selectPosition = val);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        toolbarOpacity: 0.9,
        elevation: 0.1,
        leading: IconButton(
          icon: Icon(Icons.menu),
          color: Theme.of(context).accentColor,
          onPressed: () => _scaffoldKey.currentState.openDrawer(),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Punk",
                style: TextStyle(color: Theme.of(context).primaryColor)),
            Text(
              "Food",
              style: TextStyle(color: Theme.of(context).accentColor),
            )
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications_none,
                color: Theme.of(context).accentColor),
            onPressed: () {
              // do something
            },
          )
        ],
      ),
      body: Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        //color: Colors.white,
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.only(top: 20, bottom: 20),
                //color: Colors.white,
                child: TextField(
                    decoration: InputDecoration(
                  labelText: 'Search here',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.teal),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ))),
            Expanded(child: ProfilePage()),
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                'Offer & Disccount',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).accentColor),
              ),
            ),
            Container(
                //color: Colors.white,
                height: 200,
                margin: EdgeInsets.only(left: 4, right: 4, top: 20, bottom: 20),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/detail');
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                        'https://www.chewboom.com/wp-content/uploads/2020/01/McDonald%E2%80%99s-Welcomes-Back-2-For-5-Mix-Match-Deal.jpg'),
                  ),
                )),
          ],
        ),
      ),
      drawer: DrawerCustom(),
      bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
          child: BottomAppBar(
              //shape: CircularNotchedRectangle(),
              elevation: 1,
              child: Container(
                margin: EdgeInsets.all(5),
                child: Row(
                  children: [
                    IconButton(
                        icon: Icon(Icons.home,
                            color: Theme.of(context).primaryColor),
                        onPressed: () {}),
                    Spacer(),
                    IconButton(
                        icon: Icon(
                          Icons.favorite,
                          color: Theme.of(context).accentColor,
                        ),
                        onPressed: () {}),
                    Spacer(),
                    IconButton(
                        icon: Icon(Icons.explore,
                            color: Theme.of(context).accentColor),
                        onPressed: () {}),
                    Spacer(),
                    IconButton(
                        icon: Icon(Icons.person_outline,
                            color: Theme.of(context).accentColor),
                        onPressed: () {}),
                  ],
                ),
              ))),
    );
  }
}
