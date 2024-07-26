import 'package:dio/dio.dart';
import 'package:eb_demo_app/core/utils/error/exception/api_exception.dart';

abstract class BaseRemoteSource {
  final Dio _dio;

  BaseRemoteSource(this._dio);

  /// Handles network requests and responses, including error handling.
  ///
  /// [request] A function that takes a [Dio] instance and returns a [Future<Response>].
  /// [onResponse] callback allows you to transform or process the data returned by the API before it's returned from the networkRequest
  /// [responseType] Indicates if the request should expect a response body.
  /// If `true`, `onResponse` will process the response body. Otherwise, it will ignore the response body.
  Future<T> networkRequest<T>({
    required Future<Response> Function(Dio dio) request,
    T Function(dynamic data)? onResponse,
    bool responseType = true,
  }) async {
    try {
      final response = await request(_dio);

      if (response.statusCode! >= 200 || response.statusCode! < 300) {
        if (responseType && onResponse != null) {
          return onResponse(response.data);
        } else {
          return response as T;
        }
      } else {
        throw ServerException('Something went wrong');
      }
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } catch (e) {
      throw UnknownException(e.toString());
    }
  }
}
