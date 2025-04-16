import 'package:world_news/features/auth/data/models/profile.dart';

abstract class AuthRepository {
  Future<Profile> getProfile();

  Future<bool> login({required String login, required String password});

  Future<void> logout();
}
