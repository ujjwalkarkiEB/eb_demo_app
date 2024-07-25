part of 'otp_bloc.dart';

sealed class OtpEvent extends Equatable {
  const OtpEvent();

  @override
  List<Object> get props => [];
}

class OtpCheckEvent extends OtpEvent {}

class AddDataOnCompleteInputEvent extends OtpEvent {
  final String otpCode;
  final String userID;

  const AddDataOnCompleteInputEvent(
      {required this.otpCode, required this.userID});
}

class ResendOtpRequestEvent extends OtpEvent {}
