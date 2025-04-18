import 'package:flutter/material.dart';
import 'package:world_news/features/news/domain/models/news.dart';
import 'package:world_news/features/news/presentation/widgets/news_card.dart';

class NewsSuccessView extends StatelessWidget {
  final List<News> news;

  const NewsSuccessView({required this.news, super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: news.length,
      itemBuilder: (BuildContext context, int index) {
        return NewsCard(
          id: news[index].id,
          title: news[index].title,
          description: news[index].description,
          urlToImage: news[index].urlToImage,
          lengthComments: news[index].comments.length,
          publishedAt: news[index].publishedAt,
        );
      },
    );
  }
}
