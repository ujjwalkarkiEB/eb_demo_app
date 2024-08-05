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
  }

  void _onResetEmailEvent(
      ResetPswEmailSentEvent event, Emitter<PasswordResetState> emit) async {
    emit(PasswordResetActionLoading());
    await Future.delayed(const Duration(seconds: 2));
    final result = await _passwordConfigRepository.sendPasswordResetEmail(
        email: event.email);
    result.fold(
      (failure) => emit(ResetPswEmailSendError(errMsg: failure.failureMsg!)),
      (successMsg) => emit(PasswordResetEmailSent()),
    );
  }
}
