import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:eb_demo_app/core/utils/socket/socket_client_manager.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../data/model/chat.dart';
import '../../../data/repository/chat_respository.dart';

part 'private_chat_room_event.dart';
part 'private_chat_room_state.dart';

enum Status { initial, loading, success, error, newChatRecieved, lastChatRead }

@lazySingleton
class PrivateChatRoomBloc
    extends Bloc<PrivateChatRoomEvent, PrivateChatRoomState> {
  final SocketClientManager _socketClientManager;
  final ChatRespository _chatRespository;

  PrivateChatRoomBloc(this._socketClientManager, this._chatRespository)
      : super(const PrivateChatRoomState(chats: [], status: Status.loading)) {
    on<FetchPrivateChatsEvent>(_onFetchPrivateChats);
    on<NewPrivateMessageRecievedEvent>(_onPrivateMsgRecieved);
    on<LastMsgReadEvent>(_onChatReadEvent);
    on<JoinPrivateChatRoomEvent>(_onJoinPrivateChatRoom);
    on<SendPrivateMsgEvent>(_onSendPrivateRoom);
    on<ResetBlocState>(
      (event, emit) =>
          emit(PrivateChatRoomState(chats: [], status: Status.loading)),
    );
  }

  List<Chat> userChats = [];

  void _onJoinPrivateChatRoom(JoinPrivateChatRoomEvent event,
      Emitter<PrivateChatRoomState> emit) async {
    _socketClientManager
      ..joinPrivateChatRoom(event.userId)
      ..listenForPrivateMessages()
      ..listenForTypingEvents()
      ..listenForReadChat();
  }

  void _onFetchPrivateChats(
      FetchPrivateChatsEvent event, Emitter<PrivateChatRoomState> emit) async {
    log('Fetching private chats for senderId: ${event.senderId}');
    final result =
        await _chatRespository.getMessagesWithUser(userID: event.senderId);
    result.fold(
      (l) => emit(state.copyWith(status: Status.error)),
      (chats) {
        emit(state.copyWith(chats: chats, status: Status.success));
        log('Fetched chats: ${chats.length}');
      },
    );
  }

  void _onSendPrivateRoom(
      SendPrivateMsgEvent event, Emitter<PrivateChatRoomState> emit) async {
    _socketClientManager.sendPrivateMessage(
        receiverId: event.receiverId,
        message: event.message,
        senderId: event.senderId);
  }

  void _onPrivateMsgRecieved(NewPrivateMessageRecievedEvent event,
      Emitter<PrivateChatRoomState> emit) async {
    log('New message received: ${event.newChat.message}');
    // Add the new chat to the list
    final updatedChats = List<Chat>.from(state.chats)..add(event.newChat);

    // Emit the new state with the updated list of chats
    emit(state.copyWith(
      chats: updatedChats,
      status: Status.newChatRecieved,
    ));
  }

  void _onChatReadEvent(
      LastMsgReadEvent event, Emitter<PrivateChatRoomState> emit) async {
    final updatedChats = state.chats.map((chat) {
      if (chat.id == event.chatId) {
        return chat.copyWith(isRead: true);
      }
      return chat;
    }).toList();

    emit(state.copyWith(
      chats: updatedChats,
      status: Status.lastChatRead,
    ));
  }

  @override
  void onTransition(
      Transition<PrivateChatRoomEvent, PrivateChatRoomState> transition) {
    super.onTransition(transition);
    log('Transition from ${transition.currentState.status} to ${transition.nextState.status}');
  }
}
