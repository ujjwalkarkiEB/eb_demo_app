import 'package:eb_demo_app/core/utils/base/base_remote_source.dart';

import '../../../../../../core/utils/network/client/dio_client.dart';
import '../../model/user.dart';

class ChatRemoteSource extends BaseRemoteSource {
  ChatRemoteSource(DioClient client) : super(client.dio);

  // Future<List<User>> getOnlineUsers() async {
  //   return networkRequest(request: (dio) => dio.get('path'),)
  // }
}
