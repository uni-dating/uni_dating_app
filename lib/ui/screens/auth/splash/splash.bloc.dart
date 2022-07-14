import 'package:flutter/material.dart';
import 'package:uni_dating_app/models/news/news.model.dart';
import 'package:uni_dating_app/repositories/news/news.repository.dart';
import 'package:uni_dating_app/repositories/users/users.repository.dart';
import 'package:uni_dating_app/utils/bloc.dart';
import 'package:uni_dating_app/utils/provider.service.dart';
import 'package:uuid/uuid.dart';

class SplashBloc extends Bloc {
  SplashBloc(this.usersRepository);

  final UsersRepository usersRepository;

  Future<String?> getLocalUserId() => usersRepository.getLocalUserId();

  static SplashBloc of(BuildContext context) =>
      ProviderService.of<SplashBloc>(context);
}
