import 'package:world_news/core/di/providers/notifier_providers.dart';
import 'package:world_news/core/di/providers/repository_providers.dart';
import 'package:world_news/features/auth/domain/use_cases/get_profile_use_case.dart';
import 'package:world_news/features/auth/domain/use_cases/login_use_case.dart';
import 'package:world_news/features/auth/domain/use_cases/logout_use_case.dart';
import 'package:world_news/features/news/domain/use_cases/comment_news_use_case.dart';
import 'package:world_news/features/news/domain/use_cases/get_detail_news_use_case.dart';
import 'package:world_news/features/news/domain/use_cases/get_news_use_case.dart';
import 'package:world_news/features/news/domain/use_cases/search_news_use_case.dart';

class UseCaseProviders {
  final LoginUseCase loginUseCase;
  final GetProfileUseCase getProfileUseCase;
  final GetNewsUseCase getNewsUseCase;
  final SearchNewsUseCase searchNewsUseCase;
  final GetDetailNewsUseCase getDetailNewsUseCase;
  final AddCommentUseCase addCommentUseCase;
  final LogoutUseCase logoutUseCase;

  UseCaseProviders._({
    required this.loginUseCase,
    required this.getProfileUseCase,
    required this.getNewsUseCase,
    required this.searchNewsUseCase,
    required this.getDetailNewsUseCase,
    required this.addCommentUseCase,
    required this.logoutUseCase,
  });

  factory UseCaseProviders.base(RepositoryProviders repositoryProviders, NotifierProviders notifierProviders) {
    final authNotifier = notifierProviders.authNotifier;
    final authRepository = repositoryProviders.authRepository;
    final newsRepository = repositoryProviders.newsRepository;

    return UseCaseProviders._(
      loginUseCase: LoginUseCase(authRepository: authRepository),
      getProfileUseCase: GetProfileUseCase(authRepository: authRepository),
      getNewsUseCase: GetNewsUseCase(newsRepository: newsRepository),
      searchNewsUseCase: SearchNewsUseCase(newsRepository: newsRepository),
      getDetailNewsUseCase: GetDetailNewsUseCase(newsRepository: newsRepository),
      addCommentUseCase: AddCommentUseCase(authNotifier: authNotifier, newsRepository: newsRepository),
      logoutUseCase: LogoutUseCase(authRepository: authRepository),
    );
  }
}
