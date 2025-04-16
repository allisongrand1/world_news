import 'dart:developer';

class ExceptionObserver {
  void onException(Object error, StackTrace stackTrace) {
    log('Ошибка на уровне runApp: [$runtimeType]', error: error, stackTrace: stackTrace);
  }
}
