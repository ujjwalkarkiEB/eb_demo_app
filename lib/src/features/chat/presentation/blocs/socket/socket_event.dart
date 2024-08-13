part of 'socket_bloc.dart';

sealed class SocketEvent {}

final class OpenSocketConnection extends SocketEvent {}

final class CloseSocektConnection extends SocketEvent {}

final class GetOnlineUsers extends SocketEvent {}

final class GetLastMsgWithUsers extends SocketEvent {}

final class GetAllMessagesWithUser extends SocketEvent {
  final String userID;

  GetAllMessagesWithUser({required this.userID});
}

// events for chat room
final class JoinPrivateChatRoom extends SocketEvent {
  final String userId;

  JoinPrivateChatRoom({required this.userId});
}

final class PrivateMessageRecievedEvent extends SocketEvent {
  final Chat? newChat;

  PrivateMessageRecievedEvent({this.newChat});
}

final class SendPrivateMsg extends SocketEvent {
  final String receiverId;
  final String message;

  SendPrivateMsg({required this.receiverId, required this.message});
}
