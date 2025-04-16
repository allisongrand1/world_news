import 'package:world_news/core/di/providers/use_case_providers.dart';
import 'package:world_news/features/auth/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:world_news/features/news/presentation/blocs/detail_news_bloc/detail_news_bloc.dart';
import 'package:world_news/features/news/presentation/blocs/news_bloc/news_bloc.dart';

class BlocProviders {
  final AuthBloc authBloc;
  final NewsBloc newsBloc;
  final DetailNewsBloc detailNewsBloc;

  const BlocProviders({required this.authBloc, required this.newsBloc, required this.detailNewsBloc});

  factory BlocProviders.base(UseCaseProviders useCaseProviders) {
    return BlocProviders(
      authBloc: AuthBloc(useCaseProviders.loginUseCase),
      newsBloc: NewsBloc(
        useCaseProviders.logoutUseCase,
        useCaseProviders.getNewsUseCase,
        useCaseProviders.searchNewsUseCase,
      ),
      detailNewsBloc: DetailNewsBloc(useCaseProviders.getDetailNewsUseCase, useCaseProviders.addCommentUseCase),
    );
  }
}
