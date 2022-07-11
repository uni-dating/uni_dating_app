import 'package:flutter/material.dart';
import 'package:uni_dating_app/utils/bloc.dart';

import 'news.bloc.dart';
import 'news.screen.dart';

class NewsInitScreen extends StatelessWidget {
  const NewsInitScreen({Key? key}) : super(key: key);

  static const String routeName = '/main';

  static void navigate(BuildContext context) {
    Navigator.of(context).pushNamed(routeName);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      blocBuilder: () {
        return NewsBloc();
      },
      builder: (context, bloc) {
        return const NewsScreen();
      },
    );
  }
}
