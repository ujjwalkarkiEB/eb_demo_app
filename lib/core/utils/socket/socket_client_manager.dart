import 'dart:async';

import 'package:injectable/injectable.dart';
import '../../../src/features/chat/data/model/chat.dart';
import '../../../src/features/chat/data/model/user.dart';
import 'event_handlers.dart';
import 'socket_setup.dart';

@lazySingleton
class SocketClientManager {
  final SocketSetup _socketSetup;
  final SocketEventHandlers _eventHandlers;
  bool _isPrivateMessagesListenerAdded = false;

  final _onlineUsersController = StreamController<List<User>>();
  Stream<List<User>> get onlineUsersStream => _onlineUsersController.stream;

  final _privateMessageController = StreamController<Chat>();
  Stream<Chat> get privateMessageStream => _privateMessageController.stream;

  final _typingEventController = StreamController<bool>.broadcast();
  Stream<bool> get typingEventStream => _typingEventController.stream;

  SocketClientManager(this._socketSetup, this._eventHandlers);

  void openSocketConnection() async {
    if (!_socketSetup.isConnectionOpen) {
      await _socketSetup.openSocketConnection();
      _eventHandlers.listenForOnlineUsers(_onlineUsersController);
    }
  }

  void listenForPrivateMessages() =>
      _eventHandlers.listenForPrivateMessages(_privateMessageController);

  void listenForReadChat() => _eventHandlers.listenForReadChat();

  void listenForTypingEvents() =>
      _eventHandlers.listenForTypingEvents(_typingEventController);

  void joinPrivateChatRoom(String userId) {
    _socketSetup.openSocketConnection();
    _socketSetup.socket.emit('joinPrivateChatRoom', {'userId': userId});
  }

  void leavePrivateChatRoom(String userId) {
    _socketSetup.socket.emit('leavePrivateChatRoom', {'userId': userId});
  }

  void sendPrivateMessage(
      {required String receiverId, required String message}) {
    if (message.isEmpty) return;
    _socketSetup.socket.emit('privateMessage', {
      'receiver': receiverId,
      'message': message,
    });
  }

  void sendTypingEvent({required bool isTyping, required String receiverId}) {
    _socketSetup.socket.emit(
        isTyping ? 'typingStarted' : 'typingStopped', {'userId': receiverId});
  }

  void disconnect() => _socketSetup.disconnect();

  Future<void> maintainSocketConnection(String newToken) =>
      _socketSetup.maintainSocketConnection(newToken);
}
