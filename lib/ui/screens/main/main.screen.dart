import 'package:animated_gesture_detector/animated_gesture_detector.dart';
import 'package:flutter/material.dart';
import 'package:uni_dating_app/ui/resources/colors.dart';
import 'package:uni_dating_app/utils/rx_builder.dart';

import 'main.bloc.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final value = RxBuilder<int>(
      stream: MainBloc.of(context).variable,
      builder: (context, sVariable) {
        if (sVariable.data == null) {
          return const SizedBox();
        }

        return Text(sVariable.data.toString());
      },
    );

    final button = AnimatedGestureDetector(
      onTap: () => MainBloc.of(context).updateValue(),
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
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Main screen'),
            const SizedBox(height: 8),
            value,
            const SizedBox(height: 8),
            button,
          ],
        ),
      ),
    );
  }


}
