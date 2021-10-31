import 'package:flutter/material.dart';
import 'package:flutter_starterpack_jelly/screens/yogithesymbian/ui/responsive_card/card_item.dart';

class MainResponsiveScreen extends StatelessWidget {
  static const String id = '/main_responsive_screen';
  const MainResponsiveScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      // This is handled by the search bar itself.
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Wallet Your WIFE',
        ),
        backgroundColor: Color(0xFF212239),
      ),
      backgroundColor: Color(0xFF212239),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
        ),
        child: Column(
          children: [
            // Text(
            //   'Wallet Your WIFE',
            //   style: TextStyle(
            //     fontWeight: FontWeight.bold,
            //     fontSize: 26,
            //     color: Colors.white,
            //   ),
            // ),
            Expanded(
              child: AnimatedSwitcher(
                duration: const Duration(seconds: 1),
                transitionBuilder: (widget, animation) {
                  return ScaleTransition(
                    scale: animation,
                    child: widget,
                  );
                },
                child: orientation == Orientation.portrait
                    ? ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return CardItemScreen(
                            color: Colors
                                .primaries[index % Colors.primaries.length],
                            size: size,
                          );
                        })
                    : GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3),
                        itemCount: 9,
                        shrinkWrap: true,
                        primary: false,
                        itemBuilder: (context, index) {
                          return CardItemScreen(
                            color: Colors
                                .primaries[index % Colors.primaries.length],
                            size: size,
                          );
                        }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
