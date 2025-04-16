import 'package:world_news/core/common/notifier/auth_notifier.dart';

class NotifierProviders {
  final AuthNotifier authNotifier;

  NotifierProviders._({required this.authNotifier});

  factory NotifierProviders.base() {
    return NotifierProviders._(authNotifier: AuthNotifier());
  }
}
