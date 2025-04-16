import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_news/features/news/domain/use_cases/get_news_use_case.dart';
import 'package:world_news/features/news/domain/use_cases/logout_use_case.dart';
import 'package:world_news/features/news/domain/use_cases/search_news_use_case.dart';
import 'package:world_news/features/news/presentation/blocs/news_bloc/news_events.dart';
import 'package:world_news/features/news/presentation/blocs/news_bloc/news_states.dart';

class NewsBloc extends Bloc<NewsEvents, NewsStates> {
  final LogoutUseCase logoutUseCase;
  final GetNewsUseCase getNewsUseCase;
  final SearchNewsUseCase searchNewsUseCase;

  NewsBloc(this.logoutUseCase, this.getNewsUseCase, this.searchNewsUseCase) : super(InitNewsState()) {
    on<NewsEvents>(
      (event, emit) => event.map(
        getNews: (event) => _getNews(event, emit),
        logout: (event) => _logout(event, emit),
        searchNews: (event) => _search(event, emit),
      ),
    );
  }

  Future<void> _getNews(GetNewsEvent event, Emitter<NewsStates> emit) async {
    emit(LoadingNewsState());

    try {
      final news = await getNewsUseCase.call();

      emit(LoadedNewsState(news));
    } catch (e) {
      emit(ErrorNewsState(e.toString()));
    }
  }

  Future<void> _logout(LogoutEvent event, Emitter<NewsStates> emit) async {
    await logoutUseCase.call();

    emit(InitNewsState());
  }

  Future<void> _search(SearchNewsEvent event, Emitter<NewsStates> emit) async {
    emit(LoadingNewsState());

    try {
      final news = await searchNewsUseCase.call(event.query);

      emit(LoadedNewsState(news));
    } catch (e) {
      emit(ErrorNewsState(e.toString()));
    }
  }
}
