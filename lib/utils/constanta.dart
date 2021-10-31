import 'package:flutter/material.dart';
import 'package:flutter_starterpack_jelly/utils/colors.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

// introduction screen
const kBodyStyle = TextStyle(
  fontSize: 19.0,
  color: Colors.white,
);

const kPageDecoration = PageDecoration(
  titleTextStyle: TextStyle(
    fontSize: 28.0,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  ),
  bodyFlex: 3,
  imageFlex: 4,
  fullScreen: false,
  bodyTextStyle: kBodyStyle,
  descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
  imagePadding: EdgeInsets.zero,
);

const kNormalText = TextStyle(
  color: Colors.black,
  fontSize: 14.0,
  fontWeight: FontWeight.bold,
);
const kTitleText = TextStyle(
  color: Colors.white,
  fontSize: 18.0,
  fontWeight: FontWeight.bold,
);
// Puzzle Sound
const kPadingSixTeen = 16.0;

const kTextFieldTextStyle = TextStyle(
  color: Colors.black,
);
const kInputDecoration = InputDecoration(
  hintText: 'Add Task',
  hintStyle: TextStyle(color: kPrimaryColor),
  fillColor: kPrimaryColor,
  hoverColor: kPrimaryColor,
  focusColor: kPrimaryColor,
  contentPadding: EdgeInsets.symmetric(
    horizontal: 20.0,
    vertical: 10.0,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(32.0),
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: kPrimaryColor,
      width: 1.0,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(32.0),
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: kPrimaryColor,
      width: 2.0,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(32.0),
    ),
  ),
);

var alertStyle = AlertStyle(
  animationType: AnimationType.fromTop,
  isCloseButton: false,
  isOverlayTapDismiss: false,
  descStyle: TextStyle(fontWeight: FontWeight.bold),
  descTextAlign: TextAlign.start,
  animationDuration: Duration(milliseconds: 400),
  alertBorder: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(0.0),
    side: BorderSide(
      color: Colors.grey,
    ),
  ),
  titleStyle: TextStyle(
    color: Colors.red,
  ),
  alertAlignment: Alignment.topCenter,
);
