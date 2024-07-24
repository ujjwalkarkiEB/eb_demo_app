import 'package:dio/dio.dart';
import 'package:eb_demo_app/core/utils/constants/strings.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DioClient {
  DioClient(AuthInterceptor authInterceptor)
      : _dio = Dio(BaseOptions(
            baseUrl: authServerBaseUrl,
            connectTimeout: const Duration(seconds: 6000),
            receiveTimeout: const Duration(seconds: 6000),
            contentType: 'application/json',
            responseType: ResponseType.json)) {
    _dio.interceptors.add(authInterceptor);
  }
  final Dio _dio;

  Dio get dio => _dio;
}
