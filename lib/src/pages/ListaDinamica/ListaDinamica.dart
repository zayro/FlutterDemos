import 'package:flutter/material.dart';

class MySwitchListTile extends StatefulWidget {
  final int index;
  final Function(bool) callback;

  const MySwitchListTile({Key key, this.index, this.callback})
      : super(key: key);

  @override
  ComponentListState createState() => ComponentListState();
}

class ComponentListState extends State<MySwitchListTile> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    // print('Impresion desde _MySwitchListTileState antes del return');
    return SwitchListTile(
      key: Key('slt_${widget.index}'),
      title: Text('SwitchListTile ${widget.index}'),
      value: this.value,
      onChanged: (value) {
        this.value = value;
        print('Impresion desde _MySwitchListTileState $value');
        widget.callback(value);
      },
    );
  }
}

class ListSwitch extends StatefulWidget {
  @override
  _ListSwitchState createState() => _ListSwitchState();
}

class _ListSwitchState extends State<ListSwitch> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: ListView(
          children: List.generate(
            20,
            (i) => MySwitchListTile(
              index: i,
              callback: (value) {
                print("index is $i, con el valor $value");
                setState(() {});
              },
            ),
          ),
        ),
      ),
    );
  }
}
