part of 'private_chat_room_bloc.dart';

sealed class PrivateChatRoomEvent {}

final class FetchPrivateChatsEvent extends PrivateChatRoomEvent {
  final String senderId;

  FetchPrivateChatsEvent({required this.senderId});
}

final class JoinPrivateChatRoomEvent extends PrivateChatRoomEvent {
  final String userId;

  JoinPrivateChatRoomEvent({required this.userId});
}

final class NewPrivateMessageRecievedEvent extends PrivateChatRoomEvent {
  final Chat newChat;

  NewPrivateMessageRecievedEvent({required this.newChat});
}

final class SendPrivateMsgEvent extends PrivateChatRoomEvent {
  final String receiverId;
  final String message;

  SendPrivateMsgEvent({required this.receiverId, required this.message});
}

final class LastMsgReadEvent extends PrivateChatRoomEvent {
  final String chatId;

  LastMsgReadEvent({required this.chatId});
}

final class ResetBlocState extends PrivateChatRoomEvent {}
