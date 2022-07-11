import 'package:animated_gesture_detector/animated_gesture_detector.dart';
import 'package:flutter/material.dart';
import 'package:uni_dating_app/ui/resources/colors.dart';
import 'package:uni_dating_app/utils/rx_builder.dart';

import 'news.bloc.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _State();
}

class _State extends State<NewsScreen> {
  var _bottomNavIndex = 0;
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final value = RxBuilder<int>(
      stream: NewsBloc.of(context).variable,
      builder: (context, sVariable) {
        if (sVariable.data == null) {
          return const SizedBox();
        }

        return Text(sVariable.data.toString());
      },
    );

    final button = AnimatedGestureDetector(
      onTap: () => NewsBloc.of(context).updateValue(),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: ColorsResource.primary,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        child: const Text(
          'Change string',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Main',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: .0,
        automaticallyImplyLeading: false,
      ),
      body: const Center(
        child: Text(
          'Popular',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
