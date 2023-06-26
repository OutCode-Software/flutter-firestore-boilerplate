import 'dart:async';

import 'package:bloc_demo/data/request/user_request_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/constants.dart';
import '../../../../data/model/user_model.dart';
import '../../../../domain/repository/auth_repository.dart';

part 'register_events.dart';

part 'register_states.dart';

class RegisterBloc extends Bloc<RegisterEvents, RegisterStates> {
  RegisterBloc({
    required AuthRepository authRepository,
  }) : super(Initial()) {
    _authRepository = authRepository;
    on<OnRegisterPressed>(_mapRegisterPressedEventToStates);
  }

  late final AuthRepository _authRepository;

  FutureOr<void> _mapRegisterPressedEventToStates(
      OnRegisterPressed event, Emitter<RegisterStates> emit) async {
    emit(ShowRegisterLoader(loadingStatus: LoadingStatus.loading));
    var userRequestModel = UserRequestModel(
        firstName: event.firstName,
        lastName: event.lastName,
        email: event.email,
        password: event.password);
    var response = await _authRepository.registerUser(userRequestModel);
    response.when(successState: (storeResponse) {
      emit(ShowRegisterLoader(loadingStatus: LoadingStatus.success));
      emit(RegisterSuccess(userModel: storeResponse));
    }, errorState: (error) {
      emit(ShowRegisterLoader(loadingStatus: LoadingStatus.failed));
      emit(RegisterFailed(errorMessage: error));
    });
  }
}
