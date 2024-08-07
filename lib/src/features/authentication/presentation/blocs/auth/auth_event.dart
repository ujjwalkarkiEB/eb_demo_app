part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AppStartedEvent extends AuthEvent {}

class AuthCheckEvent extends AuthEvent {}

class FirstVisitCheckEvent extends AuthEvent {}

class AuthLogoutReuqestEvenet extends AuthEvent {}

// biometric login events
class CheckIfBiometricEnabled extends AuthEvent {}

class CheckIfBiometricAvailable extends AuthEvent {}

class AuthBiometricLoginEvent extends AuthEvent {}

class ToggleBiometricLogin extends AuthEvent {
  final bool enbale;

  const ToggleBiometricLogin({required this.enbale});
}
