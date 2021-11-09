import 'package:flutter/material.dart';

class IntentScreen extends StatelessWidget {
  static const String id = '/intent_screen';
  final arguments;

  const IntentScreen({Key? key, this.arguments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Intent With Data'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Center(
                child: Text(
                    'string ${arguments != null ? arguments['id'] : 'null'}')),
          ),
        ],
      ),
    );
  }
}
