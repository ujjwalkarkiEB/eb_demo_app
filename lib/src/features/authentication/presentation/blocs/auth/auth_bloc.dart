import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import '../../../data/respository/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  AuthBloc(this._authRepository) : super(AppStarted()) {
    on<AppStartedEvent>(_onAppStarted);
  }

  void _onAppStarted(AppStartedEvent event, Emitter<AuthState> emit) async {
    emit(CheckLoading());
    final bool isFirstVisit = _authRepository.isFirstVisit();
    if (isFirstVisit) {
      emit(FirstVisit());
    } else {
      final bool isAuthenticated = _authRepository.isAuthenticated();
      if (isAuthenticated) {
        emit(AuthAuthenticated());
      } else {
        emit(AuthUnAuthenticated());
      }
    }
  }
}
