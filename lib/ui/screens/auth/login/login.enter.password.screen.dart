import 'package:flutter/material.dart';
import 'package:uni_dating_app/ui/screens/auth/auth.bloc.dart';
import 'package:uni_dating_app/ui/screens/main/main_init.screen.dart';
import 'package:uni_dating_app/ui/screens/profile/eidt_init.screen.dart';
import 'package:uni_dating_app/ui/screens/profile/profile.edit.dart';
import 'package:uni_dating_app/utils/nested_navigator.dart';

class LoginEnterPasswordScreen extends StatelessWidget {
  final String? email;

  const LoginEnterPasswordScreen({Key? key, required this.email})
      : super(key: key);

  static const String routeName = '/login/enter_password';

  static void navigate(BuildContext context,
      [String? email, String? password]) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LoginEnterPasswordScreen(
          email: email,
        ),
      ),
    );
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
            Text('Login'),
            Container(
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
                onPressed: () async {
                  // *
                  //
                  //
                  //
                  // CHECK IF ENTERED PASSWORD IS CORRECT FOR CURRENT USER
                  //
                  //
                  //
                  // * //

                  var passwordIsCorrect =
                      AuthBloc.of(context).password == _emailController.text;

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

                  AuthBloc.of(context).email = _emailController.text;

                  var userAlreadyFilledProfile = false;

                  if (passwordIsCorrect) {
                    AuthBloc.of(context).updateLocalUser();
                      if (!mounted) return;

                      final parentContext = NestedNavigator.maybeOf(context)
                          ?.parentNavigatorRoute
                          ?.navigator
                          ?.context ?? context;
                      await Navigator.pushNamedAndRemoveUntil(
                          parentContext, MainInitScreen.routeName, (_) => false);
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
