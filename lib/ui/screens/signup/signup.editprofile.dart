import 'package:animated_gesture_detector/animated_gesture_detector.dart';
import 'package:flutter/material.dart';
import 'package:uni_dating_app/ui/resources/colors.dart';
import 'package:uni_dating_app/ui/screens/main/main_init.screen.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  static const String routeName = '/signup';

  static void navigate(BuildContext context) {
    Navigator.of(context).pushNamed(routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('SignUp screen'),
            const SizedBox(height: 8),
            AnimatedGestureDetector(
              onTap: () => MainInitScreen.navigate(context),
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
                  'Next',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
