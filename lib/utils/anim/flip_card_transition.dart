import 'dart:math';

import 'package:flutter/material.dart';

class FlipcardTransition extends AnimatedWidget {
  final Animation<double> flipAnim;
  final Widget child;

  FlipcardTransition({required this.flipAnim, required this.child})
      : assert(flipAnim != null),
        assert(child != null),
        super(listenable: flipAnim);

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.identity()..rotateY(-pi * flipAnim.value),
      alignment: FractionalOffset.center,
      child: child,
    );
  }
}
