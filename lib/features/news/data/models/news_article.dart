import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:world_news/features/news/data/models/source_article.dart';

part 'news_article.freezed.dart';
part 'news_article.g.dart';

@freezed
abstract class NewsArticle with _$NewsArticle {
  const factory NewsArticle({
    required SourceArticle source,
    @Default('') String author,
    @Default('') String title,
    @Default('') String description,
    @Default('') String url,
    @Default('') String urlToImage,
    @Default('') String publishedAt,
    @Default('') String content,
  }) = _NewsArticle;

  factory NewsArticle.fromJson(Map<String, dynamic> json) => _$NewsArticleFromJson(json);
}
