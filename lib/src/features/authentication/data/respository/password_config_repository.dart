import 'package:dartz/dartz.dart';
import 'package:eb_demo_app/core/utils/error/exception/api_exception.dart';
import 'package:eb_demo_app/core/utils/error/failure/failure.dart';
import 'package:eb_demo_app/src/features/authentication/data/data_source/remote/auth_remote_service.dart';
import 'package:injectable/injectable.dart';

abstract class PasswordConfigRepository {
  PasswordConfigRepository();
  Future<Either<Failure, Map<String, String>>> sendPasswordResetEmail(
      {required String email});
  Future<Either<Failure, String>> verifyPasswordResetOtp(
      {required String otp, required String userId});
  Future<Either<Failure, String>> resetPassword(
      {required String oid,
      required String token,
      required String newPassword});
}

@LazySingleton(as: PasswordConfigRepository)
class PasswordConfigRepositoryImpl implements PasswordConfigRepository {
  final AuthRemoteSource _authRemoteSource;

  PasswordConfigRepositoryImpl(this._authRemoteSource);

  @override
  Future<Either<Failure, Map<String, String>>> sendPasswordResetEmail(
      {required String email}) async {
    try {
      final otpVerificationData =
          await _authRemoteSource.resetPasswordEmail(email: email);
      if (otpVerificationData == null) {
        return left(
            const ServerFailure('Please provide your registered email!'));
      }
      return right(otpVerificationData);
    } on ApiException {
      return left(const ServerFailure('Something went wrong!'));
    } catch (e) {
      return left(const UnknownFailure('Something went wrong!'));
    }
  }

  @override
  Future<Either<Failure, String>> verifyPasswordResetOtp({
    required String otp,
    required String userId,
  }) async {
    try {
      await _authRemoteSource.verifyOtp(
        otp: otp,
        userId: userId,
        isOtpResentForRegister: false,
        otpType: 'PasswordResetOtp',
      );
      return right('Otp is verified!');
    } catch (e) {
      return left(const UnknownFailure('Something went wrong!'));
    }
  }

  @override
  Future<Either<Failure, String>> resetPassword(
      {required String oid,
      required String token,
      required String newPassword}) async {
    try {
      await _authRemoteSource.resetPassword(
          oid: oid, token: token, newPassword: newPassword);
      return right('Password reset is successful!');
    } on ApiException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      return const Left(UnknownFailure('Something went wrong !'));
    }
  }
}
