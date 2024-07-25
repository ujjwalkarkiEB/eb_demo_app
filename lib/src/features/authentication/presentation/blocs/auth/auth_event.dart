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
