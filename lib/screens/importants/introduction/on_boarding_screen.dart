import 'package:flutter_starterpack_jelly/components/background_gradient.dart';
import 'package:flutter_starterpack_jelly/screens/importants/auth/login_screen.dart';
import 'package:flutter_starterpack_jelly/utils/colors.dart';
import 'package:flutter_starterpack_jelly/utils/constanta.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:lottie/lottie.dart';

class OnBoardingScreen extends StatefulWidget {
  static const String id = '/on_boarding_screen';
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();

  int? stateDone;

  void _onIntroEnd(context) {
    Navigator.of(context).pushNamedAndRemoveUntil(
        LoginScreen.id, (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    List<Widget> onboardStack = [
      Positioned(
        left: 0,
        right: 0,
        bottom: 0,
        child: Align(
          alignment: Alignment.center,
          child: Image.asset(
            'assets/images/bottom_center.png',
            width: 50.0.w,
            // height: 30.0.h,
          ),
        ),
      ),
      Positioned(
        bottom: stateDone == 2 ? size.height * 0.15 : 0,
        right: 0,
        left: 0,
        child: stateDone == 2
            ?
            // Text('')
            Container(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    _onIntroEnd(context);
                    print('on clicked');
                  },
                  child: Text(
                    'Done',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            : Lottie.asset(
                'assets/lotties/swipe-hand.json',
              ),
        // Image.asset(
        //     'assets/images/sweep_tangan_1.png',
        //     width: size.width * 0.05,
        //     height: size.height * 0.05,
        //   ),
      ),
    ];

    final introductionScreen = IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.transparent,
      globalHeader: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Hero(
                  tag: 'main_logo',
                  child: Align(
                    child: Image.asset(
                      'assets/images/main_logo.png',
                      width: 48.0.w,
                      height: 30.0.h,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Hero(
                      tag: 'dayak_left',
                      child: Image.asset(
                        'assets/images/top_left.png',
                        height: 25.h,
                      ),
                    ),
                  ),
                  Flexible(
                    child: Hero(
                      tag: 'dayak_right',
                      child: Image.asset(
                        'assets/images/top_right.png',
                        height: 25.h,
                      ),
                    ),
                  ),
                ],
              ),
            ]),
          ],
        ),
      ),
      globalFooter: Container(
        height: size.height * 0.19,
      ),
      onChange: (position) {
        print('position : $position');
        stateDone = position;
        setState(() {});
      },
      // pages: context.watch<IntroData>().listViewPageModel,
      pages: [
        PageViewModel(
          title: "Have Fun",
          body: "Study with beautiful illustration and visual games",
          image: Lottie.asset(
            'assets/lotties/qrcode1.json',
            height: size.height * 0.3,
          ),
          decoration: kPageDecoration,
        ),
        PageViewModel(
          title: "Have Fun",
          body: "Study with beautiful illustration and visual games",
          image: Lottie.asset(
            'assets/lotties/qrcode2.json',
            height: size.height * 0.3,
          ),
          decoration: kPageDecoration,
        ),
        PageViewModel(
          title: "Have Fun",
          body: "Study with beautiful illustration and visual games",
          image: Lottie.asset(
            'assets/lotties/qrcode3.json',
            height: size.height * 0.2,
          ),
          decoration: kPageDecoration,
        ),
      ],
      isTopSafeArea: true,
      onDone: () => _onIntroEnd(context),
      showSkipButton: false,
      showDoneButton: false,
      skipFlex: 0,
      nextFlex: 0,
      skip: Text(
        'Skip',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),
      ),
      showNextButton: false,
      done: Text(
        'Done',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? EdgeInsets.all(12.0)
          : EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: DotsDecorator(
        size: Size(10.0, 10.0),
        // size: stateDone == 3 ? Size(0.0, 0.0) : Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeColor: kColorYellow,
        activeSize: Size(32.0, 15.0),
        // activeSize: stateDone == 3 ? Size(0.0, 0.0) : Size(32.0, 15.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(25.0),
          ),
        ),
      ),
      dotsContainerDecorator: ShapeDecoration(
        // color: Colors.black87,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
      ),
    );

    return Scaffold(
      body: Stack(
        children: [
          BackgroundGradient(),
          // logic just for behind on later's
          IndexedStack(
            index: stateDone == 2 ? 1 : 0,
            // index: 0,
            children: [
              Stack(
                children: onboardStack,
              ),
              Text(''),
            ],
          ),
          IndexedStack(
            index: 0,
            children: [
              introductionScreen, // onboardScreen
            ],
          ),
          // logic just for behind on later's
          IndexedStack(
            index: stateDone == 2 ? 0 : 1,
            children: [
              Stack(
                children: onboardStack,
              ),
              Text(''),
            ],
          ),
          // ended
        ],
      ),
    );
  }
}
