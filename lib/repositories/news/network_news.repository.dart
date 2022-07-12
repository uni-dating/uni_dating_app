import 'dart:convert';

import 'package:uni_dating_app/models/news/news.model.dart';
import 'package:uni_dating_app/repositories/base/remote_realtime.repository.dart';
import 'package:uni_dating_app/repositories/base/remote_static.repository.dart';

/// Network implementation of feed repository.
class NetworkNewsRepository {
  final _repo = RemoteRealtimeRepository();

  Stream<List<NewsModel>?> getNewsStream() {
    return _repo.getRef('news').onValue.map((event) {
      //ignore: avoid_dynamic_calls
      final parsedList = jsonDecode(jsonEncode(event.snapshot.value))?.values.toList() as List<dynamic>?;

      //ignore: avoid_dynamic_calls
      final result = <NewsModel>[];

      if(parsedList == null) return result;
      //ignore: avoid_dynamic_calls
      for (final e in parsedList) {
        result.add(NewsModel.fromJson(e as Map<String, dynamic>));
      }

      return result;
    });
  }
  Future<List<NewsModel>?> getNews() async {
    final response = await _repo.getRef('rooms').get();

    //ignore: avoid_dynamic_calls
    final parsedList = jsonDecode(jsonEncode(response.value)).values.toList() as List<dynamic>;

    //ignore: avoid_dynamic_calls
    final result = <NewsModel>[];

    //ignore: avoid_dynamic_calls
    for (final e in parsedList) {
      result.add(NewsModel.fromJson(e as Map<String, dynamic>));
    }

    return result;
  }


  Future<bool> addNews(NewsModel model) async {
    final response = await _repo.getRef('news/${model.id}').update(model.toJson());

    return true;
  }
}
