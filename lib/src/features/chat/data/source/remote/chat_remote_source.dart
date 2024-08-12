import 'package:eb_demo_app/core/utils/base/base_remote_source.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/utils/network/client/dio_client.dart';
import '../../model/chat.dart';
import '../../model/user.dart';

@lazySingleton
class ChatRemoteSource extends BaseRemoteSource {
  ChatRemoteSource(DioClient client) : super(client.dio);

  Future<List<Chat>> getLastMsgWithUsers() async {
    return networkRequest<List<Chat>>(
      request: (dio) => dio.get('/chat/last-msg-with-users'),
      onResponse: (data) {
        final chats = data['data'];

        return chats.map<Chat>((chat) => Chat.fromJson(chat)).toList();
      },
    );
  }

  Future<List<Chat>> getMesagesWithUser({required String userID}) async {
    return networkRequest<List<Chat>>(
      request: (dio) => dio.get('/chat/messages/$userID'),
      onResponse: (data) {
        final chats = data['data'];

        return chats.map<Chat>((chat) => Chat.fromJson(chat)).toList();
      },
    );
  }
}
