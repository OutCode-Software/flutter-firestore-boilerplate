import 'package:bloc_demo/base/network/client.dart';
import 'injector.dart';

class ApiClientModule {
  ApiClientModule._();

  static void init() {
    final injector = Injector.instance;

    injector.registerSingleton<UserAgentClient>(
        UserAgentClient(localStorageService: injector()));
  }
}
