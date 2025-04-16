import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_news/features/news/domain/use_cases/comment_news_use_case.dart';
import 'package:world_news/features/news/domain/use_cases/get_detail_news_use_case.dart';
import 'package:world_news/features/news/presentation/blocs/detail_news_bloc/detail_news_events.dart';
import 'package:world_news/features/news/presentation/blocs/detail_news_bloc/detail_news_states.dart';

class DetailNewsBloc extends Bloc<DetailNewsEvents, DetailNewsStates> {
  final GetDetailNewsUseCase getDetailNewsUseCase;
  final AddCommentUseCase addCommentUseCase;

  DetailNewsBloc(this.getDetailNewsUseCase, this.addCommentUseCase) : super(InitDetailNewsState()) {
    on<DetailNewsEvents>(
      (event, emit) =>
          event.map(getDetail: (event) => _getDetail(event, emit), comment: (event) => _addComment(event, emit)),
    );
  }

  Future<void> _getDetail(DetailNewsEvent event, Emitter<DetailNewsStates> emit) async {
    emit(LoadingDetailNewsState());
    try {
      final result = await getDetailNewsUseCase.call(event.id);
      emit(LoadedDetailNewsState(result));
    } catch (e) {
      emit(ErrorDetailNewsState(e.toString()));
    }
  }

  Future<void> _addComment(CommentNewsEvent event, Emitter<DetailNewsStates> emit) async {
    // try {
    //   final result = await addCommentUseCase.call(id: event.id, comment: event.comment);
    //   emit(LoadedDetailNewsState(state));
    // } catch (e) {
    //   emit(ErrorDetailNewsState(e.toString()));
    // }
  }
}
