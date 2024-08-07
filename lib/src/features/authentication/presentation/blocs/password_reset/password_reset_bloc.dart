import 'package:bloc/bloc.dart';
import 'package:eb_demo_app/src/features/authentication/data/respository/password_config_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'password_reset_event.dart';
part 'password_reset_state.dart';

@injectable
class PasswordResetBloc extends Bloc<PasswordResetEvent, PasswordResetState> {
  final PasswordConfigRepository _passwordConfigRepository;
  PasswordResetBloc(this._passwordConfigRepository)
      : super(PasswordResetInitial()) {
    on<ResetPswEmailSentEvent>(_onResetEmailEvent);
    on<VerifyResetEmailEvent>(_onVrifyResetEmailEvent);
    on<ResetNewPasswordEvent>(_ResetNewPswEvent);
  }
  String? enteredOtp;
  String? oid;
  String? token;
  String? userID;
  void _onResetEmailEvent(
      ResetPswEmailSentEvent event, Emitter<PasswordResetState> emit) async {
    emit(PasswordResetActionLoading());
    await Future.delayed(const Duration(seconds: 2));
    final result = await _passwordConfigRepository.sendPasswordResetEmail(
        email: event.email);
    result.fold(
        (failure) => emit(ResetPswEmailSendError(errMsg: failure.failureMsg!)),
        (data) {
      oid = data['oid']!;
      userID = data['userId']!;
      token = data['token']!;
      emit(PasswordResetEmailSent());
    });
  }

  void _onVrifyResetEmailEvent(
      VerifyResetEmailEvent event, Emitter<PasswordResetState> emit) async {
    if (enteredOtp == null || userID == null) {
      emit(ResetPswOtpVerificationError());
      return;
    }
    emit(PasswordResetActionLoading());

    await Future.delayed(const Duration(seconds: 2));
    final result = await _passwordConfigRepository.verifyPasswordResetOtp(
        otp: enteredOtp!, userId: userID!);
    result.fold(
      (failure) => emit(ResetPswOtpVerificationError()),
      (successMsg) => emit(ResetPswOtpVerificationSuccess()),
    );
  }

  void _ResetNewPswEvent(
      ResetNewPasswordEvent event, Emitter<PasswordResetState> emit) async {
    if (oid == null || token == null) {
      emit(ResetPasswordError());
      return;
    }
    emit(PasswordResetActionLoading());

    await Future.delayed(const Duration(seconds: 2));
    final result = await _passwordConfigRepository.resetPassword(
        oid: oid!, token: token!, newPassword: event.newPsw);

    result.fold(
      (failure) => emit(ResetPasswordError()),
      (successMsg) => emit(ResetPasswordSuccessful()),
    );
  }
}
