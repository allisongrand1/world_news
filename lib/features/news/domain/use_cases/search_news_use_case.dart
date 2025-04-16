import 'package:world_news/features/news/domain/models/news.dart';
import 'package:world_news/features/news/domain/repositories/news_repository.dart';

class SearchNewsUseCase {
  final NewsRepository newsRepository;

  SearchNewsUseCase({required this.newsRepository});

  Future<List<News>> call(String query) async {
    return await newsRepository.searchByQuery(query);
  }
}
