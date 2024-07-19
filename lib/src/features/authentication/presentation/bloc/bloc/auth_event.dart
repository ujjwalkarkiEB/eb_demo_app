part of 'auth_bloc.dart';

sealed class AuthEvent {}

class OnbaordingNextPageClicked extends AuthEvent {}

class AuthSignUpRequestEvent extends AuthEvent {
  final String username;
  final String email;
  final String password;
  final String repeatedPassword;

  AuthSignUpRequestEvent(
      {required this.username,
      required this.email,
      required this.password,
      required this.repeatedPassword});
}

class AuthSignInRequestEvent extends AuthEvent {
  final String email;
  final String password;

  AuthSignInRequestEvent({required this.email, required this.password});
}
