import 'package:flutter/gestures.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:flutter_starterpack_jelly/screens/importants/auth/forgot_password_screen.dart';
import 'package:flutter_starterpack_jelly/screens/importants/auth/register_screen.dart';
import 'package:flutter_starterpack_jelly/screens/yogithesymbian/home_screen.dart';
import 'package:flutter_starterpack_jelly/services/auth/auth_service.dart';
import 'package:flutter_starterpack_jelly/services/storage/storage.dart';
import 'package:flutter_starterpack_jelly/utils/colors.dart';
import 'package:flutter_starterpack_jelly/utils/constanta.dart';
import 'package:flutter_starterpack_jelly/utils/value.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatefulWidget {
  static const String id = '/auth';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController mailController = TextEditingController();
  TextEditingController passController = TextEditingController();
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
    passController.dispose();
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
                  reverse: true, // auto scroll to textfield
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Login',
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
                          color: kPrimaryColorLight,
                        ),
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: _obscure,
                        cursorColor: kPrimaryColorLight,
                        decoration: kInputDecoration.copyWith(
                            hintText: '*******',
                            prefixIcon: Icon(
                              Icons.lock,
                              color: kPrimaryColorLight,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                _obscure = !_obscure;
                                setState(() {});
                              },
                              icon: Icon(
                                _obscure
                                    ? FontAwesomeIcons.solidEyeSlash
                                    : FontAwesomeIcons.solidEye,
                                color: kPrimaryColorLight,
                              ),
                            )),
                        textInputAction: TextInputAction.done,
                        controller: passController,
                        onSubmitted: (value) {
                          print(value);
                          passController.text = value;
                          setState(() {});
                        },
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                ForgotPasswordScreen.id,
                              );
                            },
                            child: Text(
                              'Forgot Password?',
                              textAlign: TextAlign.end,
                              style: kSmallText.copyWith(
                                color: kPrimaryColorLight,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 1.5.h,
                      ),
                      SizedBox(
                        height: 7.h,
                        child: Container(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () async {
                              // Navigator.of(context).pushNamedAndRemoveUntil(
                              //     HomeScreen.id, (Route<dynamic> route) => false);
                              print('Login info');
                              print('Name: ${mailController.text}');
                              print('Password: ${passController.text}');
                              try {
                                final body =
                                    '{"email": "${mailController.text}", "password": "${passController.text}"}';

                                final response = await authService.signIn(body);
                                if (response['success'] == true) {
                                  await authService.store(response);
                                  final isLogin = await secureStorage
                                      .readSecureData(kBearer);
                                  print('onSubmit check : $isLogin');
                                  isLogin != null
                                      ? Navigator.pushNamed(
                                          context, HomeScreen.id)
                                      : Navigator.pushNamed(
                                          context, LoginScreen.id);
                                } else {
                                  // return await authService.message('signIn1');
                                  print('catch signIn error else $response');
                                }
                              } catch (e) {
                                print('catch signIn error : $e');
                                // return await authService.message('signIn1');
                              } // );
                            },
                            child: Text(
                              'Login',
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
                        height: 1.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Divider(),
                          ),
                          Text('OR'),
                          Expanded(child: Divider()),
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Container(
                        width: double.infinity,
                        child: SignInButton(
                          Buttons.Google,
                          onPressed: () {},
                          padding: EdgeInsets.symmetric(vertical: 5.0),
                        ),
                      ),

                      // with custom text
                      SizedBox(
                        height: 5.h,
                      ),
                      Center(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'New to Logistics?',
                                style: kSmallText,
                              ),
                              TextSpan(
                                text: ' Sign UP',
                                style: kSmallText.copyWith(
                                  color: kPrimaryColorLight,
                                  fontWeight: FontWeight.bold,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushNamed(
                                        context, RegisterScreen.id);
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
