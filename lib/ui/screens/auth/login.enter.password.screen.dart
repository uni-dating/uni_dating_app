import 'package:animated_gesture_detector/animated_gesture_detector.dart';
import 'package:flutter/material.dart';
import 'package:uni_dating_app/ui/resources/colors.dart';
import 'package:uni_dating_app/ui/screens/main/main_init.screen.dart';

import '../main/main.screen.dart';
import '../profile/profile.edit.dart';

class LoginEnterPasswordScreen extends StatelessWidget {
  final String? email;

  const LoginEnterPasswordScreen({Key? key, required this.email})
      : super(key: key);

  static const String routeName = '/login/enter_password';

  static void navigate(BuildContext context, [String? email]) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => LoginEnterPasswordScreen(email: email)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LoginEnterPassword());
  }
}

class LoginEnterPassword extends StatefulWidget {
  LoginEnterPassword({Key? key}) : super(key: key);

  @override
  LoginEnterPasswordState createState() => LoginEnterPasswordState();
}

class LoginEnterPasswordState extends State<LoginEnterPassword> {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        child: Column(
          children: [
            Container(
              height: 44,
              margin: const EdgeInsets.fromLTRB(0, 283, 0, 0),
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  labelText: 'Password',
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 120, 0, 0),
              width: 243,
              height: 51,
              child: ElevatedButton(
                onPressed: () {
                  // *
                  //
                  //
                  //
                  // CHECK IF ENTERED PASSWORD IS CORRECT FOR CURRENT USER
                  //
                  //
                  //
                  // * //

                  bool passwordIsCorrect = true;

                  // *
                  //
                  //
                  //
                  // CHECK IF USER ALREADY FILLED THE PROFILE (FIRST TIMER OR
                  // CONSISTENT USER
                  //
                  // IF THE USER JUST REGISTERED SEND HIM TO FILL OUT THE PROFILE
                  //
                  // OTHERWISE HUST LOG HIM IN AND SEND TO MAIN PAGE
                  //
                  //
                  // * //

                  bool userAlreadyFilledProfile = false;

                  if (passwordIsCorrect) {
                    if (userAlreadyFilledProfile) {
                      MainInitScreen.navigate(context);
                    } else {
                      ProfileEditScreen.navigate(context);
                    }
                  } else {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: const Text('Warning'),
                              content: const Text('Not valid Password'),
                              actions: [
                                TextButton(
                                    child: const Text('Ok'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    })
                              ],
                            ));
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
