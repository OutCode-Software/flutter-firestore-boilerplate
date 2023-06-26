import 'package:bloc_demo/injector/api_client_module.dart';
import 'package:bloc_demo/injector/bloc_module.dart';
import 'package:bloc_demo/injector/data_source_module.dart';
import 'package:bloc_demo/injector/repository_module.dart';
import 'package:bloc_demo/injector/service_module.dart';
import 'package:get_it/get_it.dart';

class Injector {
  static GetIt instance = GetIt.instance;

  Injector._();

  static void init() {
    ServiceModule.init();
    // ApiClientModule.init();
    DataSourceModule.init();
    RepositoryModule.init();
    BlocModule.init();
  }

  static void reset() {
    instance.reset();
  }

  static void resetLazySingleton() {
    instance.resetLazySingleton();
  }
}
