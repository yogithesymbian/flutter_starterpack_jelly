import 'package:flutter/material.dart';

class IntentScreen extends StatelessWidget {
  static const String id = '/intent_screen';
  final arguments;

  const IntentScreen({Key? key, this.arguments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text('string ${arguments != null ? arguments['id'] : 'null'}'),
      ),
    );
  }
}
