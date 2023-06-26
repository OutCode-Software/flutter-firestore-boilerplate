import 'package:bloc_demo/domain/repository/product_repository.dart';

import '../domain/repository/auth_repository.dart';
import 'injector.dart';

class RepositoryModule {
  RepositoryModule._();

  static void init() {
    final injector = Injector.instance;

    injector.registerSingleton<AuthRepository>(AuthRepositoryImpl(
        localStorageService: injector(), authService: injector()));

    injector.registerSingleton<ProductRepository>(ProductRepositoryImpl(
        localStorageService: injector(), productsStore: injector()));
  }
}
