import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:eb_demo_app/core/utils/socket/socket_client_manager.dart';
import 'package:eb_demo_app/src/features/chat/data/repository/chat_respository.dart';
import 'package:injectable/injectable.dart';

import '../../../data/model/chat.dart';
import '../../../data/model/user.dart';

part 'socket_event.dart';
part 'socket_state.dart';

@injectable
class SocketBloc extends Bloc<SocketEvent, SocketState> {
  final SocketClientManager _socketClientManager;
  final ChatRespository _chatRespository;
  StreamSubscription<List<User>>? _onlineUserSubscription;
  StreamSubscription<List<User>>? _privateMessageSubscription;

  SocketBloc(this._socketClientManager, this._chatRespository)
      : super(SocektInitial()) {
    _socketClientManager.openSocketConnection();

    on<OpenSocketConnection>(_onOpenSocket);
    on<GetOnlineUsers>(_onOnlineUsersEvent);
    on<GetLastMsgWithUsers>(_onGetLastMsgEvent);
    on<JoinPrivateChatRoom>(_onJoinPrivateRoom);
    on<SendPrivateMsg>(_onSendPrivateRoom);
    on<GetAllMessagesWithUser>(_onGetMessagesEvent);
    on<PrivateMessageRecievedEvent>(_onPrivateMesageRecieved);
  }
  List<Chat> privateMessages = [];

  void _onOpenSocket(OpenSocketConnection event, Emitter<SocketState> emit) {
    _socketClientManager.openSocketConnection();
    _onlineUserSubscription = _socketClientManager.onlineUsersStream.listen(
      (users) => add(GetOnlineUsers()),
    );
  }

  void _onOnlineUsersEvent(GetOnlineUsers event, Emitter<SocketState> emit) {
    emit(OnlineUsersState(onlineUsers: _socketClientManager.onlineUsers));
  }

  void _onGetLastMsgEvent(
      GetLastMsgWithUsers event, Emitter<SocketState> emit) async {
    final result = await _chatRespository.getLastMsgWithUsers();
    result.fold(
      (failure) => emit(UserChatsLoadingFailed(msg: failure.failureMsg!)),
      (chats) => emit(UserChatsLoaded(chats: chats)),
    );
  }

  void _onJoinPrivateRoom(
      JoinPrivateChatRoom event, Emitter<SocketState> emit) async {
    _socketClientManager
      ..joinPrivateChatRoom(event.userId)
      ..listenForPrivateMessages();
  }

  void _onSendPrivateRoom(
      SendPrivateMsg event, Emitter<SocketState> emit) async {
    _socketClientManager.sendPrivateMessage(
        receiverId: event.receiverId, message: event.message);
    _socketClientManager.privateMessageStream
        .listen((chat) => add(PrivateMessageRecievedEvent(newChat: chat)));
  }

  void _onGetMessagesEvent(
      GetAllMessagesWithUser event, Emitter<SocketState> emit) async {
    final result =
        await _chatRespository.getMessagesWithUser(userID: event.userID);
    result.fold(
      (failure) => emit(UserChatsLoadingFailed(msg: failure.failureMsg!)),
      (chats) {
        privateMessages = chats;
        emit(PrivateMessageRecievedState(privateMessages: privateMessages));
      },
    );
  }

  void _onPrivateMesageRecieved(
      PrivateMessageRecievedEvent event, Emitter<SocketState> emit) async {
    privateMessages.add(event.newChat);
    emit(PrivateMessageRecievedState(privateMessages: privateMessages));
  }

  @override
  Future<void> close() {
    _onlineUserSubscription!.cancel();
    _socketClientManager.disconnect();

    return super.close();
  }

  @override
  void onTransition(Transition<SocketEvent, SocketState> transition) {
    super.onTransition(transition);
    print(transition);
  }
}
