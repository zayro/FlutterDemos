import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/provider.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    var myProvider = Provider.of<MyProvider>(context);

    int _selectPosition = 0;

    _onSelectItemOnTap(int val) {
      print("_onSelectItemOnTap $val");
      myProvider.pageCurrent = val;
      setState(() => _selectPosition = val);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Provider Example'),
      ),
      body: myProvider.handleState(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onSelectItemOnTap,
        currentIndex:
            myProvider.pageCurrent, // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Pagina 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.verified_user),
            label: 'Pagina 2',
          ),
        ],
      ),
    );
  }
}
