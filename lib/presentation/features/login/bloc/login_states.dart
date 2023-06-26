part of 'login_bloc.dart';

abstract class LoginStates {}

class Initial extends LoginStates {}

class ShowLoginLoader extends LoginStates {
  LoadingStatus loadingStatus;

  ShowLoginLoader({required this.loadingStatus});
}

class LoginSuccess extends LoginStates {
  UserModel userModel;

  LoginSuccess({required this.userModel});
}

class LoginFailed extends LoginStates {
  String errorMessage;

  LoginFailed({required this.errorMessage});
}
