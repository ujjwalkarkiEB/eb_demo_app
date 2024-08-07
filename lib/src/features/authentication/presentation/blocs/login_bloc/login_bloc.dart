import 'package:bloc/bloc.dart';
import 'package:eb_demo_app/src/features/authentication/data/respository/auth_repository.dart';
import 'package:eb_demo_app/src/features/authentication/data/respository/local_auth_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/utils/error/failure/failure.dart';

part 'login_event.dart';
part 'login_state.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository _authRepository;
  bool isBiometricEnabled = false;

  LoginBloc(this._authRepository) : super(LoginInitial()) {
    on<LoginRequestEvent>(_onLoginRequest);
    on<ReDirectToSignupScreenEvent>(_redirectEvent);
  }

  Future<void> _onLoginRequest(
      LoginRequestEvent event, Emitter<LoginState> emit) async {
    emit(LoginLoading());

    final result = await _authRepository.login(event.email, event.password);
    result.fold(
      (l) {
        if (l is ServerFailure) {
          emit(LoginFailed(errorMsg: l.failureMsg!, data: l.errorData));
        } else {
          emit(LoginFailed(errorMsg: l.failureMsg!));
        }
      },
      (r) => emit(const LoginSuccess()),
    );
  }

  void _redirectEvent(
      ReDirectToSignupScreenEvent event, Emitter<LoginState> emit) {
    emit(ScreenRedirect());
  }
}
