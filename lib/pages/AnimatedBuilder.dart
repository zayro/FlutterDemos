/// Flutter code sample for AnimatedBuilder

// This code defines a widget that spins a green square continually. It is
// built with an [AnimatedBuilder] and makes use of the [child] feature to
// avoid having to rebuild the [Container] each time.

import 'package:flutter/material.dart';

import 'dart:math' as math;

/// This is the stateful widget that the main application instantiates.
class AnimatedBuilderExample extends StatefulWidget {
  AnimatedBuilderExample({Key key}) : super(key: key);

  @override
  _AnimatedBuilderExampleState createState() => _AnimatedBuilderExampleState();
}

/// This is the private State class that goes with AnimatedBuilderExample.
/// AnimationControllers can be created with `vsync: this` because of TickerProviderStateMixin.
class _AnimatedBuilderExampleState extends State<AnimatedBuilderExample>
    with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      child: Container(
        width: 200.0,
        height: 200.0,
        color: Colors.green,
        child: const Center(
          child: Text('Whee!'),
        ),
      ),
      builder: (BuildContext context, Widget child) {
        return Transform.rotate(
          angle: _controller.value * 2.0 * math.pi,
          child: child,
        );
      },
    );
  }
}
