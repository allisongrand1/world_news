import 'package:world_news/core/common/infrastructure.dart';
import 'package:world_news/core/di/di_providers.dart';

abstract class DI {
  DIProviders get providers;

  static DI base(Infrastructure infrastructure) => _BaseDi(infrastructure);

  static DI test(Infrastructure infrastructure) => _TestDi(infrastructure);
}

class _BaseDi implements DI {
  final Infrastructure infrastructure;

  @override
  final DIProviders providers;

  _BaseDi(this.infrastructure) : providers = DIProviders.base(infrastructure);
}

class _TestDi implements DI {
  final Infrastructure infrastructure;

  @override
  final DIProviders providers;

  _TestDi(this.infrastructure) : providers = DIProviders.test(infrastructure);
}
