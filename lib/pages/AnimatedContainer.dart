/// Flutter code sample for AnimatedContainer

// The following example (depicted above) transitions an AnimatedContainer
// between two states. It adjusts the `height`, `width`, `color`, and
// [alignment] properties when tapped.

import 'package:flutter/material.dart';

/// This is the stateful widget that the main application instantiates.
class AnimatedContainerExample extends StatefulWidget {
  AnimatedContainerExample({Key key}) : super(key: key);

  @override
  _AnimatedContainerExampleState createState() =>
      _AnimatedContainerExampleState();
}

/// This is the private State class that goes with AnimatedContainerExample.
class _AnimatedContainerExampleState extends State<AnimatedContainerExample> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedContainerExample'),
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            selected = !selected;
          });
        },
        child: Center(
          child: AnimatedContainer(
            width: selected ? 200.0 : 100.0,
            height: selected ? 100.0 : 200.0,
            color: selected ? Colors.red : Colors.blue,
            alignment:
                selected ? Alignment.center : AlignmentDirectional.topCenter,
            duration: Duration(seconds: 2),
            curve: Curves.easeInCirc,
            child: FlutterLogo(size: 75),
          ),
        ),
      ),
    );
  }
}
