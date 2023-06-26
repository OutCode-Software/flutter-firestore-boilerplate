import 'package:bloc_demo/data/firestore/auth_service.dart';
import 'package:bloc_demo/data/firestore/products_store.dart';

import 'injector.dart';

class DataSourceModule {
  DataSourceModule._();

  static void init() {
    final injector = Injector.instance;
    injector.registerSingleton<AuthService>(AuthServiceImpl());
    injector.registerSingleton<ProductsStore>(ProductsStoreImpl());
  }
}
