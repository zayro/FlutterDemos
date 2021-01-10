import 'package:flutter/material.dart';

class BottomNavigationBarCustom extends StatelessWidget {
  const BottomNavigationBarCustom({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      //backgroundColor: Theme.of(context).primaryColor,

      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: Theme.of(context).primaryColor,
            size: 25,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.favorite,
            color: Theme.of(context).accentColor,
            size: 25,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.explore,
            color: Theme.of(context).accentColor,
            size: 25,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person_outline,
            color: Theme.of(context).accentColor,
            size: 25,
          ),
          label: '',
        ),
      ],
    );
  }
}
