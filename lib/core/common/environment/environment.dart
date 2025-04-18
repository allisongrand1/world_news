// ignore_for_file: unused_field

import 'package:dio/dio.dart';
import 'package:world_news/core/common/environment/environment_interface.dart';

import 'environment_type.dart';

abstract class Environment {
  static EnvironmentType _type = EnvironmentType.product;
  static EnvironmentInterface _environment = EnvironmentInterface.createProductEnvironment();

  static void setEnvironment(EnvironmentType type) {
    _type = type;

    _environment = switch (type) {
      EnvironmentType.product => EnvironmentInterface.createProductEnvironment(),
    };
  }

  static String get appName => _environment.appName;

  static String get apiSecret => _environment.apiSecret;

  static BaseOptions get dioBaseOptions => _environment.dioBaseOptions;
}
