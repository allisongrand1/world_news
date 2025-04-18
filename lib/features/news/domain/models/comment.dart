import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:json_annotation/json_annotation.dart' as j;

part 'comment.g.dart';

@j.JsonSerializable()
class Comment {
  final int id;
  final int newsId;
  final String name;
  final String comment;
  final DateTime createdAt;

  Comment({required this.id, required this.name, required this.comment, required this.createdAt, required this.newsId});

  factory Comment.fromJson(Map<String, dynamic> json) => _$CommentFromJson(json);

  Map<String, dynamic> toJson() => _$CommentToJson(this);
}

class CommentConverter extends TypeConverter<Comment, String>
    with JsonTypeConverter2<Comment, String, Map<String, Object?>> {
  const CommentConverter();

  @override
  Comment fromSql(String fromDb) {
    return fromJson(json.decode(fromDb) as Map<String, dynamic>);
  }

  @override
  String toSql(Comment value) {
    return json.encode(toJson(value));
  }

  @override
  Comment fromJson(Map<String, Object?> json) {
    return Comment.fromJson(json);
  }

  @override
  Map<String, Object?> toJson(Comment value) {
    return value.toJson();
  }
}
