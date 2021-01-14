import 'package:flutter/material.dart';
import 'package:listas/config/constant.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final config = ConfigConstant(context);

    return Container(
      width: config.mediaQueryData.size.width * 0.9,
      decoration: BoxDecoration(
        color: Color(0xFF979797).withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        onChanged: (value) => print(value),
        decoration: InputDecoration(
            //contentPadding: EdgeInsets.symmetric(vertical: 10),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            hintText: "Search product",
            prefixIcon: Icon(Icons.search)),
      ),
    );
  }
}
