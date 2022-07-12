import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:animated_gesture_detector/animated_gesture_detector.dart';
import 'package:flutter/material.dart';
import 'package:uni_dating_app/ui/resources/dimens.dart';

import 'main.bloc.dart';
import 'news_list/news_init.screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var _bottomNavIndex = 0;
  final newPostController = TextEditingController();
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => _displayTextInputDialog(MainBloc.of(context)),
        child: const Icon(Icons.add, color: Colors.black),
        backgroundColor: Colors.yellow,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: const [Icons.home, Icons.person],
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        blurEffect: true,
        onTap: (index) {
          pageController.animateToPage(
            index,
            duration: Dimens.fastDuration,
            curve: Curves.easeIn,
          );
          setState(() => _bottomNavIndex = index);
        },
        //other params
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: const [
          NewsInitScreen(),
          Center(child: Text('Profile')),
        ],
      ),
    );
  }

  Future<void> _displayTextInputDialog(MainBloc bloc) async {
    newPostController.clear();

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(24.0),
            ),
          ),
          title: const Text('Create a new post'),
          content: IntrinsicHeight(
            child: Row(
              children: [
                Expanded(
                  flex: 20,
                  child: TextField(
                    onChanged: (value) {},
                    controller: newPostController,
                    decoration: InputDecoration(
                      hintText: 'Tap here...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                    ),
                  ),
                ),
                const Spacer(),
                AnimatedGestureDetector(
                  onTap: () {
                    bloc.uploadNewPost(newPostController.text);
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
