import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starterpack_jelly/screens/yogithesymbian/important_screen.dart';
import 'package:flutter_starterpack_jelly/screens/yogithesymbian/optional_screen.dart';
import 'package:flutter_starterpack_jelly/screens/yogithesymbian/payment_screen.dart';
import 'package:flutter_starterpack_jelly/screens/yogithesymbian/ui/book/main_book_screen.dart';
import 'package:flutter_starterpack_jelly/screens/yogithesymbian/ui/responsive_card/main_responsive_screen.dart';
import 'package:flutter_starterpack_jelly/services/reports/report_service.dart';
import 'package:flutter_starterpack_jelly/utils/constanta.dart';

class HomeScreen extends StatefulWidget {
  static const String id = '/home_screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final report_service = ReportService();
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ImportantScreen(),
                  const SizedBox(
                    height: 8.0,
                  ),
                  OptionalScreen(),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Divider(
                          height: 8.0,
                        ),
                      ),
                      const SizedBox(
                        width: 4.0,
                      ),
                      Text('UI - DESIGN'),
                      const SizedBox(
                        width: 4.0,
                      ),
                      Expanded(
                        child: Divider(
                          height: 8.0,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, MainResponsiveScreen.id);
                          },
                          icon: Icon(Icons.personal_video_rounded),
                          label: Text(
                            'Responsive CARD',
                            style: kTitleText.copyWith(
                              fontSize: 11.0,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            Navigator.pushNamed(context, MainBookScreen.id);
                          },
                          icon: Icon(Icons.book),
                          label: Text(
                            'Book Concept',
                            style: kTitleText.copyWith(
                              fontSize: 11.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  PaymentScreen(),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Divider(
                          height: 8.0,
                        ),
                      ),
                      const SizedBox(
                        width: 4.0,
                      ),
                      Text('(C) Yogi Arif Widodo (yogithesymbian)'),
                      const SizedBox(
                        width: 4.0,
                      ),
                      Expanded(
                        child: Divider(
                          height: 8.0,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
