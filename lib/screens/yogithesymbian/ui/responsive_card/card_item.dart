import 'package:flutter/material.dart';
import 'package:flutter_starterpack_jelly/utils/constanta.dart';

class CardItemScreen extends StatelessWidget {
  final Color color;
  final Size size;
  const CardItemScreen({Key? key, required this.color, required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        height: size.height * 0.2,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.3),
              color,
            ],
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                '\$999.9999,00',
                style: kTitleText.copyWith(
                  color: Colors.white70,
                ),
              ),
              Spacer(),
              Text(
                '42 2222 **** **** 2222',
                style: kNormalText.copyWith(
                  color: Colors.white70,
                ),
              ),
              Text(
                'yogithesymbian',
                style: kNormalText.copyWith(
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
