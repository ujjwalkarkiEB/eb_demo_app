import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:eb_demo_app/core/utils/constants/strings.dart';
import 'package:eb_demo_app/core/utils/error/exception/api_exception.dart';
import 'package:eb_demo_app/core/utils/network/client/dio_client.dart';
import 'package:injectable/injectable.dart';

abstract class AuthApiService {
  Future<String> signInUser({required String email, required String password});
  Future<String> signUpUser(
      {required String email,
      required String username,
      required String password,
      required repeatedPassword});
  Future<void> refreshToken({required String refreshToken});
  Future<void> logout();
  Future<void> logoutFromAllDevices();
  Future<void> changePassword(
      {required String oldPassword, required String newPassword});
  Future<void> resetPasswordEmail({required String email});
  Future<void> resetPassword(
      {required String token, required String newPassword});
  Future<void> verifyAuthenticatorOtp({required String otp});
  Future<void> verifyOtp({required String otp, required String userId});
  Future<void> resendOtp({required String userID});
}

@LazySingleton(as: AuthApiService)
class AuthApiServiceImpl extends AuthApiService {
  final DioClient _client;

  AuthApiServiceImpl({required DioClient client}) : _client = client;
  @override
  Future<void> changePassword(
      {required String oldPassword, required String newPassword}) {
    // TODO: implement changePassword
    throw UnimplementedError();
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<void> logoutFromAllDevices() {
    // TODO: implement logoutFromAllDevices
    throw UnimplementedError();
  }

  @override
  Future<void> refreshToken({required String refreshToken}) {
    // TODO: implement refreshToken
    throw UnimplementedError();
  }

  @override
  Future<void> resendOtp({required String userID}) async {
    try {
      await _client.dio.post('/api/account/resend-otp/',
          data: {"userId": userID, "otpType": "ResendRegisterOtp"});
    } catch (e) {
      if (e is DioException) {
        print(e.response);
        throw ApiException.fromDioError(e);
      }
      throw ApiException.unknownError(message: e.toString());
    }
  }

  @override
  Future<void> resetPassword(
      {required String token, required String newPassword}) {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }

  @override
  Future<void> resetPasswordEmail({required String email}) {
    // TODO: implement resetPasswordEmail
    throw UnimplementedError();
  }

  @override
  Future<String> signInUser(
      {required String email, required String password}) async {
    try {
      final response = await _client.dio
          .post('/account/login', data: {"email": email, "password": password});
      if (response.statusCode == 200) {
        final tokens = {
          "accessToken": response.data[accessTokenKey],
          "refreshToken": response.data[refreshTokenKey],
        };
        return json.encode(tokens);
      }
      throw ApiException.invalidResponse(message: 'invalid');
    } catch (e) {
      if (e is DioException) {
        throw ApiException.fromDioError(e);
      }
      throw ApiException.unknownError(message: e.toString());
    }
  }

  @override
  Future<void> verifyAuthenticatorOtp({required String otp}) {
    // TODO: implement verifyAuthenticatorOtp
    throw UnimplementedError();
  }

  @override
  Future<String> signUpUser(
      {required String email,
      required String username,
      required String password,
      required repeatedPassword}) async {
    try {
      final formData = FormData.fromMap({
        'userName': username,
        'email': email,
        'password': password,
        'repeat_password': repeatedPassword
      });

      final resonse = await _client.dio.post(
        "/account/register",
        data: formData,
      );
      return resonse.data['data']["userId"];
    } catch (err) {
      if (err is DioException) {
        throw ApiException.fromDioError(err);
      }
      throw ApiException.unknownError(message: err.toString());
    }
  }

  @override
  Future<void> verifyOtp({required String otp, required String userId}) async {
    try {
      await _client.dio.post('/account/verify-user-email/',
          data: {"userId": userId, "otp": otp, "otpType": "Register"});
    } catch (e) {
      if (e is DioException) {
        print(e.response);
        throw ApiException.fromDioError(e);
      }
      throw ApiException.unknownError(message: e.toString());
    }
  }
}
