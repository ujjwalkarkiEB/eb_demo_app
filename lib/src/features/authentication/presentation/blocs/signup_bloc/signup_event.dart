part of 'signup_bloc.dart';

sealed class SignupEvent extends Equatable {
  const SignupEvent();

  @override
  List<Object> get props => [];
}

class SignUpRequestEvent extends SignupEvent {
  final String email;
  final String password;
  final String repeatedPassword;
  final String username;

  const SignUpRequestEvent(
      {required this.email,
      required this.password,
      required this.repeatedPassword,
      required this.username});
}
