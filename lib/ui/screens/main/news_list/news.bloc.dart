import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:uni_dating_app/utils/bloc.dart';
import 'package:uni_dating_app/utils/provider.service.dart';

class NewsBloc extends Bloc {
  final _variable = BehaviorSubject<int>.seeded(0);

  ValueStream<int> get variable => _variable;

  void updateValue() {
    _variable.add(Random().nextInt(10000));
  }

  Future<void> uploadNewPost(String text) async {
    return;
  }

  @override
  void dispose() {
    _variable.close();

    super.dispose();
  }

  static NewsBloc of(BuildContext context) =>
      ProviderService.of<NewsBloc>(context);
}
