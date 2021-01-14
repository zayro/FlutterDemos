import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';

import 'package:listas/components/home/widgets/card.dart';
import 'package:listas/widgets/discount.dart';
//import 'package:listas/components/home/widgets/offers.dart';

import '../../widgets/banner.dart';
import 'widgets/categories.dart';
import 'widgets/drawer.dart';

import '../../models/home.dart';
import '../../widgets/search_field.dart';
import 'widgets/specialOffers.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  PageController _controller;

  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  @override
  void initState() {
    _controller = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomPadding: false,
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
            Text("Multi",
                style: TextStyle(color: Theme.of(context).primaryColor)),
            Text(
              "Service",
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
              margin: EdgeInsets.all(10),
              alignment: Alignment.topLeft,
              child: Text(
                'All Service',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).accentColor),
              ),
            ),
            //DiscountBanner(),
            //SearchField(),
            Categories(),
            //GridCard("Repair", "assets/images/home/build.png"),
            Container(
              margin: EdgeInsets.all(10),
              alignment: Alignment.topLeft,
              child: Text(
                'Our Clients',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).accentColor),
              ),
            ),
            //OffersPage()
            SpecialOffers(),
            SizedBox(height: 30),
            Container(
              margin: EdgeInsets.all(10),
              alignment: Alignment.topLeft,
              child: Text(
                'Offer & Disccount',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).accentColor),
              ),
            ),
            SizedBox(height: 30),
            CarouselPage()
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
                          Icons.search,
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
