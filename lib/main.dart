import 'package:flutter_starterpack_jelly/models/midtrans/midtrans_brain.dart';
import 'package:flutter_starterpack_jelly/screens/crud/main_crud_screen.dart';
import 'package:flutter_starterpack_jelly/screens/home/home_screen.dart';
import 'package:flutter_starterpack_jelly/screens/importants/auth/login_screen.dart';
import 'package:flutter_starterpack_jelly/screens/importants/introduction/on_boarding_screen.dart';
import 'package:flutter_starterpack_jelly/screens/importants/splash/splash_screen.dart';
import 'package:flutter_starterpack_jelly/screens/payment/midtrans_payment_screen.dart';
import 'package:flutter_starterpack_jelly/screens/payment/xendit_payment_screen.dart';
import 'package:flutter_starterpack_jelly/screens/webview/payment/webview_midtrans_payment_screen.dart';
import 'package:flutter_starterpack_jelly/screens/webview/webview_sample_screen.dart';
import 'package:flutter_starterpack_jelly/utils/anim/transition_route_observer.dart';
import 'package:flutter_starterpack_jelly/utils/class/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MidtransBrain>(
          create: (context) => MidtransBrain(),
          lazy: false,
        )
      ],
      child: Sizer(builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: CustomTheme.lightThemeV2,
          navigatorObservers: [TransitionRouteObserver()],
          initialRoute: SplashScreen.id,
          routes: {
            // TODO : ROUTE CONFIGURATIONS - Register route
            SplashScreen.id: (context) => SplashScreen(),
            OnBoardingScreen.id: (context) => OnBoardingScreen(),
            LoginScreen.id: (context) => LoginScreen(),
            HomeScreen.id: (context) => HomeScreen(),
            WebViewSampleScreen.id: (context) => WebViewSampleScreen(),
            XenditPaymentScreen.id: (context) => XenditPaymentScreen(),
            MidtransPaymentScreen.id: (context) => MidtransPaymentScreen(),
            WebViewMidtransPaymentScreen.id: (context) =>
                WebViewMidtransPaymentScreen(),
            MainCrudScreen.id: (context) => MainCrudScreen(),
          },
        );
      }),
    );
  }
}
