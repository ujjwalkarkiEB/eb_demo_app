import 'package:bloc/bloc.dart';
import 'package:eb_demo_app/core/utils/socket/socket_client_manager.dart';
import 'package:eb_demo_app/src/features/chat/presentation/blocs/socket/socket_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/model/chat.dart';
import '../../../data/repository/chat_respository.dart';

part 'private_chat_room_event.dart';
part 'private_chat_room_state.dart';

class PrivateChatRoomBloc
    extends Bloc<PrivateChatRoomEvent, PrivateChatRoomState> {
  final SocketClientManager _socketClientManager;
  final ChatRespository _chatRespository;
  PrivateChatRoomBloc(this._socketClientManager, this._chatRespository)
      : super(PrivateChatsInitial()) {
    on<FetchPrivateChatsEvent>(_onFetchPrivateChats);
    on<NewPrivateMessageRecievedEvent>(_onPrivateMsgRecieved);
    on<LastMsgReadEvent>(_onChatReadEvent);
  }

  List<Chat> userChats = [];

  void _onFetchPrivateChats(
      FetchPrivateChatsEvent event, Emitter<PrivateChatRoomState> emit) async {
    emit(PrivateChatsLoading());
    final result =
        await _chatRespository.getMessagesWithUser(userID: event.senderId);
    result.fold(
      (l) => emit(PrivateChatsLoadError()),
      (chats) => emit(PrivateChatsLoaded(chats: chats)),
    );
  }

  void _onPrivateMsgRecieved(NewPrivateMessageRecievedEvent event,
      Emitter<PrivateChatRoomState> emit) async {
    userChats.insert(0, event.newChat);
    emit(NewPrivateChatRecievedState(newChats: userChats));
  }

  void _onChatReadEvent(
      LastMsgReadEvent event, Emitter<PrivateChatRoomState> emit) async {
    emit(LastChatReadState());
  }
}
