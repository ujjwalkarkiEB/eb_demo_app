import 'package:dio/dio.dart';
import 'package:ferry/ferry.dart';

import '../../error/exception/api_exception.dart' as apiexception;

abstract class BaseGraphQLRemoteSource {
  final Client _client;

  BaseGraphQLRemoteSource(this._client);

  /// Handles GraphQL requests and responses, including error handling.
  ///
  /// [request] A function that takes a [Client] instance and returns a [Future<OperationResponse>].
  /// [onResponse] callback allows you to transform or process the data returned by the API before it's returned from the networkRequest
  Future<T> graphqlRequest<T>({
    required Future<OperationResponse> Function(Client client) request,
    T Function(dynamic data)? onResponse,
  }) async {
    try {
      final response = await request(_client);

      if (response.hasErrors) {
        final String errorMsg =
            response.graphqlErrors?.first.message ?? "unknown server error";
        throw apiexception.ServerException(errorMsg);
      }

      if (onResponse != null) {
        return onResponse(response.data);
      } else {
        return response.data as T;
      }
    } on DioException catch (e) {
      print('Graphql N/W Dio Error: ${e.message}');

      throw apiexception.ApiException.fromDioError(e);
    } catch (e) {
      print('Graphql N/W Error: ${e.toString()}');
      throw apiexception.UnknownException(e.toString());
    }
  }
}
