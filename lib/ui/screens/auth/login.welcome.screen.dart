import 'package:animated_gesture_detector/animated_gesture_detector.dart';
import 'package:flutter/material.dart';
import 'package:uni_dating_app/ui/resources/colors.dart';
import 'package:uni_dating_app/ui/screens/auth/login.email.screen.dart';
import 'package:uni_dating_app/ui/screens/main/main_init.screen.dart';

import '../profile/profile.edit.dart';

class LoginWelcomeScreen extends StatelessWidget {
  const LoginWelcomeScreen({Key? key}) : super(key: key);

  static const String routeName = '/login';

  static void navigate(BuildContext context) {
    Navigator.of(context).pushNamed(routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Container(
            child: Column(
              children: [
                Container(
                    padding: const EdgeInsets.fromLTRB(0, 171, 0, 0),
                    child: Image.asset('lib/assets/imgs/AppLogo.png')),
                Container(
                    margin: const EdgeInsets.fromLTRB(0, 140, 0, 0),
                    width: 243,
                    height: 51,
                    child: ElevatedButton(
                        onPressed: () {
                          LoginEmailScreen.navigate(context);
                        },
                        child: const Text(
                          'Log In',
                          style: TextStyle(color: Colors.black),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[300],
                        ))),
                const Spacer(),
                Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                    child: Column(
                      children: const [
                        Text('Privacy Policy',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            )),
                        Text('Terms and conditions',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ))
                      ],
                    ))
              ],
            ),
          ),
        ));
  }
}
