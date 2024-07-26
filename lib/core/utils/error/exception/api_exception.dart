import 'package:dio/dio.dart';
import 'package:eb_demo_app/core/utils/error/model/error_model.dart';

abstract class ApiException implements Exception {
  final String message;
  final int? statusCode;
  final String? errorData;

  ApiException(this.message, [this.statusCode, this.errorData]);

  factory ApiException.fromDioError(DioException dioError) {
    if (dioError.response != null) {
      final statusCode = dioError.response?.statusCode;
      final errorModel = ErrorModel.fromJson(dioError.response?.data);
      final errorMessage = errorModel.message;

      switch (statusCode) {
        case 400:
          if (errorModel.code != null) {
            switch (errorModel.code) {
              case 'not-verified':
                return BadRequestException(
                    errorMessage, statusCode, errorModel.userId);
              default:
                return BadRequestException(errorMessage, statusCode);
            }
          }
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
      case DioExceptionType.cancel:
        return NetworkException('Request to API was cancelled');
      case DioExceptionType.badCertificate:
      case DioExceptionType.badResponse:
      case DioExceptionType.unknown:
        return NetworkException(
            'Connection to API failed due to internet connection.');
      default:
        return UnknownException(dioError.message ?? 'Unknown Server Error');
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
  BadRequestException(super.message, [super.statusCode, super.errorData]);
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
