import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:world_news/features/news/data/models/news_article.dart';

part 'news_response.freezed.dart';
part 'news_response.g.dart';

@freezed
abstract class NewsResponse with _$NewsResponse {
  const factory NewsResponse({
    @Default('') String status,
    @Default(0) int totalResults,
    @Default(<NewsArticle>[]) List<NewsArticle> articles,
  }) = _NewsResponse;

  factory NewsResponse.fromJson(Map<String, dynamic> json) => _$NewsResponseFromJson(json);
}
