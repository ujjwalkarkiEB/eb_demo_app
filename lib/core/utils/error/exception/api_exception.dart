import 'package:dio/dio.dart';

/// Base class for all API exceptions.
abstract class ApiException implements Exception {
  final String message;
  final int? statusCode;

  ApiException(this.message, [this.statusCode]);

  factory ApiException.fromDioError(DioException dioError) {
    if (dioError.response != null) {
      final statusCode = dioError.response?.statusCode;
      final errorMessage =
          dioError.response?.data['msg'] ?? 'Unknown server error';

      switch (statusCode) {
        case 400:
          return BadRequestException(errorMessage, statusCode);
        case 401:
          return UnauthorizedException(errorMessage, statusCode);
        case 403:
          return ForbiddenException(errorMessage, statusCode);
        case 404:
          return NotFoundException(errorMessage, statusCode);
        case 500:
          return InternalServerErrorException(errorMessage, statusCode);
        default:
          return ServerException(errorMessage, statusCode);
      }
    }

    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return NetworkException('Network timeout, please try again.');
      default:
        return UnknownException(dioError.message ?? 'Unkown Server Error');
    }
  }

  @override
  String toString() =>
      'ApiException: $message${statusCode != null ? ' (Status Code: $statusCode)' : ''}';
}

/// Exception thrown for server-side errors.
class ServerException extends ApiException {
  ServerException(super.message, [super.statusCode]);
}

/// Exception thrown for network errors.
class NetworkException extends ApiException {
  NetworkException(super.message);
}

/// Exception thrown for bad requests.
class BadRequestException extends ApiException {
  BadRequestException(super.message, [super.statusCode]);
}

/// Exception thrown for unauthorized access.
class UnauthorizedException extends ApiException {
  UnauthorizedException(super.message, [super.statusCode]);
}

/// Exception thrown for forbidden access.
class ForbiddenException extends ApiException {
  ForbiddenException(super.message, [super.statusCode]);
}

/// Exception thrown when a resource is not found.
class NotFoundException extends ApiException {
  NotFoundException(super.message, [super.statusCode]);
}

/// Exception thrown for internal server errors.
class InternalServerErrorException extends ApiException {
  InternalServerErrorException(super.message, [super.statusCode]);
}

/// Exception thrown for unknown errors.
class UnknownException extends ApiException {
  UnknownException(super.message);
}
