import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:eb_demo_app/core/config/injection/injection.dart';
import 'package:eb_demo_app/core/utils/socket/socket_client_manager.dart';
import 'package:eb_demo_app/src/features/chat/data/repository/chat_respository.dart';
import 'package:injectable/injectable.dart';

import '../../../../authentication/data/data_source/local/auth_database_service.dart';
import '../../../data/model/chat.dart';
import '../../../data/model/user.dart';

part 'socket_event.dart';
part 'socket_state.dart';

@injectable
class SocketBloc extends Bloc<SocketEvent, SocketState> {
  final SocketClientManager _socketClientManager;
  final ChatRespository _chatRespository;
  StreamSubscription<List<User>>? _onlineUserSubscription;
  StreamSubscription<Chat>? _privateMessageSubscription;

  SocketBloc(this._socketClientManager, this._chatRespository)
      : super(SocektInitial()) {
    _socketClientManager.openSocketConnection();

    on<OpenSocketConnection>(_onOpenSocket);
    on<GetOnlineUsers>(_onOnlineUsersEvent);
    on<GetLastMsgWithUsers>(_onGetLastMsgEvent);
    on<JoinPrivateChatRoom>(_onJoinPrivateChatRoom);
    on<SendPrivateMsg>(_onSendPrivateRoom);
    on<GetAllMessagesWithUser>(_onGetMessagesEvent);
    on<PrivateMessageRecievedEvent>(_onPrivateMessageReceived);
  }

  List<Chat> privateMessages = [];
  final currentUserId = getIt<AuthDatabaseService>().getUserId();

  void _onOpenSocket(OpenSocketConnection event, Emitter<SocketState> emit) {
    _socketClientManager
      ..openSocketConnection()
      ..listenForPrivateMessages();
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
      (failure) {
        privateMessages = [];
        emit(UserChatsLoadingFailed(msg: failure.failureMsg!));
      },
      (chats) => emit(UserChatsLoaded(chats: chats)),
    );
  }

  void _onJoinPrivateChatRoom(
      JoinPrivateChatRoom event, Emitter<SocketState> emit) async {
    _socketClientManager.joinPrivateChatRoom(event.userId);

    _privateMessageSubscription?.cancel();
    _privateMessageSubscription =
        _socketClientManager.privateMessageStream.listen(
      (chat) => add(PrivateMessageRecievedEvent(newChat: chat)),
    );
  }

  void _onSendPrivateRoom(
      SendPrivateMsg event, Emitter<SocketState> emit) async {
    _socketClientManager.sendPrivateMessage(
        receiverId: event.receiverId, message: event.message);
  }

  void _onGetMessagesEvent(
      GetAllMessagesWithUser event, Emitter<SocketState> emit) async {
    final result =
        await _chatRespository.getMessagesWithUser(userID: event.userID);
    result.fold(
      (failure) => emit(UserChatsLoadingFailed(msg: failure.failureMsg!)),
      (chats) {
        privateMessages = chats;
        emit(UserPrivateChatsLoaded(chats: privateMessages));
      },
    );
  }

  void _onPrivateMessageReceived(
      PrivateMessageRecievedEvent event, Emitter<SocketState> emit) {
    emit(PrivateMessageRecievedState(newChat: event.newChat!));
  }

  @override
  Future<void> close() {
    _onlineUserSubscription?.cancel();
    _privateMessageSubscription?.cancel();
    _socketClientManager.disconnect();
    return super.close();
  }

  @override
  void onTransition(Transition<SocketEvent, SocketState> transition) {
    super.onTransition(transition);
    log('Socket transition: $transition');
  }
}
