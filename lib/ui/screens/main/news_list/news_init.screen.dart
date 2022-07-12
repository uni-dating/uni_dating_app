import 'package:flutter/material.dart';
import 'package:uni_dating_app/repositories/news/news.repository.dart';
import 'package:uni_dating_app/utils/bloc.dart';

import 'news.bloc.dart';
import 'news.screen.dart';

class NewsInitScreen extends StatelessWidget {
  const NewsInitScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      blocBuilder: () {
        return NewsBloc(NewsRepository.of(context))..setNewsStream();
      },
      builder: (context, bloc) {
        return const NewsScreen();
      },
    );
  }
}
