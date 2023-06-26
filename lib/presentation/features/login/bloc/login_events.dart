part of 'login_bloc.dart';

abstract class LoginEvents {}

class OnLoginPressed extends LoginEvents {
  String email;
  String password;

  OnLoginPressed({required this.email, required this.password});
}
