import 'package:flutter/material.dart';
import 'package:uni_dating_app/repositories/news/news.repository.dart';
import 'package:uni_dating_app/repositories/users/users.repository.dart';
import 'package:uni_dating_app/ui/screens/auth/auth.bloc.dart';
import 'package:uni_dating_app/ui/screens/auth/main/login.welcome.screen.dart';
import 'package:uni_dating_app/ui/screens/main/main.bloc.dart';
import 'package:uni_dating_app/ui/screens/main/main.screen.dart';
import 'package:uni_dating_app/utils/bloc.dart';

import 'router.dart';

class AuthInitScreen extends StatelessWidget {
  const AuthInitScreen({Key? key}) : super(key: key);

  static const String routeName = '/auth_init';

  static void navigate(BuildContext context) {
    Navigator.of(context).pushNamed(routeName);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      blocBuilder: () {
        return AuthBloc(UsersRepository.of(context));
      },
      builder: (context, bloc) {
        return const TheAuthRouter();
      },
    );
  }
}
