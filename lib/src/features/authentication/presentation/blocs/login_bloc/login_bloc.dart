import 'package:bloc/bloc.dart';
import 'package:eb_demo_app/src/features/authentication/data/respository/auth_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/utils/error/failure/failure.dart';

part 'login_event.dart';
part 'login_state.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository _authRepository;
  LoginBloc(this._authRepository) : super(LoginInitial()) {
    on<LoginRequestEvent>((event, emit) async {
      emit(LoginLoading());

      final result = await _authRepository.login(event.email, event.password);
      result.fold(
        (l) {
          if (l is ServerFailure) {
            emit(LoginFailed(errorMsg: l.failureMsg!, data: l.errorData));
          }
          emit(LoginFailed(errorMsg: l.failureMsg!));
        },
        (r) => emit(const LoginSuccess()),
      );
    });

    on<ReDirectToSignupScreenEvent>(_redirectEvent);
  }

  void _redirectEvent(
      ReDirectToSignupScreenEvent event, Emitter<LoginState> emit) {
    emit(ScreenRedirect());
  }
}
