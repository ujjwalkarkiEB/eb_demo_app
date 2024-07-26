import 'package:eb_demo_app/core/utils/constants/strings.dart';
import 'package:ferry/ferry.dart';
import 'package:gql_dio_link/gql_dio_link.dart';
import 'package:injectable/injectable.dart';

import 'dio_client.dart';

@lazySingleton
class GraphqlClient {
  GraphqlClient({required DioClient dioClient})
      : client =
            Client(link: DioLink(ecommercerBaseUrl, client: dioClient.dio));

  final Client client;

  Client get gqlClient => client;
}
