part of 'register_bloc.dart';

abstract class RegisterEvents {}

class OnRegisterPressed extends RegisterEvents {
  String firstName;
  String lastName;
  String email;
  String password;

  OnRegisterPressed(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.password});
}
