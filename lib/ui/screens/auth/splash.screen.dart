import 'package:flutter/material.dart';
import 'package:uni_dating_app/ui/screens/auth/login.welcome.screen.dart';
import 'package:uni_dating_app/ui/screens/main/main_init.screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static const String routeName = '/';

  static void navigate(BuildContext context) {
    Navigator.of(context).pushNamed(routeName);
  }

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1)).then(
      (value) => MainInitScreen.navigate(context),
    );
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
