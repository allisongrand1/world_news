sealed class AuthEvents {
  static AuthEvents login({required String login, required String password}) =>
      LoginEvent(login: login, password: password);
}

class LoginEvent extends AuthEvents {
  final String login;
  final String password;

  LoginEvent({required this.login, required this.password});
}

extension AuthEventsExtension<T> on AuthEvents {
  T map({required T Function(LoginEvent) login}) {
    return switch (this) {
      LoginEvent event => login(event),
    };
  }
}
