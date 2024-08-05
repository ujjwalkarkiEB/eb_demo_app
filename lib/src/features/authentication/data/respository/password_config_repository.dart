import 'package:dartz/dartz.dart';
import 'package:eb_demo_app/core/utils/error/exception/api_exception.dart';
import 'package:eb_demo_app/core/utils/error/failure/failure.dart';
import 'package:eb_demo_app/src/features/authentication/data/data_source/remote/auth_remote_service.dart';
import 'package:injectable/injectable.dart';

abstract class PasswordConfigRepository {
  PasswordConfigRepository();
  Future<Either<Failure, String>> sendPasswordResetEmail(
      {required String email});
}

@LazySingleton(as: PasswordConfigRepository)
class PasswordConfigRepositoryImpl implements PasswordConfigRepository {
  final AuthRemoteSource _authRemoteSource;

  PasswordConfigRepositoryImpl(this._authRemoteSource);

  @override
  Future<Either<Failure, String>> sendPasswordResetEmail(
      {required String email}) async {
    try {
      final userID = await _authRemoteSource.resetPasswordEmail(email: email);
      if (userID == null) {
        return left(
            const ServerFailure('Please provide your registered email!'));
      }
      return right(userID);
    } on ApiException {
      return left(const ServerFailure('Something went wrong!'));
    } catch (e) {
      return left(const UnknownFailure('Something went wrong!'));
    }
  }
}
