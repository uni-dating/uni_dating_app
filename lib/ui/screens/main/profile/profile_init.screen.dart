import 'package:flutter/material.dart';
import 'package:uni_dating_app/repositories/news/news.repository.dart';
import 'package:uni_dating_app/repositories/users/users.repository.dart';
import 'package:uni_dating_app/utils/bloc.dart';

import 'profile.bloc.dart';
import 'profile.screen.dart';

class ProfileInitScreen extends StatelessWidget {
  const ProfileInitScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      blocBuilder: () {
        return ProfileBloc(
          NewsRepository.of(context),
          UsersRepository.of(context),
        )..setNewsStream();
      },
      builder: (context, bloc) {
        return const ProfileScreen();
      },
    );
  }
}
