/// Flutter code sample for SlideTransition

// The following code implements the [SlideTransition] as seen in the video
// above:

import 'package:flutter/material.dart';

/// This is the stateful widget that the main application instantiates.
class SlideTransitionExample extends StatefulWidget {
  SlideTransitionExample({Key key}) : super(key: key);

  @override
  _SlideTransitionExampleState createState() => _SlideTransitionExampleState();
}

/// This is the private State class that goes with SlideTransitionExample.
class _SlideTransitionExampleState extends State<SlideTransitionExample>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    _offsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(1.5, 0.0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInCirc,
    ));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: FlutterLogo(size: 150.0),
      ),
    );
  }
}
