import 'package:dio/dio.dart';
import 'package:eb_demo_app/core/config/injection/injection.dart';
import 'package:eb_demo_app/core/utils/helpers/token_services.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AuthInterceptor extends QueuedInterceptorsWrapper {
  // @override
  // void onError(DioException err, ErrorInterceptorHandler handler) async {
  //   if (err.response?.statusCode == 403 || err.response?.statusCode == 401) {
  //     final tokenService = getIt<TokenService>();
  //     log('Refreshing token ...');
  //     final RequestOptions options = err.requestOptions;
  //     final bool isRefreshed = await tokenService.refreshToken();
  //     log('Refreshed Status: $isRefreshed ');

  //     if (!isRefreshed) {
  //       // terminate this request by returning error to the caller
  //       return handler.reject(err);
  //     } else {
  //       final String? accessToken = await tokenService.getAccessToken();
  //       options.headers['Authorization'] = 'Bearer ${accessToken!}';
  //       try {
  //         // final Response<Map<String, dynamic>> response =
  //         //     await _tokenManager.fetch(options);

  //         // return handler.resolve(response);
  //       } on DioException catch (e) {
  //         // If an error occurs during the retry, pass it to the next error handler
  //         handler.next(e);
  //         return;
  //       }
  //     }
  //   }
  //   // If the error is not related to authorization, pass it to the next error handler
  //   handler.next(err);
  // }

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final tokenService = getIt<TokenService>();
    final token = await tokenService.getAccessToken();

    if (token != null) {
      final bool isExpired = await tokenService.hasSession(token);
      print('token: $token');

      if (isExpired) {
        final isRefreshed = await tokenService.refreshToken();

        if (!isRefreshed) {
          return handler.reject(DioException(
              requestOptions: options,
              error: 'Token refresh failed',
              type: DioExceptionType.cancel,
              response: Response(
                requestOptions: options,
                statusCode: 401, // Unauthorized
                statusMessage: 'Unauthorized',
              )));
        }
        final String? newToken = await tokenService.getAccessToken();

        options.headers['Authorization'] = 'Bearer $newToken';
      } else {
        options.headers['Authorization'] = 'Bearer $token';
      }
    }

    handler.next(options);
  }
}
