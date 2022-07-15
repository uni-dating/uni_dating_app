import 'package:animated_gesture_detector/animated_gesture_detector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uni_dating_app/models/profile/user.info.model.dart';
import 'package:uni_dating_app/ui/screens/main/profile/profile.bloc.dart';
import 'package:uni_dating_app/ui/screens/profile/profile.edit.dart';
import 'package:uni_dating_app/utils/rx_builder.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _mainInfo(context),
        const SizedBox(height: 23),
        AnimatedGestureDetector(
          onTap: () => ProfileEditScreen.navigate(context),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 28.0),
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 9.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                width: 1,
                color: Colors.black,
              ),
            ),
            child: const Center(
              child: Text(
                'Edit profile',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _mainInfo(BuildContext context) {
    return RxBuilder<UserInfoModel?>(
      stream: ProfileBloc.of(context).user,
      builder: (context, sVariable) {
        if (sVariable.data == null) {
          return const CupertinoActivityIndicator();
        }

        final user = sVariable.data!;

        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 27.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipOval(
                child: SizedBox(
                  height: 122,
                  width: 122,
                  child: Image.network(
                    'https://s.yimg.com/ny/api/res/1.2/xQD.4JGpg6XIJzx.SbQkiA--/YXBwaWQ9aGlnaGxhbmRlcjt3PTY0MDtoPTQ4MA--/https://s.yimg.com/uu/api/res/1.2/Rffcviow.eCHjmEu2msLJg--~B/aD0xNzU3O3c9MjM0MzthcHBpZD15dGFjaHlvbg--/https://media.zenfs.com/en/insider_articles_922/c6ce8d0b9a7b28f9c2dee8171da98b8f',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 28.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  Text(
                    '${user.firstName!} ${user.lastName!}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(user.bio ?? ''),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
