import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_starterpack_jelly/utils/colors.dart';
import 'package:flutter_starterpack_jelly/utils/constanta.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:sizer/sizer.dart';

class OtpScreen extends StatefulWidget {
  static const String id = '/otp_screen';
  const OtpScreen({Key? key}) : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
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
                            'Enter OTP',
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
                      Row(
                        children: [
                          Text(
                            'An 4 digit code has been sent to \nyogirenbox33@gmail.com',
                            style: kSmallText,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      OTPTextField(
                        length: 4,
                        width: MediaQuery.of(context).size.width,
                        fieldWidth: 50,
                        style: TextStyle(fontSize: 17),
                        textFieldAlignment: MainAxisAlignment.spaceAround,
                        fieldStyle: FieldStyle.underline,
                        onCompleted: (pin) {
                          print("Completed: " + pin);
                        },
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
                              //
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
