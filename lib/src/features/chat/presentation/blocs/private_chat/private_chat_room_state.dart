part of 'private_chat_room_bloc.dart';

enum Status { initial, loading, success, error, newChatRecieved, lastChatRead }

class PrivateChatRoomState extends Equatable {
  final Status status;
  final List<Chat> chats;
  @override
  List<Object?> get props => [status, chats];

  const PrivateChatRoomState(
      {this.status = Status.loading, required this.chats});

  PrivateChatRoomState copyWith({Status? status, List<Chat>? chats}) {
    return PrivateChatRoomState(
        chats: chats ?? this.chats, status: status ?? this.status);
  }
}

// final class PrivateChatsInitial extends PrivateChatRoomState {
//   PrivateChatsInitial({required super.chats});
// }

// final class PrivateChatsLoaded extends PrivateChatRoomState {
//   PrivateChatsLoaded({required super.chats});
// }

// final class PrivateChatsLoadError extends PrivateChatRoomState {
//   PrivateChatsLoadError({required super.chats});
// }

// final class PrivateChatsLoading extends PrivateChatRoomState {
//   PrivateChatsLoading({required super.chats});
// }

// final class NewPrivateChatRecievedState extends PrivateChatRoomState {
//   NewPrivateChatRecievedState({required super.chats});
// }

// final class LastChatReadState extends PrivateChatRoomState {}
