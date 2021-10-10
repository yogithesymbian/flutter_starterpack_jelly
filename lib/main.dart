import 'package:flutter_starterpack_jelly/screens/home/home_screen.dart';
import 'package:flutter_starterpack_jelly/screens/importants/auth/login_screen.dart';
import 'package:flutter_starterpack_jelly/screens/importants/introduction/on_boarding_screen.dart';
import 'package:flutter_starterpack_jelly/screens/importants/splash/splash_screen.dart';
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
    return Sizer(builder: (context, orientation, deviceType) {
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
        },
      );
    });
  }
}
