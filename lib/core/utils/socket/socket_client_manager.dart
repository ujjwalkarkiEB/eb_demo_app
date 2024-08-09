import 'dart:developer';
import 'package:eb_demo_app/core/utils/constants/strings.dart';
import 'package:eb_demo_app/core/utils/error/failure/failure.dart';
import 'package:eb_demo_app/core/utils/helpers/token_services.dart';
import 'package:eb_demo_app/core/utils/notification/notification_service.dart';
import 'package:injectable/injectable.dart';
import 'package:socket_io_client/socket_io_client.dart' as client;

import '../../../src/features/chat/data/model/user.dart';

@lazySingleton
class SocketClientManager {
  final TokenService _tokenService;
  final NotificationService _notificationService;
  late client.Socket _socket;
  // flag to check if socket connection is open already
  bool _isConnectionOpen = false;
  List<User> _onlineUsers = [];

  SocketClientManager(this._tokenService, this._notificationService);

  /// Opens socket connection for first time
  void openSocketConnection() async {
    final url = Uri.parse(socketConnectionuri);

    final authToken = await _tokenService.getAccessToken();
    if (authToken == null) {
      log('Socket: token missing!');
      return;
    }
    _socket = client.io(
        url.toString(),
        client.OptionBuilder()
            .setTransports(['websocket'])
            .enableAutoConnect()
            .setExtraHeaders({'authorization': "Bearer $authToken"})
            .build());

    _socket.connect();

    _socket.onConnect((_) {
      log('Socket Connection established');
      _listenForOnlineUsers();
      _listenForPrivateMessages();
    });

    _socket.onDisconnect((_) {
      log('Socket Connection disconnected');
    });

    _socket.onConnectError((err) {
      log('Connection error: $err');
    });

    _socket.onError((err) {
      log('Socket error: $err');
    });
  }

  /// Listen for the online users event
  void _listenForOnlineUsers() {
    _socket.on('listOnlineUsers', (data) {
      if (data is List) {
        _onlineUsers = data.map((userMap) => User.fromJson(userMap)).toList();
        print('online users: $onlineUsers');
      } else {
        log('Unexpected data format for online users: $data');
        throw const UnknownFailure('something went wrong!');
      }
    });
  }

  /// Listen for private messages
  void _listenForPrivateMessages() {
    _socket.on('privateMessage', (data) {
      log('Received private message: $data');
      _notificationService.showNotification(
          title: 'Message Recieved', body: 'Dolly has sent you a message!');
    });
  }

  /// Join a private chat room
  void joinPrivateChatRoom(String userId) {
    _socket.emit('joinPrivateChatRoom', {'userId': userId});
  }

  /// Send a private message
  void sendPrivateMessage(String receiverId, String message) {
    _socket.emit('privateMessage', {
      'receiver': receiverId,
      'message': message,
    });
    log('Private message sent: $message to $receiverId');
  }

  /// Disconnect the socket
  void disconnect() {
    _socket.disconnect();
    _socket.dispose();
    log('Socket disconnected and disposed');
  }

  /// Maintains socket connection on token refresh.
  ///
  /// Disconnects previous connection and adds new [token] in header for the connection.
  /// Will be called from authinterceptor side on successful session token i.e.access referesh.
  Future<void> maintainSocketConnection(String newToken) async {
    if (_isConnectionOpen) {
      _socket.disconnect();
      _socket.dispose();

      // Reconnect with the new token and assign the socket
      _socket = client.io(
          Uri.parse(socketConnectionuri).toString(),
          client.OptionBuilder()
              .setTransports(['websocket'])
              .enableAutoConnect()
              .setExtraHeaders({'authorization': "Bearer $newToken"})
              .build());

      _socket.connect();

      _socket.onConnect((_) {
        _isConnectionOpen = true;
        log('Socket Connection re-established after token refreshing');
        _listenForOnlineUsers();
        _listenForPrivateMessages();
      });

      _socket.onDisconnect((_) {
        _isConnectionOpen = false;
        log('Socket Connection disconnected ');
      });

      _socket.onConnectError((err) {
        log('Connection error: $err');
      });

      _socket.onError((err) {
        log('Socket error: $err');
      });
    }
  }

  /// Get the current list of online users
  List<User> get onlineUsers => _onlineUsers;
}
