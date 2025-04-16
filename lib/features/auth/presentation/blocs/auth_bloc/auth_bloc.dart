import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_news/features/auth/domain/use_cases/login_use_case.dart';
import 'package:world_news/features/auth/presentation/blocs/auth_bloc/auth_events.dart';
import 'package:world_news/features/auth/presentation/blocs/auth_bloc/auth_states.dart';

class AuthBloc extends Bloc<AuthEvents, AuthStates> {
  final LoginUseCase loginUseCase;

  AuthBloc(this.loginUseCase) : super(InitAuthState()) {
    on<AuthEvents>((event, emit) => event.map(login: (event) => _login(event, emit)));
  }

  Future<void> _login(LoginEvent event, Emitter<AuthStates> emit) async {
    emit(LoadingAuthState());
    try {
      await loginUseCase.call(event.login, event.password);

      emit(LoadedAuthState());
    } catch (e) {
      emit(ErrorAuthState(message: e.toString()));
    }
  }
}
