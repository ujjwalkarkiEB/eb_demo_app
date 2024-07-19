import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthSignUpRequestEvent>(_authSignUpEvent);
    on<AuthSignInRequestEvent>(_authSignInEvent);
  }

  void _authSignUpEvent(
      AuthSignUpRequestEvent event, Emitter<AuthState> emit) async {
    emit(AuthSignUpLoading());
    await Future.delayed(Duration(seconds: 2));
    // emit(AuthSignUpSuccess());
  }

  void _authSignInEvent(
      AuthSignInRequestEvent event, Emitter<AuthState> emit) async {
    emit(AuthSignInLoading());
    await Future.delayed(Duration(seconds: 2));
    emit(AuthSignInError(errMsg: 'adsasad'));
  }
}
