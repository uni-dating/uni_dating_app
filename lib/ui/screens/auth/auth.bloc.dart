import 'package:flutter/material.dart';
import 'package:uni_dating_app/models/profile/user.info.model.dart';
import 'package:uni_dating_app/repositories/users/users.repository.dart';
import 'package:uni_dating_app/utils/bloc.dart';
import 'package:uni_dating_app/utils/provider.service.dart';
import 'package:uuid/uuid.dart';

class AuthBloc extends Bloc {
  AuthBloc(this.usersRepository);

  final UsersRepository usersRepository;

  Future<bool> addUser(UserInfoModel model) {
    usersRepository.addUser(model);

    return Future.value(true);
  }

  Future<bool> checkIsUserExists(String email) =>
      usersRepository.isUserAlreadyExists(email);

  static AuthBloc of(BuildContext context) =>
      ProviderService.of<AuthBloc>(context);
}
