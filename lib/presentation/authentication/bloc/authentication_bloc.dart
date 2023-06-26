// ignore: depend_on_referenced_packages
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/repository/auth_repository.dart';

part 'authentication_bloc.freezed.dart';

part 'authentication_event.dart';

part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({
    required AuthRepository authRepository,
  }) : super(const Initial()) {
    _authRepository = authRepository;
    on<CheckAuthenticationStatus>(_checkAuthenticationStatus);
  }

  late final AuthRepository _authRepository;

  FutureOr<void> _checkAuthenticationStatus(CheckAuthenticationStatus event,
      Emitter<AuthenticationState> emit) async {
    event.whenOrNull(
      checkAuthStatus: () async {
        var getCurrentUserId = _authRepository.getCurrentUserId();
        if (getCurrentUserId.isEmpty) {
          emit(const AuthenticationState.unauthenticated());
          await _authRepository.clearCache();
        } else {
          emit(const AuthenticationState.authenticated(true));
        }
      },
    );
  }
}
