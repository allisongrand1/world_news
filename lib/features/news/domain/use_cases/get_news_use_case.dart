import 'package:world_news/features/news/domain/models/news.dart';
import 'package:world_news/features/news/domain/repositories/news_repository.dart';

class GetNewsUseCase {
  final NewsRepository newsRepository;

  GetNewsUseCase({required this.newsRepository});

  Future<List<News>> call() async {
    return await newsRepository.getNews();
  }
}
