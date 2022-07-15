import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:uni_dating_app/models/errors/error.dart';
import 'package:uni_dating_app/models/errors/server_errors.dart';
import 'package:uni_dating_app/models/profile/user.info.model.dart';
import 'package:uni_dating_app/models/response.dart';
import 'package:uni_dating_app/repositories/users/network_users.repository.dart';
import 'package:uni_dating_app/services/preferences/preference.service.dart';
import 'package:uni_dating_app/ui/resources/shared_preferences.constants.dart';
import 'package:uni_dating_app/utils/provider.service.dart';

@immutable
class UsersRepository {
  UsersRepository(this._networkRepo) : super();

  final NetworkUsersRepository _networkRepo;

  final _user = BehaviorSubject<UserInfoModel?>.seeded(null);

  ValueStream<UserInfoModel?> get user => _user;

  Future<Response<UserInfoModel?>> getUser(String? id) async {
    try {
      final info = await _networkRepo.getUser(id);

      if (info != null) {
        updateUser(info);
      }

      return Response.value(info);
    } on ServerError catch (e) {
      return Response.error(BaseError.fromDynamic(e));
    }
  }

  Future<Response<bool>> addUser(UserInfoModel model) async {
    try {
      final info = await _networkRepo.addUser(model);

      if (info) {
        updateUser(model);
      }

      return const Response.value(true);
    } on ServerError catch (e) {
      return Response.error(BaseError.fromDynamic(e));
    }
  }

  void updateUser(UserInfoModel? model) {
    _user.add(model);
    saveLocalUserId(model?.id);
  }

  Future<void> saveLocalUserId(String? userId) async {
    if (userId == null) return;
    await PreferenceService()
        .sharedPref
        .setString(SharedConstants.userId, userId);
  }

  Future<String?> getLocalUserId() async {
    final result =
        PreferenceService().sharedPref.getString(SharedConstants.userId);

    return result;
  }

  Future<bool> isUserAlreadyExists(String email) async {
    try {
      final info = await _networkRepo.isUserAlreadyExists(email);

      return info;
    } on ServerError catch (e) {
      return false;
    }
  }

  void dispose() {
    _user.close();
  }

  static UsersRepository of(BuildContext context) =>
      ProviderService.of<UsersRepository>(context);
}
