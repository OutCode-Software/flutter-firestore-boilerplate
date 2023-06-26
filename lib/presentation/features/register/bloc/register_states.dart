part of 'register_bloc.dart';

abstract class RegisterStates {}

class Initial extends RegisterStates {}

class ShowRegisterLoader extends RegisterStates {
  LoadingStatus loadingStatus;

  ShowRegisterLoader({required this.loadingStatus});
}

class RegisterSuccess extends RegisterStates {
  UserModel userModel;

  RegisterSuccess({required this.userModel});
}

class RegisterFailed extends RegisterStates {
  String errorMessage;

  RegisterFailed({required this.errorMessage});
}
