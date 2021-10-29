import 'package:flutter_starterpack_jelly/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData get lightTheme {
    //1
    return ThemeData(
      //2
      primaryColor: kPrimaryColor,
      scaffoldBackgroundColor: Colors.white,
      // fontFamily: 'Montserrat', //3
      buttonTheme: ButtonThemeData(
        // 4
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
        buttonColor: kAccentColor,
      ),
      accentColor: kAccentColor,
      hintColor: Colors.grey,
      inputDecorationTheme: InputDecorationTheme(
        fillColor: kPrimaryColor,
        focusColor: kPrimaryColor,
        prefixStyle: TextStyle(
          color: kPrimaryColor,
          backgroundColor: kPrimaryColor,
        ),
        suffixStyle: TextStyle(
          color: kPrimaryColor,
          backgroundColor: kPrimaryColor,
        ),
      ),
      iconTheme: IconThemeData(
        color: kPrimaryColor,
      ),
      accentIconTheme: IconThemeData(
        color: kPrimaryColor,
      ),
      highlightColor: kPrimaryColor,
      indicatorColor: kPrimaryColor,
      primaryIconTheme: IconThemeData(
        color: kPrimaryColor,
      ),
      textSelectionTheme: TextSelectionThemeData(cursorColor: kAccentColor),
      fontFamily: 'SourceSansPro',
      textTheme: TextTheme(
        headline3: TextStyle(
          fontFamily: 'OpenSans',
          fontSize: 45.0,
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
        button: TextStyle(
          // OpenSans is similar to NotoSans but the uppercases look a bit better IMO
          fontFamily: 'OpenSans',
        ),
        caption: TextStyle(
          fontFamily: 'NotoSans',
          fontSize: 12.0,
          fontWeight: FontWeight.normal,
          color: Colors.black,
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
        primaryColor: Colors.grey,
        scaffoldBackgroundColor: Colors.black,
        fontFamily: 'Montserrat',
        textTheme: ThemeData.dark().textTheme,
        buttonTheme: ButtonThemeData(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
          buttonColor: Colors.deepPurple,
        ));
  }

  static ThemeData get lightThemeV2 {
    return ThemeData(
      brightness: Brightness.light,
      visualDensity: VisualDensity(vertical: 0.5, horizontal: 0.5),
      primarySwatch: MaterialColor(
        0xFF301781,
        <int, Color>{
          50: Color(0xFFeee9fb),
          100: Color(0xFFcbbef3),
          200: Color(0xFFa893ec),
          300: Color(0xFF8568e4),
          400: Color(0xFF623cdc),
          500: Color(0xFF4823c3),
          600: Color(0xFF381b97),
          700: Color(0xFF28136c),
          800: Color(0xFF180c41),
          900: Color(0xFF180c41)
        },
      ),
      primaryColor: kPrimaryColor,
      primaryColorBrightness: Brightness.light,
      primaryColorLight: kPrimaryColorLight,
      primaryColorDark: kPrimaryColorDark,
      canvasColor: kPrimaryColor,
      accentColor: kAccentColor,
      accentColorBrightness: Brightness.light,
      scaffoldBackgroundColor: Color(0xffB5BFD3),
      // bottomAppBarColor: kColorOrange,
      bottomAppBarColor: Color(0xFF757575),
      cardColor: Colors.white,
      dividerColor: Color(0x1f6D42CE),
      focusColor: Color(0x1aF5E0C3),
    );
  }
}
