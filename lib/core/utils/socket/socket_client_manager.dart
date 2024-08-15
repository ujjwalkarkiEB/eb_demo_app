import 'dart:async';
import 'dart:developer';
import 'package:eb_demo_app/core/utils/constants/strings.dart';
import 'package:eb_demo_app/core/utils/error/failure/failure.dart';
import 'package:eb_demo_app/core/utils/helpers/token_services.dart';
import 'package:eb_demo_app/core/utils/notification/notification_service.dart';
import 'package:eb_demo_app/src/features/chat/data/model/chat.dart';
import 'package:flutter/material.dart';
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
  // stream controller for active users
  final _onlineUsersController = StreamController<List<User>>.broadcast();
  Stream<List<User>> get onlineUsersStream => _onlineUsersController.stream;

  // stream controller for private chat
  final _privateMessageController = StreamController<Chat>.broadcast();
  Stream<Chat> get privateMessageStream => _privateMessageController.stream;
//
  final _typingEventController = StreamController<bool>.broadcast();
  Stream<bool> get typingEventStream => _typingEventController.stream;

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
  _listenForOnlineUsers() {
    _socket.on('listOnlineUsers', (data) {
      if (data is List) {
        _onlineUsers = data.map((userMap) => User.fromJson(userMap)).toList();
        _onlineUsersController.add(_onlineUsers);
      } else {
        log('Unexpected data format for online users: $data');
        throw const UnknownFailure('something went wrong!');
      }
    });
  }

  /// Listen for private messages
  void listenForPrivateMessages() {
    _socket.on('privateMessage', (data) {
      final Chat newChat = Chat.fromJson(data['chat']);
      log('chat recieved : ${newChat} ');
      _privateMessageController.add(newChat);
      // _notificationService.showNotification(
      //     title: 'Message Recieved', body: 'Dolly has sent you a message!');
    });
  }

  /// Join a private chat room
  void joinPrivateChatRoom(String userId) {
    _socket.emit('joinPrivateChatRoom', {'userId': userId});
    _listenForTypingEvents();
  }

  /// Send a private message
  void sendPrivateMessage(
      {required String receiverId, required String message}) {
    if (message.isEmpty) {
      return;
    }
    _socket.emit('privateMessage', {
      'receiver': receiverId,
      'message': message,
    });
    log('Private message sent: $message to $receiverId');
  }

  // Listen for typing events
  void _listenForTypingEvents() {
    _socket.on('typingStarted', (data) {
      log('Typing started event: $data');
      _typingEventController.add(data['isTyping']);
    });

    _socket.on('typingStopped', (data) {
      log('Typing stopped event: $data');
      _typingEventController.add(data['isTyping']);
    });
  }

  // Send typing event to server
  void sendTypingEvent({required bool isTyping, required String recieverId}) {
    final event = isTyping ? 'typingStarted' : 'typingStopped';
    _socket.emit(event, {'userId': recieverId});
    log('$event event sent to $recieverId');
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
