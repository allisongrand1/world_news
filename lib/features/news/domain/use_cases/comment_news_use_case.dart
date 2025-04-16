import 'package:world_news/core/common/notifier/auth_notifier.dart';
import 'package:world_news/features/news/domain/repositories/news_repository.dart';

class AddCommentUseCase {
  final NewsRepository newsRepository;
  final AuthNotifier authNotifier;

  AddCommentUseCase({required this.authNotifier, required this.newsRepository});

  Future<void> call({required String id, required String comment}) async {
    final profile = authNotifier.profile;

    await newsRepository.addCommentToNews(newsId: id, comment: comment, name: profile.login);
  }
}
