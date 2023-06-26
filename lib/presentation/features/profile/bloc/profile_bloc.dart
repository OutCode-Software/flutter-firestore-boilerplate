import 'dart:async';

import 'package:bloc_demo/data/model/response/basic_response.dart';
import 'package:bloc_demo/domain/repository/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/constants.dart';

part 'profile_events.dart';

part 'profile_states.dart';

class ProfileBloc extends Bloc<ProfileEvents, ProfileStates> {
  late final AuthRepository _authRepository;

  ProfileBloc({required AuthRepository authRepository}) : super(Initial()) {
    _authRepository = authRepository;

    on<OnLogOutPressed>(mapLogoutEventToStates);
  }

  FutureOr<void> mapLogoutEventToStates(
      OnLogOutPressed event, Emitter<ProfileStates> emit) async {
    emit(ShowLogoutLoader(loadingStatus: LoadingStatus.loading));
    var response = await _authRepository.logout();
    response.when(successState: (body) {
      emit(ShowLogoutLoader(loadingStatus: LoadingStatus.success));
      emit(LoggedOut(responseEntity: body));
    }, errorState: (error) {
      emit(ShowLogoutLoader(loadingStatus: LoadingStatus.failed));
      emit(LogOutFailed(errorMessage: error));
    });
  }
}
