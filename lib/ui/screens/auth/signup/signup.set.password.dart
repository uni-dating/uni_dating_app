import 'package:flutter/material.dart';
import 'package:uni_dating_app/ui/screens/auth/main/login.welcome.screen.dart';
import 'package:uni_dating_app/ui/screens/profile/profile.edit.dart';

class SignupSetPasswordScreen extends StatelessWidget {
  final String? email;

  const SignupSetPasswordScreen({Key? key, required this.email})
      : super(key: key);

  static const String routeName = '/login/enter_password';

  static void navigate(BuildContext context, [String? email]) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SignupSetPasswordScreen(email: email),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: const SignupSetPassword(),
    );
  }
}

class SignupSetPassword extends StatefulWidget {
  const SignupSetPassword({Key? key}) : super(key: key);

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
      child: Column(
        children: [
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
              ),
            ),
          ),
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
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 120, 0, 0),
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

                  ProfileEditScreen.navigate(context);

                } else {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Warning'),
                      content: const Text('Passwords do not match'),
                      actions: [
                        TextButton(
                            child: const Text('Ok'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            })
                      ],
                    ),
                  );
                }
              },
              child: const Text(
                'Set Password',
                style: const TextStyle(color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(
                  //backgroundColor: Colors.grey[300],
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
