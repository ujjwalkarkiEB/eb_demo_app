import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:eb_demo_app/core/utils/base/base_remote_source.dart';
import 'package:eb_demo_app/core/utils/constants/strings.dart';
import 'package:eb_demo_app/core/utils/network/client/dio_client.dart';
import 'package:injectable/injectable.dart';

abstract class AuthRemoteSource {
  Future<String> signInUser({required String email, required String password});
  Future<String> signUpUser(
      {required String email,
      required String username,
      required String password,
      required String repeatedPassword});
  Future<void> refreshToken({required String refreshToken});
  Future<void> logout();
  Future<void> logoutFromAllDevices();
  Future<void> changePassword(
      {required String oldPassword, required String newPassword});
  Future<void> resetPasswordEmail({required String email});
  Future<void> resetPassword(
      {required String token, required String newPassword});
  Future<void> verifyAuthenticatorOtp({required String otp});
  Future<void> verifyOtp(
      {required String otp,
      required String userId,
      required bool isOtpResentForRegister});
  Future<void> resendOtp({required String userID});
}

@LazySingleton(as: AuthRemoteSource)
class AuthRemoteSourceImpl extends BaseRemoteSource
    implements AuthRemoteSource {
  AuthRemoteSourceImpl(DioClient client) : super(client.dio);

  @override
  Future<void> changePassword({
    required String oldPassword,
    required String newPassword,
  }) {
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
    return networkRequest<void>(
      request: (dio) async {
        return await dio.post(
          '/account/resend-otp/',
          data: {"userId": userID, "otpType": "ResendRegisterOtp"},
        );
      },
      responseType: false,
    );
  }

  @override
  Future<void> resetPassword({
    required String token,
    required String newPassword,
  }) {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }

  @override
  Future<void> resetPasswordEmail({required String email}) {
    return networkRequest<String?>(
      request: (dio) async {
        return await dio.post(
          '/account/password-reset',
          data: {
            "email": email,
          },
        );
      },
      onResponse: (data) {
        final Map<String, dynamic>? sucessData = data['data'];
        if (sucessData != null) {
          return sucessData['userId'];
        }
      },
    );
  }

  @override
  Future<String> signInUser({
    required String email,
    required String password,
  }) async {
    return networkRequest<String>(
        request: (dio) => dio.post(
              '/account/login',
              data: {"email": email, "password": password},
            ),
        onResponse: (data) {
          final tokens = {
            "accessToken": data[accessTokenKey],
            "refreshToken": data[refreshTokenKey],
          };

          return json.encode(tokens);
        });
  }

  @override
  Future<void> verifyAuthenticatorOtp({required String otp}) {
    // TODO: implement verifyAuthenticatorOtp
    throw UnimplementedError();
  }

  @override
  Future<String> signUpUser({
    required String email,
    required String username,
    required String password,
    required String repeatedPassword,
  }) async {
    print('inside remet srvice');
    return networkRequest<String>(
      request: (dio) async {
        final formData = FormData.fromMap({
          'userName': username,
          'email': email,
          'password': password,
          'repeat_password': repeatedPassword,
        });
        final response = await dio.post(
          '/account/register',
          data: formData,
        );
        return response;
      },
      onResponse: (data) {
        return data['data']["userId"];
      },
    );
  }

  @override
  Future<void> verifyOtp(
      {required String otp,
      required String userId,
      required bool isOtpResentForRegister}) async {
    return networkRequest<void>(
      request: (dio) async {
        return await dio.post(
          '/account/verify-user-email/',
          data: {
            "userId": userId,
            "otp": otp,
            "otpType": isOtpResentForRegister ? "ResendRegisterOtp" : "Register"
          },
        );
      },
      responseType: false,
    );
  }
}
