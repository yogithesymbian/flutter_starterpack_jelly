import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class QuadraticOffsetTween extends Tween<Offset> {
  QuadraticOffsetTween({
    Offset? begin,
    Offset? end,
  }) : super(begin: begin, end: end);

  @override
  Offset lerp(double t) {
    if (t == 0.0) return begin ?? Offset(0, 0);
    if (t == 1.0) return end ?? Offset(0, 0);
    final double x = -11 * begin!.dx * math.pow(t, 2) +
        (end!.dx + 10 * begin!.dx) * t +
        begin!.dx;
    final double y = -2 * begin!.dy * math.pow(t, 2) +
        (end!.dy + 1 * begin!.dy) * t +
        begin!.dy;
    return Offset(x, y);
  }
}
