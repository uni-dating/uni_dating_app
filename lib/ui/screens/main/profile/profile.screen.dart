import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uni_dating_app/models/news/news.model.dart';
import 'package:uni_dating_app/models/profile/user.info.model.dart';
import 'package:uni_dating_app/utils/rx_builder.dart';

import 'header/profile.header.dart';
import 'item/profile_list.item.dart';
import 'profile.bloc.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _State();
}

class _State extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final list = RxBuilder<List<NewsModel>?>(
      stream: ProfileBloc.of(context).news,
      builder: (context, sVariable) {
        if (sVariable.data == null) {
          return const CupertinoActivityIndicator();
        }

        final unfilteredList = sVariable.data;
        return RxBuilder<UserInfoModel?>(
          stream: ProfileBloc.of(context).user,
          builder: (context, sVariable) {
            if (sVariable.data == null) {
              return const CupertinoActivityIndicator();
            }

            final list = ProfileBloc.of(context).getFilteredList(unfilteredList);
            return Column(
              children: List.generate(
                list!.length,
                    (index) => ProfileListItem(
                  news: list[index],
                ),
              ),
            );
          },
        );
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: .0,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ProfileHeader(),
            list,
          ],
        ),
      ),
    );
  }
}
