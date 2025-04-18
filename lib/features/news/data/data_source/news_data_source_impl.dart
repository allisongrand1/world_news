import 'package:dio/dio.dart';
import 'package:world_news/core/errors/exception/app_exception.dart';
import 'package:world_news/core/errors/exception/network_exception.dart';
import 'package:world_news/core/errors/exception/server_exception.dart';
import 'package:world_news/features/news/data/data_source/endpoint.dart';
import 'package:world_news/features/news/data/data_source/news_data_source.dart';
import 'package:world_news/features/news/data/mappers/news_response_mapper.dart';
import 'package:world_news/features/news/data/models/news_response.dart';
import 'package:world_news/features/news/domain/models/news.dart';

class NewsDataSourceImpl extends NewsDataSource {
  final Dio dio;

  NewsDataSourceImpl({required this.dio});

  @override
  Future<List<News>> getNews() async {
    final query = {'q': 'technology', 'pageSize': 20, 'page': 1};

    try {
      final response = await dio.get(everything, queryParameters: query);
      final articles = NewsResponse.fromJson(response.data).articles;
      return articles.map((news) => news.toDomain(articles.indexOf(news))).toList();
    } on DioException catch (e) {
      throw handleException(e);
    }
  }

  AppException handleException(DioException exception) {
    final response = exception.response!;

    final error = response.data;

    if (response.statusCode != 400) {
      throw NetworkException(message: error);
    }

    throw ServerException(message: exception.response!.data.toString());
  }
}
