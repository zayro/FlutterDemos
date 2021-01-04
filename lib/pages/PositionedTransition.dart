/// Flutter code sample for PositionedTransition

// The following code implements the [PositionedTransition] as seen in the video
// above:

import 'package:flutter/material.dart';

/// This is the stateful widget that the main application instantiates.
class PositionedTransitionExample extends StatefulWidget {
  PositionedTransitionExample({Key key}) : super(key: key);

  @override
  _PositionedTransitionExampleState createState() =>
      _PositionedTransitionExampleState();
}

/// This is the private State class that goes with PositionedTransitionExample.
/// AnimationControllers can be created with `vsync: this` because of TickerProviderStateMixin.
class _PositionedTransitionExampleState
    extends State<PositionedTransitionExample> with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double smallLogo = 100;
    final double bigLogo = 200;

    return LayoutBuilder(
      builder: (context, constraints) {
        final Size biggest = constraints.biggest;
        return Stack(
          children: [
            PositionedTransition(
              rect: RelativeRectTween(
                begin: RelativeRect.fromSize(
                    Rect.fromLTWH(0, 0, smallLogo, smallLogo), biggest),
                end: RelativeRect.fromSize(
                    Rect.fromLTWH(biggest.width - bigLogo,
                        biggest.height - bigLogo, bigLogo, bigLogo),
                    biggest),
              ).animate(CurvedAnimation(
                parent: _controller,
                curve: Curves.elasticIn,
              )),
              child: Padding(
                  padding: const EdgeInsets.all(8), child: FlutterLogo()),
            ),
          ],
        );
      },
    );
  }
}
