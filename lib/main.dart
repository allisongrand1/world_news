import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:world_news/application.dart';
import 'package:world_news/core/common/infrastructure.dart';
import 'package:world_news/core/di/di.dart';
import 'package:world_news/core/di/provider_wrapper.dart';
import 'package:world_news/core/errors/exception/exception_observer.dart';

void main() {
  final exceptionObserver = ExceptionObserver();

  runZonedGuarded(() {
    final infrastructure = Infrastructure.base();

    final di = DI.base(infrastructure);

    runApp(ProviderWrapper(di: di, child: Application()));
  }, exceptionObserver.onException);
}
