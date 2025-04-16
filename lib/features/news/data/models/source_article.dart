import 'package:freezed_annotation/freezed_annotation.dart';

part 'source_article.freezed.dart';
part 'source_article.g.dart';

@freezed
abstract class SourceArticle with _$SourceArticle {
  const factory SourceArticle({@Default('') String id, @Default('') String name}) = _SourceArticle;

  factory SourceArticle.fromJson(Map<String, dynamic> json) => _$SourceArticleFromJson(json);
}
