import 'package:flutter/material.dart';

import 'widgets/card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarOpacity: 0.9,
        elevation: 0.1,
        leading: Icon(
          Icons.menu,
          color: Theme.of(context).accentColor,
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
        margin: EdgeInsets.only(left: 10, right: 10),
        color: Colors.white,
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.only(top: 20, bottom: 20),
                color: Colors.white,
                child: TextField(
                    decoration: InputDecoration(
                  labelText: 'Search here',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 10,
                      style: BorderStyle.none,
                    ),
                  ),
                ))),
            Container(
              margin: EdgeInsets.only(top: 20, bottom: 20),
              color: Colors.white,
              height: MediaQuery.of(context).size.height * 0.3,
              width: double.infinity,
              child: PageView(
                physics: BouncingScrollPhysics(),
                controller: PageController(viewportFraction: 0.5),
                children: [
                  CardPage(
                      Colors.white,
                      'https://www.besthealthmag.ca/wp-content/uploads/2019/07/junk-food-1.gif',
                      'HAMBURGUESAS',
                      'Promo 2X1'),
                  CardPage(
                      Colors.white,
                      'https://image.freepik.com/vector-gratis/pan-hotdog_1975-208.jpg',
                      'PERROS',
                      'Promo 2X1'),
                  CardPage(
                      Colors.white,
                      'https://www.wiltonenespanol.com/wp-content/uploads/2016/07/malteadas-300x214.jpg',
                      'MALTEADAS',
                      'Promo 2X1'),
                ],
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                'Offer & Disccount',
                textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.w900),
              ),
            ),
            Container(
                color: Colors.white,
                height: 200,
                margin: EdgeInsets.only(left: 40, right: 40, top: 20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                      'https://www.chewboom.com/wp-content/uploads/2020/01/McDonald%E2%80%99s-Welcomes-Back-2-For-5-Mix-Match-Deal.jpg'),
                )),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
                accountName: Text("MARLON ZAYRO ARIAS VARGAS"),
                accountEmail: Text("ZAYRO8905@GMAIL.COM"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.amber,
                  child: Text("M"),
                )),
            ListTile(
              title: Text("Cerrar sesion"),
              onTap: () {
                //cerrar_session();
              },
            ),
            ListTile(
              title: Text("Multimedia"),
              onTap: () {
                Navigator.pushNamed(context, '/multimedia');
              },
            ),
            Divider(),
            ListTile(
              title: Text("Texto"),
              //selected: (0 == _selectPosition),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              title: Text("Http"),
              //selected: (1 == _selectPosition),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              title: Text("Orientation"),
              //selected: (2 == _selectPosition),
              onTap: () {},
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        //backgroundColor: Theme.of(context).primaryColor,
        onTap: _onSelectItemOnTap,
        currentIndex:
            _selectPosition, // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Theme.of(context).primaryColor,
              size: 35,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
              color: Theme.of(context).accentColor,
              size: 35,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.explore,
              color: Theme.of(context).accentColor,
              size: 35,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline,
              color: Theme.of(context).accentColor,
              size: 35,
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
