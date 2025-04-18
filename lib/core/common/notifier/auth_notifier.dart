import 'package:flutter/foundation.dart';
import 'package:world_news/features/auth/data/models/profile.dart';

class AuthNotifier extends ChangeNotifier {
  bool? _isAuthenticated;
  Profile _profile = Profile.empty();

  bool get isAuthenticated => _isAuthenticated == true;

  bool get isAuthLoading => _isAuthenticated == null;

  Profile get profile => _profile;

  void init({required Profile profile, required bool isAuthenticated}) {
    _isAuthenticated = isAuthenticated;
    _profile = profile;

    notifyListeners();
  }

  void login(Profile profile) {
    _isAuthenticated = true;

    _profile = profile;

    notifyListeners();
  }

  void logout() {
    _isAuthenticated = false;

    _profile = Profile.empty();

    notifyListeners();
  }
}
