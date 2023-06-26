part of 'profile_bloc.dart';

abstract class ProfileStates {}

class Initial extends ProfileStates {
  Initial();
}

class LoggedOut extends ProfileStates {
  BasicResponse responseEntity;
  LoggedOut({required this.responseEntity});
}

class ShowLogoutLoader extends ProfileStates {
  LoadingStatus loadingStatus;

  ShowLogoutLoader({required this.loadingStatus});
}

class LogOutFailed extends ProfileStates {
  String errorMessage;
  LogOutFailed({required this.errorMessage});
}