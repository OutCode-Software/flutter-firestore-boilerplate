import 'package:bloc_demo/presentation/features/profile/bloc/profile_bloc.dart';
import 'package:bloc_demo/presentation/navigation/bloc/navigation_bloc.dart';

import '../presentation/application/bloc/application_bloc.dart';
import '../presentation/authentication/bloc/authentication_bloc.dart';
import '../presentation/features/login/bloc/login_bloc.dart';
import '../presentation/features/register/bloc/register_bloc.dart';
import 'injector.dart';

class BlocModule {
  BlocModule._();

  static void init() {
    final injector = Injector.instance;

    injector.registerSingleton<ApplicationBloc>(ApplicationBloc(
      localStorageService: injector(),
    ));

    injector.registerFactory<AuthenticationBloc>(
        (() => AuthenticationBloc(authRepository: injector())));

    injector.registerFactory<RegisterBloc>(
        () => RegisterBloc(authRepository: injector()));

    injector.registerFactory<LoginBloc>(
        () => LoginBloc(authRepository: injector()));

    injector.registerFactory<BottomNavigationBloc>(
        (() => BottomNavigationBloc(localStorageService: injector())));

    injector.registerFactory<ProfileBloc>(
            () => ProfileBloc(authRepository: injector()));
  }
}
