import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/provider.dart';
import '../screens/secondpage.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var myProvider = Provider.of<MyProvider>(context);
    return SafeArea(
      child: Center(
        child: Column(
          children: <Widget>[
            Text(myProvider.mitexto),
            MaterialButton(
              onPressed: () {
                myProvider.mitexto = "Este texto es actualizado home";
              },
              child: Text("Cambiar Texto"),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SecondPage()));
              },
              child: Text("Ir a paágina 2"),
            )
          ],
        ),
      ),
    );
  }
}
