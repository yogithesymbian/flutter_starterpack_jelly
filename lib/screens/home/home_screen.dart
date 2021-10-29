import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starterpack_jelly/screens/importants/auth/login_screen.dart';
import 'package:flutter_starterpack_jelly/screens/importants/introduction/on_boarding_screen.dart';
import 'package:flutter_starterpack_jelly/screens/importants/splash/splash_screen.dart';
import 'package:flutter_starterpack_jelly/screens/yogithesymbian/crud/main_crud_screen.dart';
import 'package:flutter_starterpack_jelly/screens/yogithesymbian/payment/midtrans_payment_screen.dart';
import 'package:flutter_starterpack_jelly/screens/yogithesymbian/payment/xendit_payment_screen.dart';
import 'package:flutter_starterpack_jelly/screens/yogithesymbian/webview/webview_sample_screen.dart';
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
                      Text('IMPORTANT'),
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
                            Navigator.pushNamed(context, SplashScreen.id);
                          },
                          icon: Icon(Icons.splitscreen_sharp),
                          label: Text(
                            'SplashScreen',
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
                            Navigator.pushNamed(context, OnBoardingScreen.id);
                          },
                          icon: Icon(Icons.filter_tilt_shift),
                          label: Text(
                            'OnBoarding',
                            style: kTitleText.copyWith(
                              fontSize: 11.0,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            Navigator.pushNamed(context, LoginScreen.id);
                          },
                          icon: Icon(Icons.auto_stories_sharp),
                          label: Text(
                            'Authentication',
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
                          onPressed: () {},
                          icon: Icon(Icons.data_saver_off),
                          label: Text(
                            'Preferences',
                            style: kTitleText.copyWith(
                              fontSize: 11.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.icecream_outlined),
                          label: Text(
                            'HomePage',
                            style: kTitleText.copyWith(
                              fontSize: 11.0,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                              //
                              ),
                        ),
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.lock),
                          label: Text(
                            'Secure Storage',
                            style: kTitleText.copyWith(
                              fontSize: 11.0,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                              //
                              ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.perm_device_information_sharp),
                          label: Text(
                            'Permission Handler',
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
                          onPressed: () {},
                          icon: Icon(Icons.storage_rounded),
                          label: Text(
                            'Storage Management',
                            style: kTitleText.copyWith(
                              fontSize: 11.0,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            Navigator.pushNamed(context, MainCrudScreen.id);
                          },
                          icon: Icon(Icons.data_saver_on_sharp),
                          label: Text(
                            'CRUD Data',
                            textAlign: TextAlign.center,
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
                          onPressed: () {},
                          icon: Icon(Icons.chat_rounded),
                          label: Text(
                            'Cloud Messaging',
                            textAlign: TextAlign.center,
                            style: kTitleText.copyWith(
                              fontSize: 11.0,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
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
                      Text('OPTIONAL'),
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
                          onPressed: () {},
                          icon: Icon(Icons.personal_video_rounded),
                          label: Text(
                            'Provider',
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
                          onPressed: () {},
                          icon: Icon(Icons.block),
                          label: Text(
                            'BloC',
                            style: kTitleText.copyWith(
                              fontSize: 11.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.chat),
                          label: Text(
                            'NLP Bot Chat',
                            textAlign: TextAlign.center,
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
                          onPressed: () {},
                          icon: Icon(Icons.qr_code_2),
                          label: Text(
                            'QrCode All Type',
                            textAlign: TextAlign.center,
                            style: kTitleText.copyWith(
                              fontSize: 11.0,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, WebViewSampleScreen.id);
                          },
                          icon: Icon(Icons.qr_code_2),
                          label: Text(
                            'WebView',
                            textAlign: TextAlign.center,
                            style: kTitleText.copyWith(
                              fontSize: 11.0,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
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
                      Text('PAYMENT'),
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
                                context, XenditPaymentScreen.id);
                          },
                          icon: Icon(Icons.qr_code_2),
                          label: Text(
                            'Xendit - Payment Gateway',
                            textAlign: TextAlign.center,
                            style: kTitleText.copyWith(
                              fontSize: 11.0,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, MidtransPaymentScreen.id);
                          },
                          icon: Icon(Icons.qr_code_2),
                          label: Text(
                            'Midtrans - Payment Gateway',
                            textAlign: TextAlign.center,
                            style: kTitleText.copyWith(
                              fontSize: 11.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
