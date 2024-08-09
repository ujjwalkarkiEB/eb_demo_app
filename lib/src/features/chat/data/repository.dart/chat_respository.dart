import 'package:eb_demo_app/core/utils/socket/socket_client_manager.dart';

import '../model/user.dart';

abstract class ChatRespository {
  Future<List<User>> getOnlineUsers();
}

class ChatRespositoryImpl implements ChatRespository {
  final SocketClientManager _socketClientManager;

  ChatRespositoryImpl(this._socketClientManager);
  @override
  Future<List<User>> getOnlineUsers() async {
    return _socketClientManager.onlineUsers;
  }
}
