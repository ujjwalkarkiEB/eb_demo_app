part of 'socket_bloc.dart';

sealed class SocketState {}

final class SocektInitial extends SocketState {}

final class SocketConnected extends SocketState {}

final class SocketDisConnected extends SocketState {}

final class OnlineUsersState extends SocketState {
  final List<User> onlineUsers;

  OnlineUsersState({required this.onlineUsers});
}

final class UserChatsLoaded extends SocketState {
  final List<Chat> chats;

  UserChatsLoaded({required this.chats});
}

final class UserChatsLoading extends SocketState {}

final class UserChatsLoadingFailed extends SocketState {
  final String msg;

  UserChatsLoadingFailed({required this.msg});
}

final class NewMessageState extends SocketState {
  final Chat recievedChat;

  NewMessageState({required this.recievedChat});
}
