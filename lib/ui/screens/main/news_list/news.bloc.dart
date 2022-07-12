import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:uni_dating_app/models/news/news.model.dart';
import 'package:uni_dating_app/repositories/news/news.repository.dart';
import 'package:uni_dating_app/utils/bloc.dart';
import 'package:uni_dating_app/utils/provider.service.dart';

class NewsBloc extends Bloc {
  NewsBloc(this.newsRepository);

  final NewsRepository newsRepository;

  ValueStream<List<NewsModel>?> get news => newsRepository.news;

  Future<void> setNewsStream() async {
    await newsRepository.setNewsStream();
  }

  static NewsBloc of(BuildContext context) =>
      ProviderService.of<NewsBloc>(context);
}
