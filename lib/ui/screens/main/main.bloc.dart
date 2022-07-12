
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
        userName: 'My new name',
        userPhoto: 'https://s.yimg.com/ny/api/res/1.2/xQD.4JGpg6XIJzx.SbQkiA--/YXBwaWQ9aGlnaGxhbmRlcjt3PTY0MDtoPTQ4MA--/https://s.yimg.com/uu/api/res/1.2/Rffcviow.eCHjmEu2msLJg--~B/aD0xNzU3O3c9MjM0MzthcHBpZD15dGFjaHlvbg--/https://media.zenfs.com/en/insider_articles_922/c6ce8d0b9a7b28f9c2dee8171da98b8f',
        title: '',
        description: text,
        timePosted: DateTime.now(),
      ),
    );
  }

  static MainBloc of(BuildContext context) =>
      ProviderService.of<MainBloc>(context);
}
