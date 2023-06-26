part of 'authentication_bloc.dart';

@Freezed(equal: false)
class AuthenticationState with _$AuthenticationState {
  const factory AuthenticationState.initial() = Initial;
  const factory AuthenticationState.authenticated(bool isFormCompleted) =
      Authenticated;
  const factory AuthenticationState.unauthenticated() = unAuthenticated;
}
