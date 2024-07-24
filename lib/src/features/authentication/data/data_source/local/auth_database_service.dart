import 'dart:developer';

import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/utils/constants/strings.dart';
import '../../../../../../core/utils/helpers/database_helper.dart';

@lazySingleton
class AuthDatabaseService {
  AuthDatabaseService({required DatabaseHelper databaseHelper})
      : _databaseHelper = databaseHelper;

  final DatabaseHelper _databaseHelper;

  Future<void> storeToken({String? refreshToken, String? accessToken}) async {
    try {
      final Box<String> authBox = _databaseHelper.authBox;

      if (refreshToken != null) {
        await authBox.put(refreshTokenKey, refreshToken);
      }

      if (accessToken != null) {
        await authBox.put(accessTokenKey, accessToken);
      }
    } catch (e) {
      log('Error saving token: $e');
    }
  }

  Future<String?> getToken({bool isAccessToken = true}) async {
    try {
      final Box<String> authBox = _databaseHelper.authBox;
      final String tokenKey = isAccessToken ? accessTokenKey : refreshTokenKey;
      final String? token = authBox.get(tokenKey);

      return token;
    } catch (e) {
      throw Exception('Error Getting Token: ${e.toString()}');
    }
  }

  Future<void> clearToken() async {
    try {
      final Box<String> authBox = _databaseHelper.authBox;
      await authBox.clear();
    } catch (e) {
      throw Exception('Error Clearing Token: ${e.toString()}');
    }
  }

  Future<bool> chechIfTokenExist() async {
    final Box<String> authBox = _databaseHelper.authBox;
    if (authBox.get(accessTokenKey) != null) {
      return true;
    }
    return false;
  }
}
