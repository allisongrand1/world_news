import 'package:dio/dio.dart';
import 'package:world_news/core/common/environment/environment.dart';

class Infrastructure {
  final Dio dio;

  Infrastructure._({required this.dio});

  factory Infrastructure.base() => _BaseInfrastructure();
}

class _BaseInfrastructure extends Infrastructure {
  _BaseInfrastructure() : super._(dio: Dio(Environment.dioBaseOptions));
}
