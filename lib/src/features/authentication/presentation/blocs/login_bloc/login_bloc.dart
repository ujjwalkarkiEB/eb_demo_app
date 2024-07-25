import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'login_event.dart';
part 'login_state.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginRequestEvent>((event, emit) async {
      emit(LoginLoading());
      await Future.delayed(Duration(seconds: 3));
      emit(LoginFailed(errorMsg: 'asdasdasd'));
      // emit(LoginSuccess());
    });

    on<ReDirectToSignupScreenEvent>(_redirectEvent);
  }

  void _redirectEvent(
      ReDirectToSignupScreenEvent event, Emitter<LoginState> emit) {
    emit(ScreenRedirect());
  }
}
