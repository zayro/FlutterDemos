import 'package:flutter/material.dart';
import 'package:scrolling_page_indicator/scrolling_page_indicator.dart';

class OffersPage extends StatefulWidget {
  OffersPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _OffersPageState createState() => _OffersPageState();
}

class _OffersPageState extends State<OffersPage> {
  PageController _controller;

  @override
  void initState() {
    _controller = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    List<Widget> items = [
      buildPage("0", Colors.red),
      buildPage("1", Colors.blue),
      buildPage("2", Colors.green),
      buildPage("3", Colors.amber),
      buildPage("4", Colors.deepPurple),
      buildPage("5", Colors.teal),
      buildPage("6", Colors.pink),
      buildPage("7", Colors.brown)
    ];

    return SizedBox(
      height: size.height * 0.2,
      child: Column(
        children: <Widget>[
          Expanded(
            child: PageView(
              children: items,
              controller: _controller,
            ),
          ),
          ScrollingPageIndicator(
            dotColor: Colors.grey,
            dotSelectedColor: Colors.deepPurple,
            dotSize: 6,
            dotSelectedSize: 8,
            dotSpacing: 12,
            controller: _controller,
            itemCount: items.length,
            orientation: Axis.horizontal,
          ),
        ],
      ),
    );
  }

  Widget buildPage(String text, Color color) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Container(
        color: color,
        child: Center(
          child: Text(
            text,
            style: TextStyle(fontSize: 42, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
