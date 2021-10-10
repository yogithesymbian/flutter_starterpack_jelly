import 'package:flutter_starterpack_jelly/screens/home/home_screen.dart';
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
              Hero(
                tag: 'splash_screen',
                child: Lottie.asset(
                  'assets/lotties/work-day.json',
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 5.h,
                      ),
                      TextField(
                        autofocus: false,
                        style: kTextFieldTextStyle.copyWith(
                          color: kPrimaryColor,
                        ),
                        keyboardType: TextInputType.emailAddress,
                        cursorColor: kPrimaryColor,
                        decoration: kInputDecoration.copyWith(
                          hintText: 'email@gmail.com',
                          prefixIcon: Icon(
                            Icons.email,
                            color: kPrimaryColor,
                          ),
                          suffixIcon: mailController.text.isNotEmpty
                              ? IconButton(
                                  onPressed: mailController.clear,
                                  icon: Icon(
                                    Icons.clear,
                                    color: kPrimaryColor,
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
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: _obscure,
                        cursorColor: kPrimaryColor,
                        decoration: kInputDecoration.copyWith(
                            hintText: '*******',
                            prefixIcon: Icon(
                              Icons.lock,
                              color: kPrimaryColor,
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
                                color: kPrimaryColor,
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
                      ElevatedButton.icon(
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
                              final isLogin =
                                  await secureStorage.readSecureData(kBearer);
                              print('onSubmit check : $isLogin');
                              isLogin != null
                                  ? Navigator.pushNamed(context, HomeScreen.id)
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
                        icon: Icon(
                          Icons.login,
                          color: Colors.white,
                          size: 2.h,
                        ),
                        label: Text(
                          'Sign IN',
                          style: TextStyle(
                            fontSize: 12.0,
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
                      TextButton(
                        onPressed: () {
                          //
                        },
                        child: Text('Sign UP'),
                      )
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
