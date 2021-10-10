import 'package:flutter_starterpack_jelly/utils/preference.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreference {
  Future<bool> checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return (prefs.getBool(kStateOnBoarding) ?? false);
  }

  void setCheckFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(kStateOnBoarding, true);
  }
}
