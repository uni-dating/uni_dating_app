import 'package:flutter/material.dart';
import 'package:uni_dating_app/repositories/users/users.repository.dart';
import 'package:uni_dating_app/ui/screens/auth/splash/splash.bloc.dart';
import 'package:uni_dating_app/ui/screens/auth/splash/splash.screen.dart';
import 'package:uni_dating_app/utils/bloc.dart';

class SplashInitScreen extends StatelessWidget {
  const SplashInitScreen({Key? key}) : super(key: key);

  static const String routeName = '/';

  static void navigate(BuildContext context) {
    Navigator.of(context).pushNamed(routeName);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      blocBuilder: () {
        return SplashBloc(UsersRepository.of(context));
      },
      builder: (context, bloc) {
        return const SplashScreen();
      },
    );
  }
}
