import 'package:flutter/material.dart';

class TextPage extends StatelessWidget {
  const TextPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Bienvenido"),
            Center(
              child: ElevatedButton(
                child: Text('SHOW A SNACKBAR'),
                onPressed: () {
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Have a snack!'),
                    ),
                  );
                },
              ),
            ),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                child: Text('CLOSE DRAW'),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
            )
          ],
        ),
      ),
    ));
  }
}
