import 'package:world_news/core/common/notifier/auth_notifier.dart';
import 'package:world_news/features/auth/data/data_base/auth_database.dart';
import 'package:world_news/features/auth/data/mappers/profile_table_data_mapper.dart';
import 'package:world_news/features/auth/data/models/profile.dart';
import 'package:world_news/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthDataBase authDataBase;
  final AuthNotifier authNotifier;

  AuthRepositoryImpl({required this.authDataBase, required this.authNotifier});

  @override
  Future<Profile> getProfile() async {
    final savedProfile = await authDataBase.getProfile();

    if (savedProfile.isEmpty) {
      authNotifier.init(profile: authNotifier.profile, isAuthenticated: false);

      return authNotifier.profile;
    }

    final profile = savedProfile.first.fromSql();

    authNotifier.init(profile: profile, isAuthenticated: true);

    return profile;
  }

  @override
  Future<bool> login({required String login, required String password}) async {
    try {
      await authDataBase.createProfile(login: login, password: password);

      authNotifier.login(Profile(login: login, password: password));

      return authNotifier.isAuthenticated;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> logout() async {
    await authDataBase.deleteProfile();

    authNotifier.logout();
  }
}
