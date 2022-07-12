import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uni_dating_app/models/news/news.model.dart';

class ProfileListItem extends StatelessWidget {
  const ProfileListItem({Key? key, required this.news}) : super(key: key);

  final NewsModel news;

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat('kk:mm').format(news.timePosted);

    return Padding(
      padding: const EdgeInsets.only(
        left: 30.0,
        right: 30.0,
        bottom: 8.0,
        top: 21.0,
      ),
      child: Column(
        children: [
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(width: 18),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 8),
                      Text(news.description),
                    ],
                  ),
                ),
                const Spacer(),
                Text(formattedDate),
              ],
            ),
          ),
          const SizedBox(height: 22.0),
          Container(
            height: 1,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
