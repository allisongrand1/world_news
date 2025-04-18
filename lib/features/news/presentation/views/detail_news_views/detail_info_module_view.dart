import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:world_news/features/news/domain/models/news.dart';

class DetailInfoModuleView extends StatelessWidget {
  final News news;

  const DetailInfoModuleView({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (news.urlToImage.isNotEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: SizedBox(
              height: 350,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(news.urlToImage, fit: BoxFit.cover),
              ),
            ),
          ),
        Padding(padding: const EdgeInsets.only(bottom: 8), child: Text(news.title, style: textTheme.headlineSmall)),
        Padding(
          padding: const EdgeInsets.only(bottom: 32),
          child: Text(DateFormat('MMM d, y').format(news.publishedAt), style: textTheme.labelMedium),
        ),

        Padding(padding: const EdgeInsets.only(bottom: 32), child: Text(news.description, style: textTheme.bodyLarge)),
      ],
    );
  }
}
