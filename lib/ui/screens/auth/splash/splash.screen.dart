import 'package:flutter/material.dart';
import 'package:uni_dating_app/ui/screens/auth/auth_init.screen.dart';
import 'package:uni_dating_app/ui/screens/auth/splash/splash.bloc.dart';
import 'package:uni_dating_app/ui/screens/main/main_init.screen.dart';
import 'package:uni_dating_app/utils/simple_code.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    runAfterBuild((_) async {
      if ((await SplashBloc.of(context).getLocalUserId()) != null) {
        MainInitScreen.navigate(context);
      } else {
        AuthInitScreen.navigate(context);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Splash screen'),
      ),
    );
  }
}
