import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:uni_dating_app/utils/bloc.dart';
import 'package:uni_dating_app/utils/provider.service.dart';

class MainBloc extends Bloc {

final _variable = BehaviorSubject<int>.seeded(0);

  ValueStream<int> get variable =>
      _variable;

  void updateValue() {
    _variable.add(Random().nextInt(10000));
  }



@override
void dispose() {
  _variable.close();

  super.dispose();
}

  static MainBloc of(BuildContext context) =>
      ProviderService.of<MainBloc>(context);
}
