import 'package:world_news/features/auth/data/models/profile.dart';
import 'package:world_news/features/auth/domain/repositories/auth_repository.dart';

class GetProfileUseCase {
  final AuthRepository authRepository;

  GetProfileUseCase({required this.authRepository});

  Future<Profile> call() async {
    return await authRepository.getProfile();
  }
}
