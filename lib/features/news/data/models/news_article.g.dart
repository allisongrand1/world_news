// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NewsArticle _$NewsArticleFromJson(Map<String, dynamic> json) => _NewsArticle(
  source: SourceArticle.fromJson(json['source'] as Map<String, dynamic>),
  author: json['author'] as String? ?? '',
  title: json['title'] as String? ?? '',
  description: json['description'] as String? ?? '',
  url: json['url'] as String? ?? '',
  urlToImage: json['urlToImage'] as String? ?? '',
  publishedAt: json['publishedAt'] as String? ?? '',
  content: json['content'] as String? ?? '',
);

Map<String, dynamic> _$NewsArticleToJson(_NewsArticle instance) =>
    <String, dynamic>{
      'source': instance.source,
      'author': instance.author,
      'title': instance.title,
      'description': instance.description,
      'url': instance.url,
      'urlToImage': instance.urlToImage,
      'publishedAt': instance.publishedAt,
      'content': instance.content,
    };
