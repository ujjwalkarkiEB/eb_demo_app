import 'package:bloc/bloc.dart';
import 'package:eb_demo_app/src/features/authentication/data/respository/auth_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'signup_event.dart';
part 'signup_state.dart';

@injectable
class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final AuthRepository _authReposiory;
  SignupBloc(this._authReposiory) : super(SignupInitial()) {
    on<SignUpRequestEvent>((event, emit) async {
      emit(SignupLoading());
      final result = await _authReposiory.registerUser(
          event.username, event.email, event.password, event.repeatedPassword);

      result.fold(
        (l) => emit(SignupFailed(errorMsg: l.failureMsg!)),
        (r) => emit(SignupSuccess(userID: r)),
      );
    });
  }
}
