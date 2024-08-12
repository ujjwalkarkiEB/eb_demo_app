import 'dart:convert';
import 'dart:developer';
import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:eb_demo_app/core/utils/constants/strings.dart';
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
  Future<void> logout();

  Future<Either<Failure, void>> verifyOtp(
      String userID, String otp, bool isRedirectedFromLogin);
  Future<Either<Failure, void>> resendOtp(String userID);
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
  Future<Either<Failure, void>> login(String email, String password) async {
    try {
      final response =
          await _authRemoteSource.signInUser(email: email, password: password);
      final result = json.decode(response);
      await _authDatabaseService.storeToken(
        accessToken: result[accessTokenKey],
        refreshToken: result[refreshTokenKey],
      );
      await _authDatabaseService.storeUserId(userID: result[userIdKey]);
      return right(null);
    } on ApiException catch (e) {
      print('login api err: ${e.toString()}');

      if (e is BadRequestException) {
        return Left(ServerFailure(e.message, errorData: e.errorData));
      }
      return const Left(ServerFailure('Something Went wrong'));
    } catch (e) {
      print('login unkown err: ${e.toString()}');

      return const Left(UnknownFailure('Something went wrong!'));
    }
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
      // print("on api reg:  ${err.runtimeType}");
      // print("reg msg:  ${err.message}");

      if (err is BadRequestException) {
        return Left(ServerFailure(err.message));
      }
      print('register api  err: ${err.runtimeType}: ${err.message}');

      return const Left(ServerFailure('Something Went wrong'));
    } catch (err) {
      print('register unkown err: ${err.toString()}');
      return const Left(UnknownFailure('Something went wrong !'));
    }
  }

  @override
  Future<Either<Failure, void>> verifyOtp(
      String userID, String otp, bool isRedirectedFromLogin) async {
    try {
      await _authRemoteSource.verifyOtp(
          otp: otp,
          userId: userID,
          isOtpResentForRegister: isRedirectedFromLogin);
      return right(null);
    } on ApiException catch (err) {
      if (err is BadRequestException) {
        return Left(ServerFailure(err.message));
      }
      return const Left(ServerFailure('Something went wrong'));
    }
  }

  @override
  Future<Either<Failure, void>> resendOtp(String userID) async {
    try {
      await _authRemoteSource.resendOtp(userID: userID);
      return right(null);
    } on ApiException catch (err) {
      if (err is NotFoundException) {
        return Left(ServerFailure(err.message));
      }
      return const Left(ServerFailure('Something went wrong'));
    } catch (e) {
      return const Left(UnknownFailure('Something went wrong !'));
    }
  }

  @override
  Future<void> logout() async {
    try {
      final refreshKey =
          await _authDatabaseService.getToken(isAccessToken: false);
      await _authRemoteSource.logout(refershToken: refreshKey!);
      await _authDatabaseService.clearToken();
    } on ApiException catch (e) {
      throw Exception('Logout Remote error: ${e.message}');
    } catch (e) {
      throw UnknownException('UnkownError while logingout: ${e.toString()}');
    }
  }
}
