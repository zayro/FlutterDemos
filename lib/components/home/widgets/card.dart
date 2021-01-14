import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GridCard extends StatelessWidget {
  final String title;
  final String image;
  const GridCard(this.title, this.image);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: GridView.count(
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this produces 2 rows.
          crossAxisCount: 2,
          // Generate 100 widgets that display their index in the List.
          children: List.generate(3, (index) {
            return Expanded(
              child: Card(
                elevation: 2,
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image(height: 100, image: AssetImage(this.image)),
                    ),
                    Container(
                      child: Center(
                          child: Text(this.title,
                              style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                    color: Theme.of(context).accentColor,
                                    fontSize: 16),
                                //color: Theme.of(context).accentColor),
                              ))),
                    )
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
