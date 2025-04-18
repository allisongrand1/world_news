import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:world_news/core/router/routes.dart';
import 'package:world_news/features/news/presentation/widgets/image_news.dart';

class NewsCard extends StatelessWidget {
  final int id;
  final String title;
  final String description;
  final String urlToImage;
  final int lengthComments;
  final DateTime publishedAt;

  const NewsCard({
    super.key,
    required this.title,
    required this.description,
    required this.urlToImage,
    required this.id,
    required this.lengthComments,
    required this.publishedAt,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return InkWell(
      onTap: () => context.pushNamed(AppRoutes.detailNews.name, pathParameters: {'id': id.toString()}),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title, style: textTheme.titleMedium, maxLines: 2, overflow: TextOverflow.ellipsis),
                        const SizedBox(height: 8),
                        Text(description, style: textTheme.bodySmall, maxLines: 2, overflow: TextOverflow.ellipsis),
                        const SizedBox(height: 8),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [SizedBox(width: 100, height: 80, child: ImageNews(urlToImage: urlToImage))],
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(DateFormat('MMM d, y').format(publishedAt), style: textTheme.labelMedium),
                  InkWell(
                    onTap:
                        () => context.pushNamed(
                          AppRoutes.detailNews.name,
                          pathParameters: {'id': id.toString()},
                          extra: true,
                        ),
                    child: Row(
                      children: [
                        const Icon(Icons.mode_comment_rounded, size: 14),
                        const SizedBox(width: 4),
                        Text('$lengthComments', style: textTheme.labelMedium),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
