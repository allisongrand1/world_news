import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:world_news/application.dart';
import 'package:world_news/core/common/infrastructure.dart';
import 'package:world_news/core/di/di.dart';
import 'package:world_news/core/di/provider_wrapper.dart';
import 'package:world_news/core/errors/exception/exception_observer.dart';

void main() {
  final exceptionObserver = ExceptionObserver();

  runZonedGuarded(() {
    WidgetsFlutterBinding.ensureInitialized();

    Future.sync(() async {
      final prefs = await SharedPreferences.getInstance();
      final infrastructure = await Infrastructure.base(prefs);
      final di = DI.base(infrastructure);

      runApp(ProviderWrapper(di: di, child: Application(infrastructure)));
    });
  }, exceptionObserver.onException);
}
