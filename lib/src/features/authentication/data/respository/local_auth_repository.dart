import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:eb_demo_app/core/config/injection/injection.dart';
import 'package:eb_demo_app/core/utils/helpers/token_services.dart';
import 'package:injectable/injectable.dart';
import 'package:local_auth/local_auth.dart';

import '../../../../../core/utils/error/failure/failure.dart';
import '../../../../../core/utils/local_auth/local_auth_services.dart';

abstract class LocalAuthRepository {
  Future<Either<Failure, bool>> isBiometricAvailable();
  Future<Either<Failure, List<BiometricType>>> getAvailableBiometrics();
  Future<Either<Failure, String>> loginWithBiometric();
  Future<Either<Failure, Unit>> enableBiometric(bool enable);
  Future<Either<Failure, bool>> isBiometricEnabled();
}

@LazySingleton(as: LocalAuthRepository)
class LocalAuthRepositoryImpl implements LocalAuthRepository {
  final LocalAuthService _localAuthService;

  LocalAuthRepositoryImpl(this._localAuthService);

  @override
  Future<Either<Failure, bool>> isBiometricAvailable() async {
    try {
      final bool result = await _localAuthService.isBiometricAvailable();
      return Right(result);
    } catch (e) {
      log("Error checking biometric availability: $e");
      return const Left(
          UnknownFailure("Unable to check biometric availability."));
    }
  }

  @override
  Future<Either<Failure, List<BiometricType>>> getAvailableBiometrics() async {
    try {
      final biometrics = await _localAuthService.getAvailableBiometrics();
      return Right(biometrics);
    } catch (e) {
      log("Error getting available biometrics: $e");
      return const Left(UnknownFailure("Unable to get available biometrics."));
    }
  }

  @override
  Future<Either<Failure, String>> loginWithBiometric() async {
    try {
      final tokenService = getIt<TokenService>();
      final bool isAuthenticated = await _localAuthService.authenticateUser();
      if (isAuthenticated) {
        final isRefreshedNewToken = await tokenService.refreshToken();
        if (!isRefreshedNewToken) {
          return left(const ServerFailure(
              'Session expired! Please login by credentials'));
        }
        return const Right('Successful authentication');
      } else {
        return const Left(UnknownFailure("Authentication failed."));
      }
    } catch (e) {
      log("Error during authentication: $e");
      return const Left(UnknownFailure("Authentication failed."));
    }
  }

  @override
  Future<Either<Failure, Unit>> enableBiometric(bool enable) async {
    try {
      await _localAuthService.enableBiometric(enable);
      return const Right(unit);
    } catch (e) {
      log("Error enabling biometric: $e");
      return Left(UnknownFailure("Unable to enable biometric authentication."));
    }
  }

  @override
  Future<Either<Failure, bool>> isBiometricEnabled() async {
    try {
      final bool result = await _localAuthService.isBiometricEnabled();
      return Right(result);
    } catch (e) {
      log("Error checking if biometric is enabled: $e");
      return Left(UnknownFailure("Unable to check if biometric is enabled."));
    }
  }
}
