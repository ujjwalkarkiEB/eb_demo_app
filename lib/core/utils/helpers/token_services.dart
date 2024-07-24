import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:eb_demo_app/core/utils/network/client/dio_client.dart';
import 'package:eb_demo_app/src/features/authentication/data/data_source/local/auth_database_service.dart';
import 'package:injectable/injectable.dart';
import 'package:jwt_decode/jwt_decode.dart';

abstract class TokenService {
  Future<String?> getAccessToken();
  Future<String?> getRefreshToken();
  Future<void> clearTokens();
  Future<bool> refreshToken();
  Future<void> storeToken({String? refreshToken, String? accessToken});
  Future<bool> isAuthenticated();
  Future<bool> hasSession();
}

@lazySingleton
class TokenServiceImpl implements TokenService {
  TokenServiceImpl(this._databaseService, this._client);
  final AuthDatabaseService _databaseService;
  final DioClient _client;

  @override
  Future<void> storeToken({String? refreshToken, String? accessToken}) async {
    await _databaseService.storeToken(
        refreshToken: refreshToken, accessToken: accessToken);
  }

  @override
  Future<String?> getAccessToken() async {
    return await _databaseService.getToken(isAccessToken: true);
  }

  @override
  Future<String?> getRefreshToken() async {
    return await _databaseService.getToken(isAccessToken: false);
  }

  @override
  Future<void> clearTokens() async {
    await _databaseService.clearToken();
  }

  @override
  Future<bool> isAuthenticated() async {
    return await _databaseService.chechIfTokenExist();
  }

  @override
  Future<bool> refreshToken() async {
    try {
      final String? refreshToken = await getRefreshToken();
      if (refreshToken == null) {
        return false;
      }
      if (Jwt.isExpired(refreshToken)) {
        return false;
      }

      final response = await _client.dio
          .post('/account/token/refresh', data: {"refreshToken": refreshToken});
      final String? token = response.data['refreshToken'];
      if (token != null) {
        await storeToken(accessToken: token);
        return true;
      }
      return false;
    } catch (e) {
      throw 'Error while refreshing token : ${e.toString()}';
    }
  }

  @override
  Future<bool> hasSession() async {
    try {
      final String? accessToken = await getAccessToken();

      if (accessToken != null) {
        return Jwt.isExpired(accessToken);
      }
      return false;
    } catch (e) {
      log('Error checking token session: ${e.toString()} ');
      throw 'Error: session check';
    }
  }

  Future<Response<Map<String, dynamic>>> fetch(RequestOptions options) async {
    try {
      final Response<Map<String, dynamic>> response = await _client.dio.request(
        options.path,
        data: options.data,
        options: Options(
          headers: options.headers,
          method: options.method,
        ),
      );

      return response;
    } catch (e) {
      throw ApiException.fromDioError(e as DioException);
    }
  }
}
