part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

// LOGIN STATES
class AuthSignInLoading extends AuthState {}

class AuthSignInSuccess extends AuthState {}

class AuthSignInError extends AuthState {
  final String errMsg;
  const AuthSignInError({required this.errMsg});
}

// SIGNUP STATES
class AuthRegistrationProceed extends AuthState {}

class AuthSignUpLoading extends AuthState {}

class AuthRegistrationFailure extends AuthState {
  final String errorMsg;
  const AuthRegistrationFailure({required this.errorMsg});
}

// OTP STATES
class AuthOtpVerificationSuccess extends AuthState {}

class AuthOtpVerificationError extends AuthState {}
