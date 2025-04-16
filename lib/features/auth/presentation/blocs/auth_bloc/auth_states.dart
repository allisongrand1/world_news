sealed class AuthStates {
  static AuthStates init() => InitAuthState();
  static AuthStates loading() => InitAuthState();
  static AuthStates loaded() => InitAuthState();
  static AuthStates error() => InitAuthState();
}

class InitAuthState extends AuthStates {}

class LoadingAuthState extends AuthStates {}

class LoadedAuthState extends AuthStates {}

class ErrorAuthState extends AuthStates {
  final String? message;

  ErrorAuthState({this.message});
}

extension AuthStatesExtension<T> on AuthStates {
  T mapOrElse({
    required T Function() orElse,
    T Function()? loading,
    T Function()? loaded,
    T Function(ErrorAuthState state)? error,
  }) {
    return switch (this) {
      LoadingAuthState _ when loading != null => loading(),
      LoadedAuthState _ when loaded != null => loaded(),
      ErrorAuthState state when error != null => error(state),
      _ => orElse(),
    };
  }
}
