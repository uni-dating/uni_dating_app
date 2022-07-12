import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uni_dating_app/models/news/news.model.dart';

class NewsListItem extends StatelessWidget {
  const NewsListItem({Key? key, required this.news}) : super(key: key);

  final NewsModel news;

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat('kk:mm').format(news.timePosted);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
      child: Column(
        children: [
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ClipOval(
                  child: Container(
                    //color: Colors.grey,
                    width: 48,
                    height: 48,
                    child: Image.network(news.userPhoto, fit: BoxFit.cover),
                  ),
                ),
                const SizedBox(width: 18),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        news.userName,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
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
