
import 'package:flutter/material.dart';
import 'package:uni_dating_app/models/news/news.model.dart';
import 'package:uni_dating_app/repositories/news/news.repository.dart';
import 'package:uni_dating_app/utils/bloc.dart';
import 'package:uni_dating_app/utils/provider.service.dart';
import 'package:uuid/uuid.dart';

class MainBloc extends Bloc {
  MainBloc(this.newsRepository);

  final NewsRepository newsRepository;

  Future<void> uploadNewPost(String text) async {
    await newsRepository.addLeader(
      NewsModel(
        id: const Uuid().v1(),
        userId: '-1',
        title: '',
        description: text,
        timePosted: DateTime.now(),
      ),
    );
  }

  static MainBloc of(BuildContext context) =>
      ProviderService.of<MainBloc>(context);
}
