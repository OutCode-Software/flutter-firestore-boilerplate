import 'package:bloc_demo/injector/injector.dart';
import 'package:bloc_demo/services/local_storage_service/local_storage_service.dart';
import 'package:bloc_demo/services/local_storage_service/shared_preference_service.dart';

class ServiceModule {
  ServiceModule._();

  static void init() {
    final injector = Injector.instance;

    injector.registerSingleton<LocalStorageService>(SharedPreferenceService(),
        signalsReady: true);
  }
}
