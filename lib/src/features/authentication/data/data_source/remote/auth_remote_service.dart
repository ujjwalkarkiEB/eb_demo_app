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
  Future<void> logout({required String refershToken});
  Future<void> resetPassword(
      {required String oid,
      required String token,
      required String newPassword});
  Future<Map<String, String>?> resetPasswordEmail({required String email});

  Future<void> verifyAuthenticatorOtp({required String otp});
  Future<void> verifyOtp({
    required String otp,
    required String userId,
    required bool isOtpResentForRegister,
    String? otpType,
  });
  Future<void> resendOtp({required String userID});
}

@LazySingleton(as: AuthRemoteSource)
class AuthRemoteSourceImpl extends BaseRemoteSource
    implements AuthRemoteSource {
  AuthRemoteSourceImpl(DioClient client) : super(client.dio);

  @override
  Future<void> resetPassword(
      {required String oid,
      required String token,
      required String newPassword}) {
    return networkRequest<void>(
        request: (dio) async {
          return await dio.post(
            '/account/password-reset-confirm',
            data: {
              "oId": oid,
              "token": token,
              "newPassword1": newPassword,
              "newPassword2": newPassword
            },
          );
        },
        responseType: false);
  }

  @override
  Future<void> logout({required String refershToken}) {
    return networkRequest<void>(
      request: (dio) async {
        return await dio
            .post('/account/logout', data: {refreshTokenKey: refershToken});
      },
      responseType: false,
    );
  }

  @override
  Future<void> refreshToken({required String refreshToken}) {
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
  Future<Map<String, String>?> resetPasswordEmail({required String email}) {
    return networkRequest<Map<String, String>?>(
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
          return {
            'userId': sucessData['userId'],
            'token': sucessData['token'],
            'oid': sucessData['oid']
          };
        }
        return null;
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
          final loginData = {
            "accessToken": data['data'][accessTokenKey],
            "refreshToken": data['data'][refreshTokenKey],
            "userID": data['data']['user']['_id']
          };

          return json.encode(loginData);
        });
  }

  @override
  Future<void> verifyAuthenticatorOtp({required String otp}) {
    throw UnimplementedError();
  }

  @override
  Future<String> signUpUser({
    required String email,
    required String username,
    required String password,
    required String repeatedPassword,
  }) async {
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
  Future<void> verifyOtp({
    required String otp,
    required String userId,
    required bool isOtpResentForRegister,
    String? otpType,
  }) async {
    return networkRequest<void>(
      request: (dio) async {
        return await dio.post(
          '/account/verify-user-email/',
          data: {
            "userId": userId,
            "otp": otp,
            "otpType": otpType ??
                (isOtpResentForRegister ? "ResendRegisterOtp" : "Register")
          },
        );
      },
      onResponse: (data) => print('data: $data'),
    );
  }
}
