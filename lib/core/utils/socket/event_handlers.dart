import 'dart:async';
import 'dart:developer';
import 'package:auto_route/auto_route.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:eb_demo_app/core/config/injection/injection.dart';
import 'package:eb_demo_app/core/config/route/app_route.dart';
import 'package:eb_demo_app/core/utils/notification/notification_service.dart';
import 'package:eb_demo_app/core/utils/socket/socket_setup.dart';
import 'package:eb_demo_app/src/features/chat/data/model/chat.dart';
import 'package:eb_demo_app/src/features/chat/data/model/user.dart';
import 'package:eb_demo_app/src/features/chat/presentation/blocs/private_chat/private_chat_room_bloc.dart';
import 'package:eb_demo_app/src/features/chat/presentation/blocs/socket/socket_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:socket_io_client/socket_io_client.dart' as client;
import '../../../core/utils/error/failure/failure.dart';
import '../../../src/features/authentication/data/data_source/local/auth_database_service.dart';

/// [_socket] is initialized only after first event handler is called because it avoids cyclic dependency injection
/// as [SockeSetup] initalizes socket instance after SocketClientManager opens connection
/// If we try initalize during construction of [SocetEventHanlder] , the socket field won't have initialized yet
@lazySingleton
class SocketEventHandlers {
  late final client.Socket _socket;
  late final SocketSetup _socketSetup;
  final NotificationService _notificationService;

  SocketEventHandlers(this._socketSetup, this._notificationService);

  void listenForOnlineUsers(
      StreamController<List<User>> onlineUsersController) {
    // initailized socket here
    _socket = _socketSetup.socket;
    _socket.on('listOnlineUsers', (data) {
      if (data is List) {
        List<User> onlineUsers =
            data.map((userMap) => User.fromJson(userMap)).toList();
        log('Online users: ${onlineUsers.length}');
        onlineUsersController.add(onlineUsers);
      } else {
        log('Unexpected data format for online users: $data');
        throw const UnknownFailure('Something went wrong!');
      }
    });
  }

  void listenForPrivateMessages(
      StreamController<Chat> privateMessageController) {
    // remove previous listener because listeners are added on every chat room join
    // which will cause duplication of messages
    // as more listeners added respectively [NewPrivateMessageRecievedEvent] will be added
    _socket.off('privateMessage');
    log('adasdasdasdadasdasdas');
    _socket.on('privateMessage', (data) {
      final Chat newChat = Chat.fromJson(data['chat']);
      getIt<PrivateChatRoomBloc>()
          .add(NewPrivateMessageRecievedEvent(newChat: newChat));
      _sendReceivedMessageReadStatus(receivedChat: newChat);
    });
  }

  void listenForReadChat() {
    final privateRoomBloc = getIt<PrivateChatRoomBloc>();
    final currentUserId = getIt<AuthDatabaseService>().getUserId();

    log('Reached listen to chat');
    _socket.on('isRead', (data) {
      final receivedChat = Chat.fromJson(data['chat']);
      if (receivedChat.sender.id == currentUserId) {
        privateRoomBloc.add(LastMsgReadEvent(chatId: receivedChat.id));
      }
    });
  }

  void listenForprivateMessageToUpdateChat() {
    _socket.on('privateMessageToUpdateChat', (data) {
      log("read: message receievd insde from chat");

      final receivedChat = Chat.fromJson(data['chat']);
      Future.delayed(const Duration(milliseconds: 100), () async {
        final isChatScreen = getIt<AppRouter>()
                .root
                .innerRouterOf<TabsRouter>(MainNavRoute.name)
                ?.activeIndex ==
            3;
        if (isChatScreen) {
          getIt<SocketBloc>()
              .add(RecievedNewMessageFromUserEvent(recievedChat: receivedChat));
        } else {
          await _notificationService
              .incrementBadgeCount(receivedChat.sender.id);
          _notificationService.showNotification(
              senderID: receivedChat.sender.id,
              title: receivedChat.sender.userName,
              body: 'New Message Recieved!',
              notificationLayout: NotificationLayout.Messaging,
              payload: {
                'senderId': receivedChat.sender.id,
                'senderUserName': receivedChat.sender.userName
              });
        }
      });
    });
  }

  void listenForTypingEvents(StreamController<bool> typingEventController) {
    _socket.on('typingStarted', (data) {
      log('Typing started event: $data');
      typingEventController.add(data['isTyping']);
    });

    _socket.on('typingStopped', (data) {
      log('Typing stopped event: $data');
      typingEventController.add(data['isTyping']);
    });
  }

  void _sendReceivedMessageReadStatus({required Chat receivedChat}) {
    final currentUserId = getIt<AuthDatabaseService>().getUserId();

    if (receivedChat.receiver.id == currentUserId) {
      _socket.emit('isRead',
          {'senderId': receivedChat.sender.id, 'chatId': receivedChat.id});
    }
  }
}
