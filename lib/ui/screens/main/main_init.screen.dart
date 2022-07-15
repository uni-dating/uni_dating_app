import 'package:flutter/material.dart';
import 'package:uni_dating_app/repositories/news/news.repository.dart';
import 'package:uni_dating_app/repositories/users/users.repository.dart';
import 'package:uni_dating_app/ui/screens/main/main.bloc.dart';
import 'package:uni_dating_app/ui/screens/main/main.screen.dart';
import 'package:uni_dating_app/utils/bloc.dart';

class MainInitScreen extends StatelessWidget {
  const MainInitScreen({Key? key}) : super(key: key);

  static const String routeName = '/main';

  static void navigate(BuildContext context) {
    Navigator.of(context).pushNamed(routeName);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      blocBuilder: () {
        return MainBloc(
          NewsRepository.of(context),
          UsersRepository.of(context),
        )..initUser();
      },
      builder: (context, bloc) {
        return const MainScreen();
      },
    );
  }
}
