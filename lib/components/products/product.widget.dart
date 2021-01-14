import 'package:flutter/material.dart';
import 'package:listas/widgets/search_field.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          toolbarOpacity: 0.9,
          elevation: 0.1,
        ),
        body: Container(
          child: Column(
            children: [
              Center(child: SearchField()),
            ],
          ),
        ),
      ),
    );
  }
}
