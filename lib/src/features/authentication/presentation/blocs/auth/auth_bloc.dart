import 'package:bloc/bloc.dart';
import 'package:eb_demo_app/src/features/authentication/data/respository/auth_repository.dart';
import 'package:eb_demo_app/src/features/authentication/data/respository/local_auth_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/utils/error/failure/failure.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  final LocalAuthRepository _localAuthRepository;
  bool isBiometricEnabled = false;

  AuthBloc(this._authRepository, this._localAuthRepository)
      : super(AppStarted()) {
    on<AppStartedEvent>(_onAppStarted);
    on<AuthLogoutReuqestEvenet>(_onLogoutEvent);
    on<CheckIfBiometricEnabled>(_onCheckIfBiometricEnabled);
    on<AuthBiometricLoginEvent>(_onAuthBiometricLoginEvent);
    on<ToggleBiometricLogin>(_onToggleBiometricLogin);

    // Check biometric availability and state on initialization
    _checkBiometricAvailabilityAndState();
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

  Future<void> _onLogoutEvent(
      AuthLogoutReuqestEvenet event, Emitter<AuthState> emit) async {
    try {
      emit(LoggingOut());
      await Future.delayed(const Duration(seconds: 2));
      await _authRepository.logout();
      emit(LogOutSuccessful());
      add(CheckIfBiometricEnabled());
    } catch (e) {
      emit(LogOutFailed());
    }
  }

  Future<void> _onCheckIfBiometricEnabled(
      CheckIfBiometricEnabled event, Emitter<AuthState> emit) async {
    final biometricEnabledResult =
        await _localAuthRepository.isBiometricEnabled();
    biometricEnabledResult.fold(
      (failure) => emit(BiometricCheckFailed()),
      (isBiometricEnabled) {
        this.isBiometricEnabled = isBiometricEnabled;
        if (isBiometricEnabled) {
          emit(BiometricEnabled());
        } else {
          emit(BiometricDisabled());
        }
      },
    );
  }

  Future<void> _onAuthBiometricLoginEvent(
      AuthBiometricLoginEvent event, Emitter<AuthState> emit) async {
    final authResult = await _localAuthRepository.authenticateUser();
    authResult.fold(
      (failure) => emit(BiometricCheckFailed()),
      (isAuthenticated) {
        if (isAuthenticated) {
          emit(BiometricAuthenticated());
        }
      },
    );
  }

  Future<void> _onToggleBiometricLogin(
      ToggleBiometricLogin event, Emitter<AuthState> emit) async {
    try {
      await _localAuthRepository.enableBiometric(event.enbale);
      isBiometricEnabled = event.enbale;
      if (event.enbale) {
        emit(BiometricEnabled());
      } else {
        emit(BiometricDisabled());
      }
    } catch (e) {
      emit(BiometricCheckFailed());
    }
  }

  Future<void> _checkBiometricAvailabilityAndState() async {
    final biometricAvailabilityResult =
        await _localAuthRepository.isBiometricAvailable();
    biometricAvailabilityResult.fold(
      (failure) {
        emit(BiometricCheckFailed());
      },
      (isAvailable) async {
        if (!isAvailable) {
          emit(BiometricUnAvailable());
        } else {
          emit(BiometricAvailable());
          add(CheckIfBiometricEnabled());
        }
      },
    );
  }

  @override
  void onTransition(Transition<AuthEvent, AuthState> transition) {
    // TODO: implement onTransition
    super.onTransition(transition);
    print('auth: $transition');
  }
}
