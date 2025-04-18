import 'package:json_annotation/json_annotation.dart' as j;
import 'package:world_news/features/news/domain/models/comment.dart';

part 'news.g.dart';

@j.JsonSerializable()
class News {
  final int id;
  final String name;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final DateTime publishedAt;
  final String content;
  final List<Comment> comments;

  News({
    required this.id,
    required this.name,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
    required this.comments,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    return _$NewsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$NewsToJson(this);

  News.empty()
    : id = 1,
      name = '',
      author = '',
      title = '',
      description = '',
      url = '',
      urlToImage = '',
      publishedAt = DateTime.now(),
      content = '',
      comments = [];

  News copyWith(
    int? id,
    String? name,
    String? author,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    DateTime? publishedAt,
    String? content,
    List<Comment>? comments,
  ) {
    return News(
      id: id ?? this.id,
      name: name ?? this.name,
      author: author ?? this.author,
      title: title ?? this.title,
      description: description ?? this.description,
      url: url ?? this.url,
      urlToImage: urlToImage ?? this.urlToImage,
      publishedAt: publishedAt ?? this.publishedAt,
      content: content ?? this.content,
      comments: comments ?? this.comments,
    );
  }
}
