import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  final Color color;
  final String imagen;
  final String title;
  final String subtitle;
  const CardPage(this.color, this.imagen, this.title, this.subtitle);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(right: 10, top: 5, bottom: 10),
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: this.color,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.only(
                  top: 20.0,
                ),
                height: 80,
                width: 80,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(300),
                  child: Image.network(
                    this.imagen,
                    fit: BoxFit.cover,
                  ),
                )),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                this.title,
                style: TextStyle(
                    fontSize: 18,
                    color: Theme.of(context).accentColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Center(
              child: Text(this.subtitle,
                  style: TextStyle(
                      fontSize: 12, color: Theme.of(context).accentColor)),
            )
          ],
        ),
      ),
    );
  }
}
