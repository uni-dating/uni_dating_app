import 'package:flutter/material.dart';
import 'package:uni_dating_app/initializer.dart';
import 'package:uni_dating_app/ui/app.dart';

void main() async {
  await preInitializer();

  runApp(const App());
}