import 'dart:async';

import 'package:bloc_demo/data/constants.dart';
import 'package:bloc_demo/data/model/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/repository/auth_repository.dart';

part 'login_events.dart';

part 'login_states.dart';

class LoginBloc extends Bloc<LoginEvents, LoginStates> {
  LoginBloc({
    required AuthRepository authRepository,
  }) : super(Initial()) {
    _authRepository = authRepository;
    on<OnLoginPressed>(_mapLoginPressedEventToStates);
  }

  late final AuthRepository _authRepository;

  FutureOr<void> _mapLoginPressedEventToStates(
      OnLoginPressed event, Emitter<LoginStates> emit) async {
    emit(ShowLoginLoader(loadingStatus: LoadingStatus.loading));
    var response = await _authRepository.loginUser(event.email, event.password);
    response.when(successState: (res) {
      emit(ShowLoginLoader(loadingStatus: LoadingStatus.success));
      emit(LoginSuccess(userModel: res));
    }, errorState: (error) {
      emit(ShowLoginLoader(loadingStatus: LoadingStatus.failed));
      emit(LoginFailed(errorMessage: error));
    });
  }
}
