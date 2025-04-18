import 'package:world_news/features/news/data/models/news_article.dart';
import 'package:world_news/features/news/data/models/news_response.dart';
import 'package:world_news/features/news/domain/models/news.dart';

extension NewsResponseMapper on NewsResponse {
  List<News> toDomain() {
    return articles.map((news) => news.toDomain(articles.indexOf(news))).toList();
  }
}

extension NewsArticleMapper on NewsArticle {
  News toDomain(int id) {
    return News(
      id: id,
      author: author,
      name: source.name,
      title: title,
      description: description,
      url: url,
      urlToImage: urlToImage,
      publishedAt: DateTime.parse(publishedAt),
      content: content,
      comments: [],
    );
  }
}
