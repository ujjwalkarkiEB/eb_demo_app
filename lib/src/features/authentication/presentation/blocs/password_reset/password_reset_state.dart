part of 'password_reset_bloc.dart';

sealed class PasswordResetState {}

final class PasswordResetInitial extends PasswordResetState {}

final class PasswordResetEmailSent extends PasswordResetState {}

final class PasswordResetActionLoading extends PasswordResetState {}

final class ResetPswEmailSendError extends PasswordResetState {
  final String errMsg;

  ResetPswEmailSendError({required this.errMsg});
}

final class ResetPswOtpVerificationSuccess extends PasswordResetState {}

final class ResetPswOtpVerificationError extends PasswordResetState {}

final class ResetPasswordSuccessful extends PasswordResetState {}

final class ResetPasswordError extends PasswordResetState {}
