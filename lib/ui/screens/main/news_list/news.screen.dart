import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uni_dating_app/models/news/news.model.dart';
import 'package:uni_dating_app/utils/rx_builder.dart';

import 'item/news_list.item.dart';
import 'news.bloc.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _State();
}

class _State extends State<NewsScreen> {
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final list = RxBuilder<List<NewsModel>?>(
      stream: NewsBloc.of(context).news,
      builder: (context, sVariable) {
        if (sVariable.data == null) {
          return const CupertinoActivityIndicator();
        }

        return SingleChildScrollView(
          child: Column(
            children: List.generate(
              sVariable.data!.length,
              (index) => NewsListItem(
                news: sVariable.data![index],
              ),
            ),
          ),
        );
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Main',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: .0,
        automaticallyImplyLeading: false,
      ),
      body: list,
    );
  }
}
