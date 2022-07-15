import 'package:flutter/material.dart';
import 'package:uni_dating_app/ui/resources/dimens.dart';
import 'package:uni_dating_app/ui/screens/auth/auth.bloc.dart';
import 'package:uni_dating_app/ui/screens/auth/signup/signup.set.password.dart';

import 'login.enter.password.screen.dart';

class LoginEmailScreen extends StatelessWidget {
  const LoginEmailScreen({Key? key}) : super(key: key);

  static const String routeName = '/login/email';

  static void navigate(BuildContext context) {
    Navigator.of(context).pushNamed(routeName);
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
      body: LoginEmail(),
    );
  }
}

class LoginEmail extends StatefulWidget {
  const LoginEmail({Key? key}) : super(key: key);

  @override
  LoginEmailState createState() => LoginEmailState();
}

class LoginEmailState extends State<LoginEmail> {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 24.0),
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
              onPressed: () async {
                if (_emailController.text
                    .toLowerCase()
                    .endsWith(Dimens.endEmail)) {
                  final model = await AuthBloc.of(context)
                      .checkIsUserExists(_emailController.text);

                  if (!mounted) return;
                  AuthBloc.of(context).email = _emailController.text;

                  if (model != null) {
                    AuthBloc.of(context).password = model.password!;

                    LoginEnterPasswordScreen.navigate(
                      context,
                      _emailController.text,
                    );
                  } else {
                    SignupSetPasswordScreen.navigate(
                      context,
                      _emailController.text,
                    );
                  }
                } else {
                  await showDialog(
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
    );
  }
}
