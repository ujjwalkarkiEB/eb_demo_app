import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:local_auth/local_auth.dart';

import '../../../data/respository/auth_repository.dart';
import '../../../data/respository/local_auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  final LocalAuthRepository _localAuthRepository;

  AuthBloc(this._authRepository, this._localAuthRepository)
      : super(AppStarted()) {
    on<AppStartedEvent>(_onAppStarted);
    on<AuthLogoutReuqestEvenet>(_onLogout);
    on<CheckIfBiometricEnabled>(_onCheckIfBiometricEnabled);
    on<AuthBiometricLoginEvent>(_onAuthBiometricLoginEvent);
    on<ToggleBiometricLogin>(_onToggleBiometricLogin);
  }

  Future<void> _onAppStarted(
      AppStartedEvent event, Emitter<AuthState> emit) async {
    emit(CheckLoading());

    // Check if it is the user's first visit
    final isFirstVisit = _authRepository.isFirstVisit();
    if (isFirstVisit) {
      emit(FirstVisit());
    } else {
      // Check if the user is authenticated
      final isAuthenticated = _authRepository.isAuthenticated();
      if (!isAuthenticated) {
        emit(AuthUnAuthenticated());

        // Check if biometric authentication is available
        final biometricAvailabilityResult =
            await _localAuthRepository.isBiometricAvailable();
        biometricAvailabilityResult.fold(
          (failure) {
            // Handle failure case
            emit(BiometricCheckFailed()); // Emit a failure state
          },
          (isBiometricAvailable) async {
            if (!isBiometricAvailable) {
              emit(BiometricUnAvailable());
            } else {
              emit(BiometricAvailable());

              // Check if biometric authentication is enabled
              final biometricEnabledResult =
                  await _localAuthRepository.isBiometricEnabled();
              biometricEnabledResult.fold(
                (failure) {
                  emit(BiometricCheckFailed()); // Emit a failure state
                },
                (isBiometricEnabled) {
                  if (!isBiometricEnabled) {
                    emit(
                        BiometricDisabled()); // Emit state for disabled biometric
                  } else {
                    emit(
                        BiometricEnabled()); // Emit state for enabled biometric
                  }
                },
              );
            }
          },
        );
      } else {
        emit(AuthAuthenticated());
      }
    }
  }

  Future<void> _onLogout(
      AuthLogoutReuqestEvenet event, Emitter<AuthState> emit) async {
    try {
      emit(LoggingOut());
      await Future.delayed(const Duration(seconds: 2));
      await _authRepository.logout();
      emit(LogOutSuccessful());
    } catch (e) {
      emit(LogOutFailed());
    }
  }

  Future<void> _onCheckIfBiometricEnabled(
      CheckIfBiometricEnabled event, Emitter<AuthState> emit) async {
    final biometricEnabledResult =
        await _localAuthRepository.isBiometricEnabled();
    biometricEnabledResult.fold(
      (failure) => emit(BiometricCheckFailed()), // Emit failure state
      (isBiometricEnabled) {
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
      (failure) => emit(BiometricUnauthenticated()), // Handle failure
      (isAuthenticated) {
        if (isAuthenticated) {
          emit(BiometricAuthenticated());
        } else {
          emit(BiometricUnauthenticated());
        }
      },
    );
  }

  Future<void> _onToggleBiometricLogin(
      ToggleBiometricLogin event, Emitter<AuthState> emit) async {
    try {
      await _localAuthRepository.enableBiometric(event.enbale);
      emit(event.enbale ? BiometricEnabled() : BiometricDisabled());
    } catch (e) {
      emit(BiometricCheckFailed()); // Emit failure state
    }
  }
}
