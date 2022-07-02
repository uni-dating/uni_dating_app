import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:uni_dating_app/models/profile/profile.model.dart';
import 'package:uni_dating_app/utils/bloc.dart';
import 'package:uni_dating_app/utils/provider.service.dart';

class EditProfileBloc extends Bloc {
  final _profile = BehaviorSubject<ProfileModel?>.seeded(null);

  ValueStream<ProfileModel?> get profile => _profile;

  ///TODO(Andrii): get profile from backend
  Future<void> getProfile() async {
    _profile.add(
      const ProfileModel(
        id: 0,
        username: 'My user name',
        school: '1',
      ),
    );
  }

  Future<void> updateUsername(String username) async {
    _profile.add(_profile.value?.copyWith(username: username));
  }

  @override
  void dispose() {
    _profile.close();

    super.dispose();
  }

  static EditProfileBloc of(BuildContext context) =>
      ProviderService.of<EditProfileBloc>(context);
}
