import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:eb_demo_app/core/utils/constants/strings.dart';
import 'package:eb_demo_app/core/utils/error/exception/api_exception.dart';
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
  Future<bool> hasSession(String token);
}

@LazySingleton(as: TokenService)
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
    return await _databaseService.getToken();
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
    final dio = Dio(BaseOptions(
        baseUrl: authServerBaseUrl,
        connectTimeout: const Duration(seconds: 3),
        receiveTimeout: const Duration(seconds: 3),
        responseType: ResponseType.json,
        contentType: 'application/json'));
    try {
      final String? refreshToken = await getRefreshToken();
      if (refreshToken == null) {
        return false;
      }
      if (Jwt.isExpired(refreshToken)) {
        return false;
      }

      final response = await dio.post('/account/token/refresh',
          data: {refreshTokenKey: refreshToken});

      final String? token = response.data['data'][accessTokenKey];

      if (token != null) {
        await storeToken(accessToken: token);

        return true;
      }
      return false;
    } on DioException catch (e) {
      print('Api error: ${e.message}');
      throw ApiException.fromDioError(e);
    } catch (e) {
      throw 'Error while refreshing token : ${e.toString()}';
    }
  }

  @override
  Future<bool> hasSession(String token) async {
    return Jwt.isExpired(token);
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
      throw '';
      // throw ApiException.fromDioError(e as DioException);
    }
  }
}
