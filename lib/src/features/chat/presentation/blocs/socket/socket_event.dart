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

final class RecievedNewMessageFromUserEvent extends SocketEvent {
  final Chat recievedChat;

  RecievedNewMessageFromUserEvent({required this.recievedChat});
}
