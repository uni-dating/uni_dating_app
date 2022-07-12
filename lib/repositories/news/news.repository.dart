import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:uni_dating_app/models/errors/error.dart';
import 'package:uni_dating_app/models/errors/server_errors.dart';
import 'package:uni_dating_app/models/news/news.model.dart';
import 'package:uni_dating_app/models/response.dart';
import 'package:uni_dating_app/utils/provider.service.dart';

import 'network_news.repository.dart';

@immutable
class NewsRepository {
  NewsRepository(this._networkRepo) : super();

  final NetworkNewsRepository _networkRepo;

  final _news = BehaviorSubject<List<NewsModel>?>.seeded(null);
  ValueStream<List<NewsModel>?> get news => _news;

  Future<Response<bool>> setNewsStream() async {
    try {
      _networkRepo.getNewsStream().listen((list) {
        updateList(list ?? []);
      });

      return const Response.value(true);
    } on ServerError catch (e) {
      return Response.error(BaseError.fromDynamic(e));
    }
  }

  Future<Response<List<NewsModel>>> getLeaderBoard() async {
    try {
      final info = await _networkRepo.getNews();

      if (info != null) {
        updateList(info);
      }

      return Response.value(info);
    } on ServerError catch (e) {
      return Response.error(BaseError.fromDynamic(e));
    }
  }

  Future<Response<bool>> addLeader(NewsModel model) async {
    try {
      final info = await _networkRepo.addNews(model);

      return const Response.value(true);
    } on ServerError catch (e) {
      return Response.error(BaseError.fromDynamic(e));
    }
  }

  void updateList(List<NewsModel> list) {
    _news.add(list);
  }

  void dispose() {
    _news.close();
  }

  static NewsRepository of(BuildContext context) =>
      ProviderService.of<NewsRepository>(context);
}
