import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../data/respository/auth_repository.dart';

part 'otp_event.dart';
part 'otp_state.dart';

@injectable
class OtpBloc extends Bloc<OtpEvent, OtpState> {
  final AuthRepository _authRepository;
  String? otpCode;
  String? userID;

  OtpBloc(this._authRepository) : super(OtpInitial()) {
    on<OtpCheckEvent>(_onOtpCheckEvent);
    on<AddDataOnCompleteInputEvent>(_addOtpData);
    on<ResendOtpRequestEvent>(_onResendOtp);
  }

  Future<void> _onOtpCheckEvent(
      OtpCheckEvent event, Emitter<OtpState> emit) async {
    if (otpCode == null) {
      emit(const OtpCheckFailed(failureMsg: "Please Enter OTP code!"));
      return;
    }
    emit(OtpCheckLoading());
    final result = await _authRepository.verifyOtp(
        userID!, otpCode!, event.isRedirectedFromLogin);

    result.fold(
      (failure) => emit(OtpCheckFailed(failureMsg: failure.failureMsg!)),
      (_) => emit(OtpCheckSuccess()),
    );
  }

  void _addOtpData(AddDataOnCompleteInputEvent event, Emitter<OtpState> emit) {
    otpCode = event.otpCode;
    userID = event.userID;
  }

  void _onResendOtp(ResendOtpRequestEvent event, Emitter<OtpState> emit) async {
    final result = await _authRepository.resendOtp(event.userID);

    result.fold(
      (l) => emit(OtpResendFailed()),
      (r) => emit(OtpResendSuccess()),
    );

    // result.fold(
    //   (l) {
    //     print('error');
    //   },
    //   (r) {
    //     print('success');
    //   },
    // );
  }

  @override
  void onTransition(Transition<OtpEvent, OtpState> transition) {
    // TODO: implement onTransition
    super.onTransition(transition);
    print(transition);
  }
}
