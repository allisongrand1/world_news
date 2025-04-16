import 'package:world_news/features/auth/domain/repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository authRepository;

  LoginUseCase({required this.authRepository});

  Future<bool> call(String login, String password) async {
    try {
      return await authRepository.login(login: login, password: password);
    } catch (e) {
      return false;
    }
  }
}
