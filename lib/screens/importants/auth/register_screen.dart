import 'package:flutter/gestures.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter_starterpack_jelly/screens/importants/auth/otp_screen.dart';
import 'package:flutter_starterpack_jelly/services/auth/auth_service.dart';
import 'package:flutter_starterpack_jelly/services/storage/storage.dart';
import 'package:flutter_starterpack_jelly/utils/colors.dart';
import 'package:flutter_starterpack_jelly/utils/constanta.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  static const String id = '/register_screen';
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController mailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  // MoneyMaskedTextController phoneNumberController = MoneyMaskedTextController(
  // );
  MaskedTextController phoneNumberController =
      MaskedTextController(mask: '0000-0000-0000', text: '08');
  bool _obscure = true;

  @override
  void initState() {
    super.initState();
    // mailController.addListener();
    // passController.addListener();
  }

  @override
  void dispose() {
    mailController.dispose();
    usernameController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authService = AuthService();
    final secureStorage = SecureStorage();
    final size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(32.0),
          child: Column(
            children: [
              Lottie.asset(
                'assets/lotties/work-day.json',
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  reverse: true, // auto scroll to textfield
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Sign up',
                            style: kTitleText.copyWith(
                              color: kPrimaryColorLight,
                              fontSize: 38.0,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      TextField(
                        autofocus: false,
                        style: kTextFieldTextStyle.copyWith(
                          color: kPrimaryColor,
                        ),
                        keyboardType: TextInputType.emailAddress,
                        cursorColor: kPrimaryColorLight,
                        decoration: kInputDecoration.copyWith(
                          hintText: 'Email ID',
                          prefixIcon: Icon(
                            Icons.track_changes,
                            color: kPrimaryColorLight,
                          ),
                          suffixIcon: mailController.text.isNotEmpty
                              ? IconButton(
                                  onPressed: mailController.clear,
                                  icon: Icon(
                                    Icons.clear,
                                    color: kPrimaryColorLight,
                                  ),
                                )
                              : null,
                        ),
                        textInputAction: TextInputAction.next,
                        controller: mailController,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      TextField(
                        autofocus: false,
                        style: kTextFieldTextStyle.copyWith(
                          color: kPrimaryColor,
                        ),
                        keyboardType: TextInputType.emailAddress,
                        cursorColor: kPrimaryColorLight,
                        decoration: kInputDecoration.copyWith(
                          hintText: 'Full name',
                          prefixIcon: Icon(
                            Icons.person,
                            color: kPrimaryColorLight,
                          ),
                          suffixIcon: usernameController.text.isNotEmpty
                              ? IconButton(
                                  onPressed: usernameController.clear,
                                  icon: Icon(
                                    Icons.clear,
                                    color: kPrimaryColorLight,
                                  ),
                                )
                              : null,
                        ),
                        textInputAction: TextInputAction.next,
                        controller: usernameController,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      TextField(
                        autofocus: false,
                        style: kTextFieldTextStyle.copyWith(
                          color: kPrimaryColor,
                        ),
                        keyboardType: TextInputType.number,
                        cursorColor: kPrimaryColorLight,
                        decoration: kInputDecoration.copyWith(
                          hintText: 'Mobile',
                          prefixIcon: Icon(
                            Icons.phone,
                            color: kPrimaryColorLight,
                          ),
                          suffixIcon: phoneNumberController.text.isNotEmpty
                              ? IconButton(
                                  onPressed: phoneNumberController.clear,
                                  icon: Icon(
                                    Icons.clear,
                                    color: kPrimaryColorLight,
                                  ),
                                )
                              : null,
                        ),
                        textInputAction: TextInputAction.next,
                        controller: phoneNumberController,
                      ),
                      // Container(
                      //   margin: EdgeInsets.only(left: 1.5.h, top: 0.2.h),
                      //   child: Text(
                      //     'example: 0812-4555-2222',
                      //     textAlign: TextAlign.center,
                      //     style: kSmallText,
                      //   ),
                      // ),
                      SizedBox(
                        height: 2.h,
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'By signing up. you\'re agree to our',
                              style: kSmallText,
                            ),
                            TextSpan(
                              text: ' Terms & Conditions',
                              style: kSmallText.copyWith(
                                color: kPrimaryColorLight,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  // Navigator.pushNamed(context, LoginScreen.id);
                                },
                            ),
                            TextSpan(
                              text: ' and',
                              style: kSmallText,
                            ),
                            TextSpan(
                              text: ' Privacy Policy',
                              style: kSmallText.copyWith(
                                color: kPrimaryColorLight,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  // Navigator.pushNamed(context , LoginScreen.id);
                                },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      SizedBox(
                        height: 7.h,
                        child: Container(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () async {
                              Navigator.pushNamed(context, OtpScreen.id);
                            },
                            child: Text(
                              'CONTINUE',
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: kPrimarySwatch,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Center(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Joined us before?',
                                style: kSmallText,
                              ),
                              TextSpan(
                                text: ' Login',
                                style: kSmallText.copyWith(
                                  color: kPrimaryColorLight,
                                  fontWeight: FontWeight.bold,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushNamed(
                                        context, LoginScreen.id);
                                  },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
