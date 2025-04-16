import 'package:world_news/features/news/domain/models/news.dart';
import 'package:world_news/features/news/domain/repositories/news_repository.dart';

class GetDetailNewsUseCase {
  final NewsRepository newsRepository;

  GetDetailNewsUseCase({required this.newsRepository});

  Future<News> call(String id) async {
    return await newsRepository.getNewsById(id);
  }
}
