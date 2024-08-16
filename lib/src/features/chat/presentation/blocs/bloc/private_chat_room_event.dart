part of 'private_chat_room_bloc.dart';

sealed class PrivateChatRoomEvent {}

final class FetchPrivateChatsEvent extends PrivateChatRoomEvent {
  final String senderId;

  FetchPrivateChatsEvent({required this.senderId});
}

final class NewPrivateMessageRecievedEvent extends PrivateChatRoomEvent {
  final Chat newChat;

  NewPrivateMessageRecievedEvent({required this.newChat});
}
