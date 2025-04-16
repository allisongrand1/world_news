import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:world_news/core/router/routes.dart';
import 'package:world_news/features/news/presentation/widgets/image_news.dart';

class NewsCard extends StatelessWidget {
  final String id;
  final String title;
  final String description;
  final String urlToImage;

  const NewsCard({
    super.key,
    required this.title,
    required this.description,
    required this.urlToImage,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return InkWell(
      onTap: () {
        context.goNamed(AppRoutes.detailNews.name, queryParameters: {'id': id});
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 4, top: 4),
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageNews(urlToImage: urlToImage),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
                child: Text(title, style: textTheme.titleMedium),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 16, left: 16, right: 16),
                child: Text(
                  description,
                  style: textTheme.bodySmall,
                  textAlign: TextAlign.justify,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
