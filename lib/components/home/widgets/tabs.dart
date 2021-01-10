import 'package:flutter/material.dart';

import 'card.dart';

class ProfilePage extends StatefulWidget {
  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 50,
            child: AppBar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              elevation: 0,
              bottom: TabBar(
                indicatorColor: Theme.of(context).primaryColor,
                tabs: [
                  Tab(
                    child: Text(
                      "Combo Meal",
                      style: TextStyle(
                          fontFamily: "BarlowBold",
                          color: Theme.of(context).accentColor),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Chicken",
                      style: TextStyle(
                          fontFamily: "BarlowBold",
                          color: Theme.of(context).accentColor),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Beverages",
                      style: TextStyle(
                          fontFamily: "BarlowBold",
                          color: Theme.of(context).accentColor),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // create widgets for each tab bar here
          Expanded(
            child: TabBarView(
              children: [
                // first tab bar view widget
                Container(
                  //color: Colors.white10,
                  child: Container(
                    margin: EdgeInsets.only(top: 20, bottom: 20),
                    //color: Colors.white,
                    height: MediaQuery.of(context).size.height * 0.5,
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
                ),

                // second tab bar viiew widget
                Container(
                  color: Colors.white10,
                ),

                Container(
                  color: Colors.white10,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
