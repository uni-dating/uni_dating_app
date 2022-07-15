import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:uni_dating_app/models/profile/user.info.model.dart';
import 'package:uni_dating_app/repositories/users/users.repository.dart';
import 'package:uni_dating_app/utils/bloc.dart';
import 'package:uni_dating_app/utils/provider.service.dart';
import 'package:uuid/uuid.dart';

class EditProfileBloc extends Bloc {
  EditProfileBloc(this.usersRepository);

  final UsersRepository usersRepository;

  final _profile = BehaviorSubject<UserInfoModel?>.seeded(null);

  ValueStream<UserInfoModel?> get profile => _profile;
  ValueStream<UserInfoModel?> get user => usersRepository.user;

  ///TODO(Andrii): get profile from backend
  Future<void> getProfile() async {
    _profile.add(
      UserInfoModel(
        id: const Uuid().v1(),
        username: 'My user name',
        school: '1', links: [],
      ),
    );
  }

  Future<bool> updateUser(UserInfoModel model) async {
    await usersRepository.updateUserOnServer(model);

    return true;
  }

  @override
  void dispose() {
    _profile.close();

    super.dispose();
  }

  static EditProfileBloc of(BuildContext context) =>
      ProviderService.of<EditProfileBloc>(context);
}
