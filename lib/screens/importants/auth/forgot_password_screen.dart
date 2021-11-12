import 'package:flutter/material.dart';
import 'package:flutter_starterpack_jelly/screens/importants/auth/otp_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_starterpack_jelly/utils/colors.dart';
import 'package:flutter_starterpack_jelly/utils/constanta.dart';
import 'package:sizer/sizer.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static const String id = '/forgot_password_screen';
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController mailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // mailController.addListener();
    // passController.addListener();
  }

  @override
  void dispose() {
    mailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final authService = AuthService();
    // final secureStorage = SecureStorage();
    final size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.asset(
                'assets/lotties/work-day.json',
              ),
              Expanded(
                child: SingleChildScrollView(
                  reverse: true, // auto scroll to textfield
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // *  YOUR WIDGETS HERE
                      Row(
                        children: [
                          Text(
                            'Forgot\nPassword?',
                            style: kTitleText.copyWith(
                              color: kPrimaryColorLight,
                              fontSize: 38.0,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        'Don\'t Worry! it happens. Please enter the address associated with your account.',
                        style: kSmallText,
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
                        height: 7.h,
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
                              'SUBMIT',
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
