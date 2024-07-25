import 'package:dio/dio.dart';

class ApiException implements Exception {
  final String message;
  final int? statusCode;
  final String? errorDetail;

  ApiException({
    required this.message,
    this.statusCode,
    this.errorDetail,
  });

  factory ApiException.fromDioError(DioException error) {
    String errorMessage = 'Unknown error occurred';
    int? statusCode;
    String? errorDetail;

    if (error.response != null) {
      statusCode = error.response?.statusCode;
      errorDetail = _extractErrorDetail(error.response?.data);
    }

    switch (error.type) {
      case DioExceptionType.cancel:
        errorMessage = 'Request cancelled';
        break;
      case DioExceptionType.connectionTimeout:
        errorMessage = 'Connection timeout';
        break;
      case DioExceptionType.sendTimeout:
        errorMessage = 'Send timeout';
        break;
      case DioExceptionType.receiveTimeout:
        errorMessage = 'Receive timeout';
        break;
      case DioExceptionType.badResponse:
        if (statusCode == 400) {
          errorMessage = '$errorDetail';
        } else if (statusCode == 401 || statusCode == 403) {
          errorMessage = 'Unauthorized';
          return ApiException.unauthorizedError(
              message: errorMessage,
              statusCode: statusCode,
              errorDetail: errorDetail);
        } else {
          errorMessage = 'HTTP error: $statusCode';
        }
        break;
      case DioExceptionType.unknown:
        errorMessage = 'Network error';
        break;
      case DioExceptionType.badCertificate:
        errorMessage = 'Incorrect certificate';
        break;
      case DioExceptionType.connectionError:
        errorMessage = 'Connection error';
        break;
    }
    return ApiException.serverError(
        message: errorMessage,
        statusCode: statusCode,
        errorDetail: errorDetail);
  }

  static String? _extractErrorDetail(dynamic data) {
    if (data is Map<String, dynamic>) {
      // Extract the first error message from the 'errors' map
      print('data: $data');
      final errors = data['errors'];
      if (errors is Map<String, dynamic>) {
        return errors['msg'];
      }
    }
    return null;
  }

  static ApiException serverError(
          {required String message, int? statusCode, String? errorDetail}) =>
      ApiException(
          message: message, statusCode: statusCode, errorDetail: errorDetail);

  static ApiException connectionError(
          {required String message, int? statusCode, String? errorDetail}) =>
      ApiException(
          message: 'Connection error: $message',
          statusCode: statusCode,
          errorDetail: errorDetail);

  static ApiException invalidResponse(
          {required String message, int? statusCode, String? errorDetail}) =>
      ApiException(
          message: 'Invalid response: $message',
          statusCode: statusCode,
          errorDetail: errorDetail);

  static ApiException unauthorizedError(
          {required String message, int? statusCode, String? errorDetail}) =>
      ApiException(
          message: 'Unauthorized: $message',
          statusCode: statusCode,
          errorDetail: errorDetail);

  static ApiException clientError(
          {required String message, int? statusCode, String? errorDetail}) =>
      ApiException(
          message: 'Client error: $message',
          statusCode: statusCode,
          errorDetail: errorDetail);

  static ApiException timeoutError(
          {required String message, int? statusCode, String? errorDetail}) =>
      ApiException(
          message: 'Timeout error: $message',
          statusCode: statusCode,
          errorDetail: errorDetail);

  static ApiException unknownError(
          {required String message, int? statusCode, String? errorDetail}) =>
      ApiException(
          message: 'Unknown error: $message',
          statusCode: statusCode,
          errorDetail: errorDetail);

  @override
  String toString() =>
      'ApiException: $message${statusCode != null ? ' (Status Code: $statusCode)' : ''}${errorDetail != null ? ' - Detail: $errorDetail' : ''}';
}
