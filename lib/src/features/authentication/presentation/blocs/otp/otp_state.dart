part of 'otp_bloc.dart';

sealed class OtpState extends Equatable {
  const OtpState();
  @override
  List<Object?> get props => [];
}

final class OtpInitial extends OtpState {}

final class OtpCheckLoading extends OtpState {}

final class OtpCheckFailed extends OtpState {
  final String failureMsg;

  const OtpCheckFailed({required this.failureMsg});
}

final class OtpCheckSuccess extends OtpState {}

final class OtpResendFailed extends OtpState {}

final class OtpResendSuccess extends OtpState {}
