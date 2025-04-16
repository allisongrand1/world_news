import 'package:flutter/material.dart';
import 'package:world_news/features/news/domain/models/news.dart';
import 'package:world_news/features/news/presentation/widgets/news_card.dart';

class NewsSuccessView extends StatelessWidget {
  final List<News> news;

  const NewsSuccessView({required this.news, super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
              onChanged: (value) {},
            ),
          ),
          SliverList.builder(
            itemCount: news.length,
            itemBuilder: (BuildContext context, int index) {
              return NewsCard(
                id: news[index].id,
                title: news[index].title,
                description: news[index].description,
                urlToImage: news[index].urlToImage,
              );
            },
          ),
        ],
      ),
    );
  }
}
