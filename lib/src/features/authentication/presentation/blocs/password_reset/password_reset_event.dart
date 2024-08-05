part of 'password_reset_bloc.dart';

sealed class PasswordResetEvent {}

final class ResetPswEmailSentEvent extends PasswordResetEvent {
  final String email;

  ResetPswEmailSentEvent({required this.email});
}

final class VerifyResetEmailEvent extends PasswordResetEvent {
  final String otp;

  VerifyResetEmailEvent({required this.otp});
}
