part of 'private_chat_room_bloc.dart';

sealed class PrivateChatRoomState {}

final class PrivateChatsInitial extends PrivateChatRoomState {}

final class PrivateChatsLoaded extends PrivateChatRoomState {
  final List<Chat> chats;

  PrivateChatsLoaded({required this.chats});
}

final class PrivateChatsLoadError extends PrivateChatRoomState {}

final class PrivateChatsLoading extends PrivateChatRoomState {}

final class NewPrivateChatRecievedState extends PrivateChatRoomState {
  final List<Chat> newChats;

  NewPrivateChatRecievedState({required this.newChats});
}
