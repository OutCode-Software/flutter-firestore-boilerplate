import 'package:bloc_demo/base/utils/colors.dart';
import 'package:bloc_demo/config/app_config.dart';
import 'package:bloc_demo/generated/l10n.dart';
import 'package:bloc_demo/injector/injector.dart';
import 'package:bloc_demo/presentation/application/bloc/application_bloc.dart';
import 'package:bloc_demo/presentation/authentication/bloc/authentication_bloc.dart';
import 'package:bloc_demo/presentation/features/login/bloc/login_bloc.dart';
import 'package:bloc_demo/presentation/features/login/login_screen.dart';
import 'package:bloc_demo/presentation/features/profile/bloc/profile_bloc.dart';
import 'package:bloc_demo/presentation/features/register/bloc/register_bloc.dart';
import 'package:bloc_demo/presentation/navigation/bloc/navigation_bloc.dart';
import 'package:bloc_demo/presentation/navigation/dashboard_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class FirestoreApp extends StatefulWidget {
  const FirestoreApp({Key? key}) : super(key: key);

  @override
  State<FirestoreApp> createState() => _FirestoreAppState();
}

class _FirestoreAppState extends State<FirestoreApp> {
  late String _locale;
  late final AppLocalizationDelegate appLocalizationDelegate;
  late final ApplicationBloc _bloc;
  late final AuthenticationBloc _authBloc;

  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState? get _navigator => _navigatorKey.currentState;

  @override
  void initState() {
    _locale = AppConfig.defaultLocale;
    _bloc = Injector.instance<ApplicationBloc>();
    _authBloc = Injector.instance<AuthenticationBloc>();
    _bloc.add(const ApplicationLoaded());
    _authBloc.add(const CheckAuthenticationStatus());
    appLocalizationDelegate = const AppLocalizationDelegate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ApplicationBloc>.value(
          value: _bloc,
        ),
        BlocProvider<AuthenticationBloc>.value(
          value: _authBloc,
        ),
        BlocProvider<LoginBloc>.value(
          value: Injector.instance<LoginBloc>(),
        ),
        BlocProvider<RegisterBloc>.value(
          value: Injector.instance<RegisterBloc>(),
        ),
        BlocProvider<BottomNavigationBloc>.value(
          value: Injector.instance<BottomNavigationBloc>(),
        ),
        BlocProvider<ProfileBloc>.value(
          value: Injector.instance<ProfileBloc>(),
        ),
      ],
      child: BlocListener<ApplicationBloc, ApplicationState>(
        bloc: _bloc,
        listener: (context, state) {
          if (state.status == UIStatus.loadSuccess) {
            if (_locale != state.locale) {
              setState(() {
                _locale = state.locale;
              });
            }
          }
        },
        child: MaterialApp(
          navigatorKey: _navigatorKey,
          debugShowCheckedModeBanner: false,
          localizationsDelegates: [
            appLocalizationDelegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            DefaultCupertinoLocalizations.delegate,
          ],
          supportedLocales: appLocalizationDelegate.supportedLocales,
          locale: Locale(_locale),
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: ThemeMode.light,
          builder: (context, child) {
            return BlocListener<AuthenticationBloc, AuthenticationState>(
              bloc: _authBloc,
              listener: (context, state) {
                state.when(
                    initial: () {},
                    authenticated: (profileCompleteFlag) {
                      _navigator?.pushAndRemoveUntil(
                          DashboardScreen.route(), (route) => false);
                    },
                    unauthenticated: () {
                      _navigator?.pushAndRemoveUntil(
                          LoginScreen.route(), (route) => false);
                    });
              },
              child: child,
            );
          },
          onGenerateRoute: (_) => SplashPage.route(),
        ),
      ),
    );
  }
}

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const SplashPage());
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.white,
      body: Center(),
    );
  }
}
