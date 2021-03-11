import 'package:flutter/material.dart';
//import 'package:flutter_svg/flutter_svg.dart';
//import 'package:listas/models/Product.dart';

class AddToCart extends StatelessWidget {
  const AddToCart({
    Key key,
  }) : super(key: key);

  //final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        SizedBox(
          width: double.infinity,
          child: FlatButton(
            height: 50,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            color: Theme.of(context).primaryColor,
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.local_mall,
                  color: Colors.white,
                ),
                Text(
                  "  Buy  Now".toUpperCase(),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
