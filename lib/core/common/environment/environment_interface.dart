import 'package:dio/dio.dart';

const String _baseUrl = 'https://newsapi.org/v2/';

sealed class EnvironmentInterface {
  static Duration sendTimeout = const Duration(seconds: 10);
  static Duration connectTimeout = const Duration(seconds: 10);
  static Duration receiveTimeout = const Duration(seconds: 10);

  static EnvironmentInterface createProductEnvironment() => _ProductEnvironment();

  String get appName => 'WorldNews';

  String get apiSecret;

  BaseOptions get dioBaseOptions;
}

class _ProductEnvironment extends EnvironmentInterface {
  @override
  String get apiSecret => String.fromEnvironment('name', defaultValue: 'ed1a7788701c4051bf415ab1965d595a');

  @override
  BaseOptions get dioBaseOptions {
    return BaseOptions(
      baseUrl: _baseUrl,
      sendTimeout: EnvironmentInterface.sendTimeout,
      connectTimeout: EnvironmentInterface.connectTimeout,
      receiveTimeout: EnvironmentInterface.receiveTimeout,
      headers: {'X-Api-Key': apiSecret},
      contentType: Headers.jsonContentType,
    );
  }
}
