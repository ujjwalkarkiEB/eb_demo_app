part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class CheckLoading extends AuthState {}

final class AppStarted extends AuthState {}

final class AuthAuthenticated extends AuthState {}

final class AuthUnAuthenticated extends AuthState {}

final class FirstVisit extends AuthState {}

final class LoggingOut extends AuthState {}

final class LogOutSuccessful extends AuthState {}

final class LogOutFailed extends AuthState {}
