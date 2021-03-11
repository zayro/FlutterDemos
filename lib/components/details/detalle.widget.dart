import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:listas/models/Product.dart';

import 'widgets/TextDetail.dart';
//import 'widgets/color.dart';
import 'widgets/cart.dart';

class DetailProductPage extends StatefulWidget {
  DetailProductPage({Key key}) : super(key: key);

  @override
  _DetailProductPageState createState() => _DetailProductPageState();
}

class _DetailProductPageState extends State<DetailProductPage> {
  final product = Product();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/icons/back.svg',
            color: Colors.white,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        actions: <Widget>[
          IconButton(
            icon: SvgPicture.asset("assets/icons/search.svg"),
            onPressed: () {},
          ),
          IconButton(
            icon: SvgPicture.asset("assets/icons/cart.svg"),
            onPressed: () {},
          ),
          SizedBox(width: 20 / 2)
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0),
            child: Container(
              height: size.height,
              margin: EdgeInsets.only(top: size.height * 0.3),
              padding: EdgeInsets.only(
                top: 10,
                left: 20,
                right: 20,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  TextDetail(),
                  SizedBox(height: 20 / 2),
                  AddToCart(),
                  SizedBox(height: 20 / 2),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              //color: Colors.black,
              height: size.height * 0.5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Aristocratic Hand Bag ...",
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    "OFFICE CODE".toUpperCase(),
                    style: Theme.of(context).textTheme.headline4.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(text: "Price: \n"),
                            TextSpan(
                              text: "\$10.2030",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4
                                  .copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: Hero(
                          tag: "1",
                          child: Image.asset(
                            'assets/images/hamburguesa.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
