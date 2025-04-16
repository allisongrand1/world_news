// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NewsResponse _$NewsResponseFromJson(Map<String, dynamic> json) =>
    _NewsResponse(
      status: json['status'] as String? ?? '',
      totalResults: (json['totalResults'] as num?)?.toInt() ?? 0,
      articles:
          (json['articles'] as List<dynamic>?)
              ?.map((e) => NewsArticle.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <NewsArticle>[],
    );

Map<String, dynamic> _$NewsResponseToJson(_NewsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'totalResults': instance.totalResults,
      'articles': instance.articles,
    };
