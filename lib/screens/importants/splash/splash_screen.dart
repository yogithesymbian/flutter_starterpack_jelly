import 'package:after_layout/after_layout.dart';
import 'package:flutter_starterpack_jelly/components/background_gradient_with_frame.dart';
import 'package:flutter_starterpack_jelly/screens/home/home_screen.dart';
import 'package:flutter_starterpack_jelly/screens/importants/auth/login_screen.dart';
import 'package:flutter_starterpack_jelly/screens/importants/introduction/on_boarding_screen.dart';
import 'package:flutter_starterpack_jelly/services/preference/user_preference.dart';
import 'package:flutter_starterpack_jelly/services/storage/storage.dart';
import 'package:flutter_starterpack_jelly/utils/anim/duratioin.dart';
import 'package:flutter_starterpack_jelly/utils/value.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  static const String id = '/splash_screen';
  @override
  SplashScreenState createState() => new SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with AfterLayoutMixin<SplashScreen> {
  Future checkFirstSeen() async {
    bool _seen = await UserPreference().checkFirstSeen();
    final secureStorage = SecureStorage();
    final isLogin = await secureStorage.readSecureData(kBearer);
    await Future.delayed(duration0Sec);
    if (_seen) {
      if (isLogin != null) {
        Navigator.of(context).pushNamedAndRemoveUntil(
            HomeScreen.id, (Route<dynamic> route) => false);
      } else {
        Navigator.of(context).pushNamedAndRemoveUntil(
            LoginScreen.id, (Route<dynamic> route) => false);
      }
    } else {
      UserPreference().setCheckFirstSeen();
      Navigator.of(context).pushNamedAndRemoveUntil(
          OnBoardingScreen.id, (Route<dynamic> route) => false);
    }
  }

  @override
  void afterFirstLayout(BuildContext context) => checkFirstSeen();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          BackgroundGradientWithFrame(size: size),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Hero(
              tag: 'main_logo',
              child: Align(
                child: Image.asset(
                  'assets/images/main_logo.png',
                  width: 40.0.w,
                  height: 30.0.h,
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 10.0.w,
            top: 20.0.h,
            bottom: size.height * 0.25,
            child: Hero(
              tag: 'splash_screen',
              child: Align(
                alignment: Alignment.center,
                child: Lottie.asset(
                  'assets/lotties/work-day.json',
                  width: 55.0.w,
                  height: 55.0.h,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
