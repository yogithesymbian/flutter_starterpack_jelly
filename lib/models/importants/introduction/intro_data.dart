import 'dart:collection';

import 'package:flutter_starterpack_jelly/components/rounded_button.dart';
import 'package:flutter_starterpack_jelly/utils/colors.dart';
import 'package:flutter_starterpack_jelly/utils/constanta.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroData with ChangeNotifier {
  List<PageViewModel> _listViewPageModel = [
    PageViewModel(
      title: "Have Fun",
      body: "Study with beautiful illustration and visual games",
      image: Image.asset(
        'assets/images/onboard_1.png',
      ),
      decoration: kPageDecoration,
    ),
    PageViewModel(
      title: "Have Fun",
      body: "Study with beautiful illustration and visual games",
      image: Image.asset(
        'assets/images/onboard_2.png',
      ),
      decoration: kPageDecoration,
    ),
    PageViewModel(
      title: "Have Fun",
      body: "Study with beautiful illustration and visual games",
      image: Image.asset(
        'assets/images/onboard_3.png',
        fit: BoxFit.fitWidth,
      ),
      decoration: kPageDecoration,
    ),
    PageViewModel(
      title: "",
      body: "",
      image: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            // height: size.height * 0.6,
            width: double.infinity,
            margin: EdgeInsets.only(top: 120.0, left: 40.0, right: 40.0),
            decoration: BoxDecoration(
              color: kColorGreenType2,
              borderRadius: BorderRadius.all(
                Radius.circular(30.0),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  'assets/images/onboard_4.png',
                  // height: size.height * 0.3,
                ),
                Text(
                  'Hi!',
                  style: kNormalText.copyWith(
                      // fontSize: kValue32,
                      ),
                ),
                Text(
                  'Hi! We’ve preparws a short tutorial to show you how Danum works! :)',
                  textAlign: TextAlign.center,
                  style: kNormalText.copyWith(
                      // fontSize: kValue15,
                      ),
                ),
                SizedBox(
                    // height: size.height * 0.05,
                    )
              ],
            ),
          ),
        ],
      ),
      footer: RoundedButton(
        title: 'Start Trial',
        colour: kPrimaryColor,
        onPressed: () {
          print('clicked start trial');
          // _onIntroEnd(context);
        },
      ),
      decoration: PageDecoration(
        titleTextStyle: TextStyle(
          fontSize: 28.0,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
        imageFlex: 4,
        bodyFlex: 2,
        fullScreen: true,
        bodyTextStyle: kBodyStyle,
        descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
        contentMargin: EdgeInsets.symmetric(horizontal: 16),
        imagePadding: EdgeInsets.zero,
      ),
    ),
  ];

  UnmodifiableListView<PageViewModel> get listViewPageModel {
    return UnmodifiableListView(_listViewPageModel);
  }

  int get count {
    return _listViewPageModel.length;
  }
}
