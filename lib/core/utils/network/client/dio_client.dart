import 'package:dio/dio.dart';
import 'package:eb_demo_app/core/utils/constants/strings.dart';
import 'package:injectable/injectable.dart';

import '../auth_interceptor/auth_interceptor.dart';

@lazySingleton
class DioClient {
  final AuthInterceptor authInterceptor;
  DioClient(this.authInterceptor)
      : _dio = Dio(BaseOptions(
          baseUrl: authServerBaseUrl,
          connectTimeout: const Duration(seconds: 3),
          receiveTimeout: const Duration(seconds: 3),
          responseType: ResponseType.json,
        )) {
    _dio.interceptors.add(authInterceptor);
  }
  final Dio _dio;

  Dio get dio => _dio;
}
