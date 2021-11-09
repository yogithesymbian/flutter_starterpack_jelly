import 'package:flutter/material.dart';
import 'package:flutter_starterpack_jelly/screens/importants/splash/splash_screen.dart';
import 'package:flutter_starterpack_jelly/screens/yogithesymbian/home_screen.dart';
import 'package:flutter_starterpack_jelly/screens/importants/auth/login_screen.dart';
import 'package:flutter_starterpack_jelly/screens/importants/introduction/on_boarding_screen.dart';
import 'package:flutter_starterpack_jelly/screens/yogithesymbian/important/crud/main_crud_screen.dart';
import 'package:flutter_starterpack_jelly/screens/yogithesymbian/important/intent/intent_screen.dart';
import 'package:flutter_starterpack_jelly/screens/yogithesymbian/important/permission_handler/permission_handler_screen.dart';
import 'package:flutter_starterpack_jelly/screens/yogithesymbian/optional/webview/payment/webview_midtrans_payment_screen.dart';
import 'package:flutter_starterpack_jelly/screens/yogithesymbian/optional/webview/webview_sample_screen.dart';
import 'package:flutter_starterpack_jelly/screens/yogithesymbian/ui/book/detail_book_screen.dart';
import 'package:flutter_starterpack_jelly/screens/yogithesymbian/ui/book/main_book_screen.dart';
import 'package:flutter_starterpack_jelly/screens/yogithesymbian/ui/responsive_card/main_responsive_screen.dart';
import 'screens/yogithesymbian/payment/midtrans_payment_screen.dart';
import 'screens/yogithesymbian/payment/xendit_payment_screen.dart';

final routes = {
  SplashScreen.id: (context) => SplashScreen(),
  OnBoardingScreen.id: (context) => OnBoardingScreen(),
  LoginScreen.id: (context) => LoginScreen(),
  HomeScreen.id: (context) => HomeScreen(),
  WebViewSampleScreen.id: (context) => WebViewSampleScreen(),
  XenditPaymentScreen.id: (context) => XenditPaymentScreen(),
  MidtransPaymentScreen.id: (context) => MidtransPaymentScreen(),
  WebViewMidtransPaymentScreen.id: (context) => WebViewMidtransPaymentScreen(),
  MainCrudScreen.id: (context) => MainCrudScreen(),
  MainResponsiveScreen.id: (context) => MainResponsiveScreen(),
  PermissionHandlerScreen.id: (context) => PermissionHandlerScreen(),
  MainBookScreen.id: (context) => MainBookScreen(),
  DetailBookScreen.id: (context) => DetailBookScreen(),
  IntentScreen.id: (context, {arguments}) => IntentScreen(
        arguments: arguments,
      ),
};

final onGenerateRoute = (RouteSettings settings) {
  final String? name = settings.name;
  final Function? pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = PageRouteBuilder(
        settings: settings,
        pageBuilder: (context, animation, secondaryAnimation) =>
            pageContentBuilder(
          context,
          arguments: settings.arguments,
        ),
        transitionsBuilder: (
          context,
          animation,
          secondaryAnimation,
          child,
        ) =>
            FadeTransition(
          opacity: animation,
          child: child,
        ),
      );
      return route;
    } else {
      final Route route = PageRouteBuilder(
        settings: settings,
        pageBuilder: (context, animation, secondaryAnimation) =>
            pageContentBuilder(
          context,
        ),
        transitionsBuilder: (
          context,
          animation,
          secondaryAnimation,
          child,
        ) =>
            FadeTransition(
          opacity: animation,
          child: child,
        ),
      );
      return route;
    }
  }
};
