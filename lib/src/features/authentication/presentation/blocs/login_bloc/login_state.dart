part of 'login_bloc.dart';

sealed class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {
  final bool isUserAdmin;

  const LoginSuccess({this.isUserAdmin = false});
}

final class LoginFailed extends LoginState {
  final String errorMsg;
  final String? data;

  const LoginFailed({required this.errorMsg, this.data});
}

final class ScreenRedirect extends LoginState {}
