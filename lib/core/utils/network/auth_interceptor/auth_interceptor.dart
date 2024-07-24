// import 'package:auhentication_gql/common/logger/logger.dart';
// import 'package:auhentication_gql/core/utils/helpers/token_manager.dart';
// import 'package:dio/dio.dart';
// import 'package:injectable/injectable.dart';

// @lazySingleton
// class AuthInterceptor extends QueuedInterceptorsWrapper {
//   AuthInterceptor(this._tokenManager);
//   final TokenManager _tokenManager;

//   @override
//   void onError(DioException err, ErrorInterceptorHandler handler) async {
//     if (err.response?.statusCode == 403 || err.response?.statusCode == 401) {
//       logger.d('Refreshing token ...');
//       final RequestOptions options = err.requestOptions;
//       final bool isRefreshed = await _tokenManager.refreshToken();
//       logger.d('Refreshed Status: $isRefreshed ');

//       if (!isRefreshed) {
//         // terminate this request by returning error to the caller
//         return handler.reject(err);
//       } else {
//         final String? accessToken = await _tokenManager.getAccessToken();
//         options.headers['Authorization'] = 'Bearer ${accessToken!}';
//         try {
//           final Response<Map<String, dynamic>> response =
//               await _tokenManager.fetch(options);

//           return handler.resolve(response);
//         } on DioException catch (e) {
//           // If an error occurs during the retry, pass it to the next error handler
//           handler.next(e);
//           return;
//         }
//       }
//     }
//     // If the error is not related to authorization, pass it to the next error handler
//     handler.next(err);
//   }

//   @override
//   void onRequest(
//       RequestOptions options, RequestInterceptorHandler handler) async {
//     final String? token = await _tokenManager.getAccessToken();

//     if (token != null) {
//       // final bool hasSession = await _tokenManager.hasSession();
//       // log("accessToken session status: $hasSession");
//       options.headers['Authorization'] = 'Bearer $token';
//     }

//     handler.next(options);
//   }
// }
