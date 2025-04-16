// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comment _$CommentFromJson(Map<String, dynamic> json) => Comment(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  comment: json['comment'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
  newsId: json['newsId'] as String,
);

Map<String, dynamic> _$CommentToJson(Comment instance) => <String, dynamic>{
  'id': instance.id,
  'newsId': instance.newsId,
  'name': instance.name,
  'comment': instance.comment,
  'createdAt': instance.createdAt.toIso8601String(),
};
