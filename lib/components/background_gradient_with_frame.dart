import 'package:flutter_starterpack_jelly/components/background_gradient.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class BackgroundGradientWithFrame extends StatelessWidget {
  const BackgroundGradientWithFrame({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: BackgroundGradient(),
        ),
        Positioned(
          left: 0,
          top: 0,
          child: Hero(
            tag: 'dayak_left',
            child: Align(
              alignment: Alignment.topLeft,
              child: Image.asset(
                'assets/images/top_left.png',
                height: 25.h,
              ),
            ),
          ),
        ),
        Positioned(
          right: 0,
          top: 0,
          child: Hero(
            tag: 'dayak_right',
            child: Align(
              alignment: Alignment.topRight,
              child: Image.asset(
                'assets/images/top_right.png',
                height: 25.h,
              ),
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Hero(
            tag: 'bottom_center',
            child: Align(
              alignment: Alignment.center,
              child: Image.asset(
                'assets/images/bottom_center.png',
                width: 50.0.w,
                // height: 30.0.h,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
