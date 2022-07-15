import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:uni_dating_app/models/news/news.model.dart';
import 'package:uni_dating_app/models/profile/user.info.model.dart';
import 'package:uni_dating_app/repositories/news/news.repository.dart';
import 'package:uni_dating_app/repositories/users/users.repository.dart';
import 'package:uni_dating_app/utils/bloc.dart';
import 'package:uni_dating_app/utils/provider.service.dart';

class ProfileBloc extends Bloc {
  ProfileBloc(this.newsRepository, this.usersRepository);

  final NewsRepository newsRepository;
  final UsersRepository usersRepository;

  ValueStream<List<NewsModel>?> get news => newsRepository.news;
  ValueStream<UserInfoModel?> get user => usersRepository.user;

  Future<void> setNewsStream() async {
    await newsRepository.setNewsStream();
  }

  List<NewsModel>? getFilteredList(List<NewsModel>? list) {
    return list?.where((element) => element.userId == user.value?.id).toList();
  }

  static ProfileBloc of(BuildContext context) =>
      ProviderService.of<ProfileBloc>(context);
}
