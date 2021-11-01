import 'dart:math';
import 'dart:ui';
import 'dart:math' as math;

import 'package:flutter/material.dart';

class CustomMaterialRectCenterArcTween extends RectTween {
  /// Creates a [Tween] for animating [Rect]s along a circular arc.
  ///
  /// The [begin] and [end] properties must be non-null before the tween is
  /// first used, but the arguments can be null if the values are going to be
  /// filled in later.
  CustomMaterialRectCenterArcTween({
    Rect? begin,
    Rect? end,
  }) : super(begin: begin, end: end);

  bool _dirty = true;

  void _initialize() {
    assert(begin != null);
    assert(end != null);
    _centerArc = QuadraticOffsetTween(
      begin: begin?.center,
      end: end?.center,
    );
    _dirty = false;
  }

  /// If [begin] and [end] are non-null, returns a tween that interpolates along
  /// a circular arc between [begin]'s [Rect.center] and [end]'s [Rect.center].
  QuadraticOffsetTween? get centerArc {
    if (begin == null || end == null) return null;
    if (_dirty) _initialize();
    return _centerArc;
  }

  QuadraticOffsetTween? _centerArc;

  @override
  set begin(Rect? value) {
    if (value != begin) {
      super.begin = value;
      _dirty = true;
    }
  }

  @override
  set end(Rect? value) {
    if (value != end) {
      super.end = value;
      _dirty = true;
    }
  }

  @override
  Rect? lerp(double t) {
    if (_dirty) _initialize();
    if (t == 0.0) return begin;
    if (t == 1.0) return end;
    final Offset center = _centerArc!.lerp(t);
    final double? width = lerpDouble(begin!.width, end!.width, t);
    final double? height = lerpDouble(begin!.height, end!.height, t);
    return Rect.fromLTWH(
        center.dx - width! / 2.0, center.dy - height! / 2.0, width, height);
  }

  @override
  String toString() {
    return '$runtimeType($begin \u2192 $end; centerArc=$centerArc)';
  }
}

class MyCurve extends Curve {
  @override
  double transform(double t) {
    assert(t >= 0.0 && t <= 1.0);
    return -15 * math.pow(t, 2) + 15 * t + 1;
  }
}

class ValleyQuadraticCurve extends Curve {
  @override
  double transform(double t) {
    assert(t >= 0.0 && t <= 1.0);
    return (4 * math.pow(t - 0.5, 2)).toDouble();
  }
}

class PeakQuadraticCurve extends Curve {
  @override
  double transform(double t) {
    assert(t >= 0.0 && t <= 1.0);
    return -15 * math.pow(t, 2) + 15 * t + 1;
  }
}

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
