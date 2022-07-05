import 'package:animated_gesture_detector/animated_gesture_detector.dart';
import 'package:flutter/material.dart';
import 'package:uni_dating_app/ui/resources/colors.dart';
import 'package:uni_dating_app/ui/screens/auth/login.welcome.screen.dart';
import 'package:uni_dating_app/ui/screens/main/main_init.screen.dart';

import '../main/main.screen.dart';
import '../profile/profile.edit.dart';

class SignupSetPasswordScreen extends StatelessWidget {
  final String? email;

  const SignupSetPasswordScreen({Key? key, required this.email})
      : super(key: key);

  static const String routeName = '/login/enter_password';

  static void navigate(BuildContext context, [String? email]) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SignupSetPasswordScreen(email: email)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(resizeToAvoidBottomInset: false, body: SignupSetPassword());
  }
}

class SignupSetPassword extends StatefulWidget {
  SignupSetPassword({Key? key}) : super(key: key);

  @override
  SignupSetPasswordState createState() => SignupSetPasswordState();
}

class SignupSetPasswordState extends State<SignupSetPassword> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmController =
      TextEditingController();

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
                    controller: _passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      labelText: 'Password',
                    ))),
            Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 44,
                margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: TextField(
                    controller: _passwordConfirmController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      labelText: 'Confirm Password',
                    ))),
            Container(
              margin: EdgeInsets.fromLTRB(0, 120, 0, 0),
              width: 243,
              height: 51,
              child: ElevatedButton(
                onPressed: () {
                  if (_passwordController.text ==
                      _passwordConfirmController.text) {

                    //*
                    //
                    //
                    //
                    // REGISTER USER ON FIREBASE
                    //
                    //
                    //
                    //
                    // *//

                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        content: Text('Please, confirm your email'),
                        actions: [
                          TextButton(
                              child: Text('Ok'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              })
                        ],
                      ),).then((val){
                      LoginWelcomeScreen.navigate(context);
                    });
                  } else {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: Text('Warning'),
                              content: Text('Passwords do not match'),
                              actions: [
                                TextButton(
                                    child: Text('Ok'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    })
                              ],
                            ),);
                  }
                },
                child: Text(
                  'Set Password',
                  style: TextStyle(color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[300],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
