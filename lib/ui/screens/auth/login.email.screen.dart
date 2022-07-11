import 'package:animated_gesture_detector/animated_gesture_detector.dart';
import 'package:flutter/material.dart';
import 'package:uni_dating_app/ui/resources/colors.dart';
import 'package:uni_dating_app/ui/screens/main/main_init.screen.dart';
import 'package:uni_dating_app/ui/screens/signup/signup.set.password.dart';

import '../profile/profile.edit.dart';
import 'login.enter.password.screen.dart';

class LoginEmailScreen extends StatelessWidget {
  const LoginEmailScreen({Key? key}) : super(key: key);

  static const String routeName = '/login/email';

  static void navigate(BuildContext context) {
    Navigator.of(context).pushNamed(routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(resizeToAvoidBottomInset: false, body: LoginEmail());
  }
}

class LoginEmail extends StatefulWidget {
  LoginEmail({Key? key}) : super(key: key);

  @override
  LoginEmailState createState() => LoginEmailState();
}

class LoginEmailState extends State<LoginEmail> {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new_rounded),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: 44,
              margin: const EdgeInsets.fromLTRB(0, 283, 0, 0),
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  labelText: 'Email',
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 120, 0, 0),
              width: 243,
              height: 51,
              child: ElevatedButton(
                onPressed: () {
                  if (_emailController.text
                      .endsWith('@Student.Reutlingen-University.DE')) {
                    //*
                    //
                    //
                    // CHECK IF USER EXISTS
                    //
                    //
                    //
                    //
                    // *//

                    bool exists = true;

                    if (exists) {
                      LoginEnterPasswordScreen.navigate(
                        context,
                        _emailController.text,
                      );
                    } else {
                      SignupSetPasswordScreen.navigate(
                          context, _emailController.text);
                    }
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Warning'),
                        content: const Text('Not valid Email'),
                        actions: [
                          TextButton(
                            child: const Text('Ok'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      ),
                    );
                  }
                },
                child: const Text(
                  'Continue',
                  style: TextStyle(color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(
                  //backgroundColor: Colors.grey[300],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
