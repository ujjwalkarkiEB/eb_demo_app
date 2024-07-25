import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:eb_demo_app/core/utils/error/exception/api_exception.dart';
import 'package:eb_demo_app/src/features/authentication/data/data_source/local/auth_database_service.dart';
import 'package:eb_demo_app/src/features/authentication/data/data_source/remote/auth_remote_service.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/utils/error/failure/failure.dart';

abstract class AuthRepository {
  bool isAuthenticated();
  bool isFirstVisit();
  Future<void> setVisitFlag();
  Future<Either<Failure, String>> registerUser(
      String username, String email, String password, String repeatPassword);
  Future<Either<Failure, void>> login(String email, String password);
  Future<Either<Failure, void>> verifyOtp(String userID, String otp);
}

@LazySingleton(as: AuthRepository)
class AuthReposeitoryImpl extends AuthRepository {
  final AuthRemoteSource _authRemoteSource;
  final AuthDatabaseService _authDatabaseService;

  AuthReposeitoryImpl(
      {required AuthRemoteSource authRemoteSource,
      required AuthDatabaseService authDatabaseService})
      : _authRemoteSource = authRemoteSource,
        _authDatabaseService = authDatabaseService;

  @override
  bool isAuthenticated() {
    return _authDatabaseService.chechIfTokenExist();
  }

  @override
  bool isFirstVisit() {
    return _authDatabaseService.chechIfFirstVisit();
  }

  @override
  Future<void> setVisitFlag() async {
    await _authDatabaseService.setAppVisitFlag();
  }

  @override
  Future<Either<Failure, void>> login(String email, String password) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> registerUser(String username, String email,
      String password, String repeatPassword) async {
    try {
      final userID = await _authRemoteSource.signUpUser(
          email: email,
          username: username,
          password: password,
          repeatedPassword: repeatPassword);
      return Right(userID);
    } on ApiException catch (err) {
      print("${err.toString()}");

      if (err is ServerException) {
        return Left(ServerFailure(err.message));
      }
      return const Left(ServerFailure('Something Went wrong'));
    } catch (err) {
      print("${err.toString()}");

      return const Left(UnkownFailure('Something went wrong !'));
    }
  }

  @override
  Future<Either<Failure, void>> verifyOtp(String userID, String otp) async {
    try {
      await _authRemoteSource.verifyOtp(otp: otp, userId: userID);
      return right(null);
    } on ApiException catch (err) {
      if (err is ServerException) {
        return Left(ServerFailure(err.message));
      }
      return const Left(ServerFailure('Something went wrong'));
    } catch (err) {
      return const Left(UnkownFailure('Something went wrong !'));
    }
  }
}
