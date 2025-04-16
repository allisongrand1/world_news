class Profile {
  final String login;
  final String password;

  Profile({required this.login, required this.password});

  Profile.empty() : login = '', password = '';
}
