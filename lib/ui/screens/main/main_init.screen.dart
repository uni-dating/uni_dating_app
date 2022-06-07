import 'package:animated_gesture_detector/animated_gesture_detector.dart';
import 'package:flutter/material.dart';
import 'package:uni_dating_app/ui/resources/colors.dart';
import 'package:uni_dating_app/ui/screens/main/main.bloc.dart';
import 'package:uni_dating_app/ui/screens/main/main.screen.dart';
import 'package:uni_dating_app/utils/bloc.dart';

class MainInitScreen extends StatelessWidget {
  const MainInitScreen({Key? key}) : super(key: key);

  static const String routeName = '/main';

  static void navigate(BuildContext context) {
    Navigator.of(context).pushNamed(routeName);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      blocBuilder: () {
        return MainBloc();
      },
      builder: (context, bloc) {
        return const MainScreen();
      },
    );
  }
}
